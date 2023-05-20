import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'ApiCou/Api/ApiCours.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'Td.dart';
class cours extends StatefulWidget {
  const cours({Key? key}) : super(key: key);

  @override
  State<cours> createState() => _coursState();
}

class _coursState extends State<cours> {
  String filecours=" ";
  String filecour=" ";
  PickCours()async{
    final fil =await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf','jpg','png']
    );
    if(fil!=null){
      setState(() {
        filecours=fil.files.single.path!;
        filecour = (filecours != null ? filecours.substring(filecours.lastIndexOf("/") + 1) : null)!;
        print(filecour);
        print('00');
      });
    }
  }
  TextEditingController descchapitre=TextEditingController();
  TextEditingController nomchap=TextEditingController();
  TextEditingController titre=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController cmntr=TextEditingController();
  Cours c = new Cours();
  late StreamController<List<dynamic>> _streamController ;
  late Stream<List<dynamic>> stream;
  Future<Map<String, dynamic>>  GetCours() async {
    http.Response response = await http.get(Uri.parse("http://192.168.1.37/ISIMM_eCampus/public/api/cours?matiere_id=1&classe_id=1"),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer 34|5swDq3pxoOYX1ZuAeCovj2DW10pjUyr73BXh9uXC',
        }
    );
    var data = jsonDecode(response.body) as  Map<String, dynamic> ;
    if (response.statusCode == 200) {
      print(data);
      return data;
    } else {
      print(response.statusCode);
      print(data);
    return data;
      //  _streamController.add(data.reversed.toList());
    }
  }

  @override
  void initState() {
    GetCours();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10,left:10,top: 60),
            height:300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF012869),Color(0xFF012869),
                    ]
                )
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                IconButton(onPressed:(){
                                  Navigator.pop(context);
                                }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                                Text('Espace Cours',style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(width: 150,),
                            Icon(Icons.notifications,color: Colors.white,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.08)
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search,color: Colors.white,)
                                ,
                                border: InputBorder.none
                                ,
                                hintText: "Search Cours ...",
                                hintStyle:TextStyle(
                                    color: Colors.white
                                )
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset('lib/matiere/Cours/image/1362248.png',fit: BoxFit.contain,),
                            )),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed:(){
                              Navigator.push(context,MaterialPageRoute(builder:(context)=>TD()));
                            }
                            ,child: Text('TD',style:TextStyle(color:Color(0xFFc2daee),fontWeight: FontWeight.bold,fontSize: 20),))
                      ],
                    ),
                    SizedBox(width: 10,),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset('lib/matiere/Cours/image/760205.png',fit: BoxFit.contain,),
                            )),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed:(){}
                            ,child: Text('Examen',style:TextStyle(color:Color(0xFFc2daee),fontWeight: FontWeight.bold,fontSize: 20),))
                      ],
                    ),
                    SizedBox(width: 8,),
                    Column(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset('lib/matiere/Cours/image/1263925.png',fit: BoxFit.contain,),
                            )),
                        SizedBox(height: 10,),
                        TextButton(
                            onPressed:(){}
                            ,child: Text('Other Files',style:TextStyle(color:Color(0xFFc2daee),fontWeight: FontWeight.bold,fontSize: 20),))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(child:Container(
            padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child:
            StreamBuilder<Map<String,dynamic>>(
              stream:Stream.fromFuture(GetCours()),
              builder:(context,AsyncSnapshot <Map<String,dynamic>> Snapshot) {
    if (!Snapshot.hasData) {
    return Center(child: CircularProgressIndicator());
    } else if (Snapshot.hasError) {
    return Text("${Snapshot.error}");
    } else {
                List<dynamic> cours = Snapshot.data!['cours'];
                print(cours);
                return ListView.builder(
                scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: cours.length
            ,itemBuilder:(context,id){
            return Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [
            Colors.grey.withOpacity(0.07),
            Colors.grey.withOpacity(0.09),
            ]
            ),
            borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
            leading:CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Image.asset('lib/matiere/Cours/image/format-de-fichier-pdf.png')),
            subtitle: Text(cours[id]['titre']),
            title:Text(cours[id]['description'],style:TextStyle(fontWeight: FontWeight.bold),),
            trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PopupMenuButton(itemBuilder: (BuildContext context)=>[
                PopupMenuItem(value: 'modifier', child: Text('Modifier')),
                PopupMenuItem(value: 'supprimer', child: Text('Supprimer')),
              ],
                onSelected:(value){
                  if(value=='supprimer'){
                    setState(() {
                      c.DeleteCours(1, 1, cours[id]['id']);
                      GetCours();
                    });
                  }else if (value=='modifier'){
                    print('modifier');
                 var titmod= TextEditingController(text:cours[id]['titre']);
               var descmod= TextEditingController(text:cours[id]['description']);
                    showDialog(context: context, builder:(context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        content: Container(
                          height: 350,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text('Commentaire',style:TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 20,),
                              TextFormField(
                                controller:titmod,
                                decoration: InputDecoration(
                                  hintText: "Titre",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple),
                                  ),
                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple),

                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              TextFormField(
                                controller: descmod,
                                maxLines: 7,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple),
                                  ),
                                  focusedBorder:
                                  OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple),

                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              ElevatedButton(onPressed:(){
                                print(titmod.text);
                                print(descmod.text);
                                setState(() {
                                  c.PostCours(titmod.text, descmod.text, File(filecours), 1, 1);
                                  GetCours();
                                });
                              //  titmod.text, descmod.text,cours[id]['id']
                                Navigator.of(context).pop(null);
                              }, child: Text('Ajouteeeer'),)
                            ],
                          ),
                        ),
                      );
                    } );

                  }
                },
              ),
            SizedBox(width: 10,),
            CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.05),
            radius: 10,
            child: IconButton(icon:Icon(Icons.download),onPressed:(){},),
            )
            ],
            ),
            ),
            );
            });}
            }
            ),
          ))
        ],
      ),
      floatingActionButton:CircleAvatar(
        backgroundColor:Color(0xFF012869),
        child:  IconButton(onPressed:(){
          showDialog(context: context, builder:(context){
            return AlertDialog(
              content: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                height: 360,
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title du Chapitre",style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF012869)),),
                    SizedBox(height: 5,),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: ('nom du chapitre...')
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text("Desciption du Chapitre",style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF012869)),),
                    SizedBox(height: 5,),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: ('nom du chapitre...')
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          PickCours();
                        },
                        child: Text('Téléverser Examen',style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF012869)),)
                    ),
                    SizedBox(height: 5,),
                    Text(filecour ?? ''),
                    SizedBox(height: 5,),
                    ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF012869)
                      ),
                      onPressed: () {
                       setState(() {
                         c.PostCours(titre.text,description.text,File(filecours), 1, 1);
                         GetCours();
                       });
                        Navigator.of(context).pop(null);
                      },
                      child: Center(
                          child: Text('Ajouter Cours')
                      ),
                    )
                ]),
              ),
            );
          });
        },icon:Icon(Icons.add),color: Colors.white,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
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
