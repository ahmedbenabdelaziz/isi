import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:untitled62/annonce/ApiAnnonce.dart';
class Raa extends StatefulWidget {
  const Raa({Key? key}) : super(key: key);

  @override
  State<Raa> createState() => _RaaState();
}

class _RaaState extends State<Raa> {
  TextEditingController annonce = TextEditingController();
  TextEditingController textannonce = TextEditingController();

  StreamController<Map<String, dynamic>> _streamController = StreamController.broadcast();


  ApiAnnonce com = ApiAnnonce();

  String? im;
  String? a;


  Future<Map<String, dynamic>> getAnnonce() async {
    Map<String, String> headers = {
      'Authorization': 'Bearer 2|pE4Et5zrUn1x6PZHOSnWagH3b17QI4tv3KIxvgNN',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    HttpClient client = new HttpClient()
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

    final response = await http.get(
      Uri.parse('https://192.168.1.21/ISIMM_eCampus/public/api/annonces'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('rrrrrr');
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      return jsonData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  void PickFile()async{
    final data =await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png','jpg']
    );
    if(data!=null){
      setState(() {
        im=data.files.single.path! ;
        a = (im != null ? im!.substring(im!.lastIndexOf("/") + 1) : null)!;
        print(a);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print('object');

    getAnnonce();
    print('object');
    setState(() {
      _streamController =  StreamController.broadcast();;
      getAnnonce();
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 32,color: Colors.white,),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF012869),
            ),
            child: Row(
              children: [
                IconButton(onPressed:(){}, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                Text('Actualités',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,letterSpacing: 1),),
                SizedBox(width: 200,),
                CircleAvatar(
                  backgroundImage:AssetImage('lib/students/iconacceuil/sdq.jpg'),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 80,
            color: Colors.white,
            child:Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:AssetImage('lib/annonce/343101852_761963091991078_3927862018311633401_n.jpg'),
                ),
                SizedBox(width: 7,),
                Container(
                  height: 40,
                  width: 270,
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 10),
                    child: GestureDetector(
                      onTap:(){
                        showDialog(context:context, builder:(context){
                          return AlertDialog(
                            content:SizedBox(
                              height: 350,
                              width: 400,
                              child: Column(
                                children: [
                                  Text('Publier une Annonce',style:TextStyle(fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                  Divider(
                                    thickness: 2,
                                  ),
                                  TextFormField(
                                    controller: textannonce,
                                    maxLines: 10,
                                    decoration:InputDecoration(
                                        hintText: "publier quellque chose ..."
                                    ),
                                  ),
                                  Container(
                                    child:Row(
                                      children: [
                                        TextButton(onPressed:(){
                                          PickFile();
                                        }, child:Text('Ajouter une image')),
                                        IconButton(onPressed:(){}, icon:Icon(Icons.picture_as_pdf,color: Colors.green,size: 30,))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      width: 400
                                      ,child: ElevatedButton(onPressed:(){
                                    com.postAnnonce(textannonce.text,im!);
                                  }, child:Text('Publier')))
                                ],
                              ),
                            ),
                          );
                        });
                      }
                      ,
                      child: Text('Publier quelleque chose...'),
                    ),
                  ),
                ),
                SizedBox(width: 11,),
                Icon(Icons.picture_as_pdf,color: Colors.green,size: 22,)
              ],
            ),
          ),
          Divider(
            thickness: 5,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: StreamBuilder(
                  stream: Stream.fromFuture(getAnnonce()),
                  builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                    Map<String, dynamic> data = snapshot.data!;
                    List<dynamic> annonces = snapshot.data!['annonces'];
                    List<dynamic> proprietaires = snapshot.data!['proprietaires'];
                    List<dynamic> soutitre = snapshot.data!['soutitre'];
                    print(annonces);
                    print(annonces.length);
                    print(soutitre);
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return ListView.builder(
                          itemCount: annonces.length,
                          itemBuilder: (context, id) {
                            final dateTime = DateTime.parse(annonces[id]['created_at']);
                            //  final formattedDate =  DateFormat('MMM dd, yyyy HH:mm').format(dateTime);
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          /*   proprietaires[id]['image']!=null? CircleAvatar(
                              backgroundImage:NetworkImage("https://192.168.1.21/ISIMM_eCampus/storage/app/public/${proprietaires[id]['image']}"),
                            ):Text('d'),*/
                                          SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              /* Text(proprietaires[id]['nom']+' ${proprietaires[id]['prenom']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                SizedBox(height: 3,),*/
                                              Text(soutitre[0],
                                                  style: TextStyle(color: Colors.grey,fontSize: 14)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      PopupMenuButton(
                                        child: Icon(Icons.more_vert),
                                        itemBuilder: (BuildContext context) =>
                                        [
                                          PopupMenuItem(
                                              value: 'modifier', child: Text('Modifier')),
                                          PopupMenuItem(
                                              value: 'supprimer', child: Text('Supprimer')),
                                        ],
                                        onSelected: (value) {
                                          if (value == 'supprimer') {
                                            setState(() {
                                              com.deleteAnnouncement(annonces[id]['id']);
                                              getAnnonce();
                                            });
                                          } else if (value == 'modifier') {
                                            final tita = TextEditingController(
                                                text: annonces[id]['description']);
                                            showDialog(context:context, builder:(context){
                                              return AlertDialog(
                                                content:SizedBox(
                                                  height: 350,
                                                  width: 400,
                                                  child: Column(
                                                    children: [
                                                      Text('Publier une Annonce',style:TextStyle(fontWeight: FontWeight.bold),),
                                                      SizedBox(height: 5,),
                                                      Divider(
                                                        thickness: 2,
                                                      ),
                                                      TextFormField(
                                                        controller: tita,
                                                        maxLines: 10,
                                                        decoration:InputDecoration(
                                                        ),
                                                      ),
                                                      Container(
                                                        child:Row(
                                                          children: [
                                                            TextButton(onPressed:(){
                                                              PickFile();
                                                            }, child:Text('Ajouter une image')),
                                                            IconButton(onPressed:(){}, icon:Icon(Icons.picture_as_pdf,color: Colors.green,size: 30,))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: 400
                                                          ,child: ElevatedButton(onPressed:(){
                                                        com.postAnnonce(tita.text,im!);
                                                      }, child:Text('Modifier')))
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, left: 20, right:5, bottom: 8),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: ExpandableText(
                                      annonces[id]['description'],
                                      textAlign: TextAlign.left,
                                      expandText: 'Read More',
                                      maxLines: 4,
                                      linkColor: Colors.blue,
                                      style: TextStyle(fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          height: 1.4),
                                    ),
                                  ),
                                ),
                                if(annonces[id]['image']!=null)
                                  Padding
                                    (padding:EdgeInsets.only(left: 15.0,right:15,top: 5),
                                    child:Image.network("https://192.168.1.21/ISIMM_eCampus/storage/app/public/${annonces[id]['image']}"),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('4 hours ,12 minutes ago',
                                        style: TextStyle(color: Colors.grey),)
                                      , Row(
                                        children: [
                                          Text(annonces[id]['likes_count'].toString(), style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 15),),
                                          IconButton(onPressed: () {
                                            print(annonces[id]['id']);
                                            setState(() {
                                              com.LikeAnnonce(annonces[id]['id']);
                                              getAnnonce();
                                            });
                                          },
                                              icon: Icon(Icons.thumb_up, color: Colors.blue,)),
                                          Text(annonces[id]['deslikes_count'].toString(), style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 15),),
                                          IconButton(onPressed: () {
                                            print("dislike");
                                            print(annonces[id]['id']);
                                            print("dislike");
                                            setState(() {
                                              com.DisLikeAnnonce(annonces[id]['id']);
                                              getAnnonce();
                                            });
                                          },
                                              icon: Icon(
                                                Icons.thumb_down, color: Colors.blue,))

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 7,
                                  color: Colors.black.withOpacity(0.2),
                                )
                              ],
                            );
                          });
                    }
                  }),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Color(0xFF012869),
        selectedItemColor: Colors.red,
        unselectedItemColor: Color(0xFF385b9f),
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon:Icon(Icons.message),label: "Home"),
          BottomNavigationBarItem(icon:Icon(Icons.settings),label: "Home"),
          BottomNavigationBarItem(icon:Icon(Icons.notifications),label: "Home"),

        ],
      ),
    );
  }
}
