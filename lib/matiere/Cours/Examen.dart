import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ApiCou/Api/apiexamen.dart';
import 'Td.dart';

class Examen extends StatefulWidget {
  const Examen({Key? key}) : super(key: key);

  @override
  State<Examen> createState() => _ExamenState();
}

class _ExamenState extends State<Examen> {
  ExamenApi c =new ExamenApi();
  List? ListCours ;
  TextEditingController descchapitre=TextEditingController();
  TextEditingController nomchap=TextEditingController();
  TextEditingController titre=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController cmntr=TextEditingController();
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

  late StreamController<List<dynamic>> _streamController ;
  late Stream<List<dynamic>> stream;
  Future<Map<String, dynamic>> GetExamen() async {
    http.Response response = await http.get(Uri.parse("http://192.168.1.37/ISIMM_eCampus/public/api/examens?matiere_id=1&classe_id=1"),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer 34|5swDq3pxoOYX1ZuAeCovj2DW10pjUyr73BXh9uXC',
        }
    );
    var data = jsonDecode(response.body)as Map<String,dynamic>;
    if (response.statusCode == 200) {
      print(data);
     return data;
    } else {
      print(response.statusCode);
      print(data);
//      _streamController.add(data.reversed.toList());
  return data;
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _streamController =  StreamController.broadcast();;
      stream =_streamController.stream;
      GetExamen();
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
      body: Column(
        children: [
          Container(
            height: 32,
            color: Colors.white,
          ),
          Container(
            padding: EdgeInsets.only(right: 10,left:10,top: 20),
            height:270,
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
                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>TD()));
                                }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                                Text('Espace Examen',style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
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
                                hintText: "Recherche Examen ...",
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
                            onPressed:(){}
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
                            ,child: Text('Cours',style:TextStyle(color:Color(0xFFc2daee),fontWeight: FontWeight.bold,fontSize: 20),))
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

            child: StreamBuilder(
              stream:Stream.fromFuture(GetExamen()),
              builder: (BuildContext context, AsyncSnapshot<Map<String,dynamic>> snapshot) {
               print(snapshot.data);
                if(snapshot.hasData){
                  List<dynamic> examen = snapshot.data!['cours'];
                  print(examen);
                  // utilise la méthode reversed() pour inverser l'ordre des commentaires
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:examen.length
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
                            child: Image.asset('lib/Views/LoginUser/applicationpdf_103614.png')),
                        subtitle: Text("snapshot.data![id]['titre']"),
                        title:Text(examen[id]['description'],style:TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PopupMenuButton(itemBuilder: (BuildContext context)=>[
                          PopupMenuItem(value: 'modifier', child: Text('Modifier')),
                      PopupMenuItem(value: 'supprimer', child: Text('Supprimer')),
                      ],
                            onSelected:(value){
                              if(value=='supprimer'){
                                c.DeleteExamen(1, 1,snapshot.data![id]['id']);
                              }else if (value=='modifier') {
                                print('modifier');
                                final tita = TextEditingController(
                                    text: snapshot.data![id]['titre']);
                                final desca = TextEditingController(
                                    text: snapshot.data![id]['description']);
                                showDialog(
                                    context: context, builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20),
                                      height: 320,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text("Titre d'examen"),
                                          SizedBox(height: 3,),
                                          TextFormField(
                                            controller: desca,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.blue
                                                    )
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.blue
                                                    )
                                                ),
                                                hintText: ('nom du chapitre...')
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Desciption d'examen"),
                                          SizedBox(height: 3,),
                                          TextFormField(
                                            controller: tita,
                                            maxLines: 2,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.blue
                                                    )
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(10),
                                                    borderSide: BorderSide(
                                                        color: Colors.blue
                                                    )
                                                ),
                                                hintText: ('description examen...')
                                            ),
                                          ),
                                          SizedBox(height: 25,),
                                          ElevatedButton(onPressed: () {
                                            c.UpdateExamen(tita.text, desca.text);
                                            GetExamen();
                                            Navigator.of(context).pop(null);
                                          }, child: Center(
                                              child: Text('Modifier Examen')))
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }
                            },),
                            CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.05),
                              radius: 13,
                              child: IconButton(icon:Icon(Icons.download),onPressed:(){
                              },),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // Display a loading spinner while waiting for data
                return Center(child: CircularProgressIndicator());
              },

            ),
          ))
        ],
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor:Color(0xFF3b4790),
        child: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      height: 400,
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Titre d'examen"),
                          SizedBox(height: 5,),
                          TextFormField(
                            controller: description,
                            decoration: InputDecoration(
                                hintText: ("nom d'examen...")
                            ),
                          ),
                          SizedBox(height: 30,),
                          Text("Description d'examen"),
                          SizedBox(height: 5,),
                          TextFormField(
                            controller: titre,
                            decoration: InputDecoration(
                                hintText: ("Description d'Examen...")
                            ),
                          ),
                          SizedBox(height: 5,),
                          TextButton(
                              onPressed: () {
                                PickCours();
                              },
                              child: Text('Téléverser Examen')
                          ),
                          SizedBox(height: 5,),
                          Text(filecour ?? ''),
                          SizedBox(height: 30,),
                          ElevatedButton(
                            onPressed: () {
                              c.PostExamen(titre.text, description.text,File(filecours),);
                           GetExamen();
                            Navigator.of(context).pop(null);
                            },
                            child: Center(
                                child: Text('Ajouter Examen')
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
          },
          icon: Icon(Icons.add),
          color: Colors.white,
        ),
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
