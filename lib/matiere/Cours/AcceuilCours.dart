import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'cours.dart';
import 'ApiCou/Api/ApiEspaceCours.dart';
import 'Examen.dart';
import 'Td.dart';
import 'package:intl/intl.dart';

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {

  TextEditingController titr= TextEditingController();
  TextEditingController desc= TextEditingController();
  ApiComment com =new ApiComment();
  late StreamController<List<dynamic>> _streamController ;
  late Stream<List<dynamic>> stream;
  GetCommantaire() async {
    http.Response response = await http.get(Uri.parse("http://192.168.1.37/ISIMM_eCampus/public/api/remarques?matiere_id=1&classe_id=1"),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer 30|9GpayZ2GvoL209JkdOCwKSt7m6mu3iUpmfo5sGZB',
        }
    );
    var data = jsonDecode(response.body)['remarques'];
    if (response.statusCode == 200) {
      setState(() {
        _streamController.add(data);
      });
    } else {
      print(response.statusCode);
      print(response.body);
      _streamController.add(data.reversed.toList());
    }
  }

  @override
  void initState() {
   super.initState();
   setState(() {
     _streamController =  StreamController.broadcast();;
     stream =_streamController.stream;
     GetCommantaire();
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
     // backgroundColor:Color(0xFF3b4790),
      backgroundColor:Color(0xFFeaeaeb),

      body:Column(
        children: [
          Container(
            height: 33,
            color: Colors.white,
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF012869),
            ),
            child: Row(
              children: [
                IconButton(onPressed:(){
                  Navigator.pop(context);
                }, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                Text('espace cours',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,letterSpacing: 1),),
                SizedBox(width: 170,),
                CircleAvatar(
                  backgroundImage:AssetImage('lib/students/iconacceuil/sdq.jpg'),
                )
              ],
            ),
          ),

          Container(
              color:Color(0xFFeaeaeb),
            child: Container(

              padding:EdgeInsets.only(top: 25,left: 20,) ,
              height: 270,
              child: Column(
                children: [
                  Row(children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>cours()));
                      },
                      child: Container(
                        height: 110,
                        width: 162,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow:[
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: Offset(1,1)
                              ),
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: Offset(-1,-1)
                              ),
                            ]
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('lib/matiere/Cours/image/Capture d’écran 2023-05-17 132528.png',fit: BoxFit.cover,),
                                ),
          ),
                            Text('Cours',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Color(0xFF012869))),

                          ],
                        ),
                      ),
                    ) ,
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>Examen()));
                      },
                      child:Container(
                        height: 110,
                        width: 182,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow:[
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: Offset(1,1)
                              ),
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: Offset(-1,-1)
                              ),
                            ]
                        ),
                        child: Column(
                          children: [
                            Container(
                                height: 80,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('lib/matiere/Cours/image/Capture d’écran 2023-05-17 135534.png',fit: BoxFit.contain,),
                                )),
                            Text('Exercices',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Color(0xFF012869))),

                          ],
                        ),
                      ),
                    ) ,
                  ],),
                  SizedBox(height: 10,),
                  Row(children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>Examen()));
                      },
                      child:Container(
                        height: 110,
                        width: 162,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow:[
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: Offset(1,1)
                              ),
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: Offset(-1,-1)
                              ),
                            ]
                        ),
                        child: Column(
                          children: [
                            Container(
                                height: 80,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('lib/matiere/Cours/image/Capture d’écran 2023-05-17 134022.png',fit: BoxFit.cover,),
                                )),
                            Text('Examen',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Color(0xFF012869))),

                          ],
                        ),
                      ),
                    ) ,
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>TD()));
                      },
                      child: Container(
                        height: 110,
                        width: 185,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow:[
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: Offset(1,1)
                              ),
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: Offset(-1,-1)
                              ),
                            ]
                        ),
                        child: Column(
                          children: [


                   Container(
                     height: 80,
                     width: 150,
                     child: Padding(
                       padding: const EdgeInsets.all(2.0),
                       child: Image.asset('lib/matiere/Cours/image/Capture d’écran 2023-05-17 131802.png'),
                     ),
                   ),

    Text('Autres Fichers',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Color(0xFF012869))),

    ],
                        ),
                      ),
                    ) ,
                  ],)

                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(height: 30,

                color:Color(0xFFeaeaeb),
                padding: EdgeInsets.only(left: 20,top: 0),
                child:Text('Boîte à remarques du professeur :',style:TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3b4790),fontSize: 20),),
              ),
              Expanded(child: Container()),
            ],
          ),
          Expanded(
            child: Container(
              child: StreamBuilder<List<dynamic>>(
                stream:stream,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  List<dynamic> commentaires = snapshot.data!.reversed
                      .toList();
                  if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                       }
                  else {

                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:commentaires.length,
                        itemBuilder: (context, id) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 11, right: 10, bottom: 15),
                            height: 200,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 0,
                                      blurRadius: 1,
                                      offset: Offset(1, 1)
                                  ),
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 0,
                                      blurRadius: 1,
                                      offset: Offset(-1, -1)
                                  ),
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // pour aligner le texte en haut du conteneur
                                children: [

                                  SizedBox(width: 5,),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      // pour aligner le texte à gauche du conteneur
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(commentaires[id]['titre'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),),
                                            Row(
                                              children: [
                                                PopupMenuButton(itemBuilder: (
                                                    BuildContext context) =>
                                                [
                                                  PopupMenuItem(
                                                      value: 'modifier',
                                                      child: Text('Modifier')),
                                                  PopupMenuItem(
                                                      value: 'supprimer',
                                                      child: Text('Supprimer')),
                                                ],
                                                  onSelected: (value) {
                                                    if (value == 'supprimer') {
                                                      com.DeleteCommantaire(
                                                          commentaires[id]['id']);
                                                      GetCommantaire();
                                                    } else
                                                    if (value == 'modifier') {
                                                      print('modifier');
                                                      var titmod = TextEditingController(
                                                          text: commentaires[id]['titre']);
                                                      var descmod = TextEditingController(
                                                          text: commentaires[id]['description']);
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      20)
                                                              ),
                                                              content: Container(
                                                                height: 350,
                                                                width: double
                                                                    .infinity,
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                      'Commentaire',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold),),
                                                                    SizedBox(
                                                                      height: 20,),
                                                                    TextFormField(
                                                                      controller: titmod,
                                                                      decoration: InputDecoration(
                                                                        hintText: "Titre",
                                                                        border: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors
                                                                                  .deepPurple),
                                                                        ),
                                                                        focusedBorder:
                                                                        OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors
                                                                                  .deepPurple),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 10,),
                                                                    TextFormField(
                                                                      controller: descmod,
                                                                      maxLines: 7,
                                                                      decoration: InputDecoration(
                                                                        border: OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors
                                                                                  .deepPurple),
                                                                        ),
                                                                        focusedBorder:
                                                                        OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Colors
                                                                                  .deepPurple),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 10,),
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        print(
                                                                            titmod
                                                                                .text);
                                                                        print(
                                                                            descmod
                                                                                .text);
                                                                        com
                                                                            .UpdateCommantaire(
                                                                            titmod
                                                                                .text,
                                                                            descmod
                                                                                .text,
                                                                            commentaires[id]['id']);
                                                                        GetCommantaire();
                                                                        Navigator
                                                                            .of(
                                                                            context)
                                                                            .pop(
                                                                            null);
                                                                      },
                                                                      child: Text(
                                                                          'Ajouteeeer'),)
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    }
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(commentaires[id]['updated_at']
                                            .substring(0, 16),
                                          style: TextStyle(color: Colors.grey),
                                          softWrap: true,
                                          overflow: TextOverflow
                                              .visible, // permet d'afficher le texte qui dépasse
                                        ),
                                        SizedBox(height: 5,),
                                        Text(commentaires[id]['description'],
                                          style: TextStyle(
                                              color: Colors.black87),
                                          softWrap: true,
                                          overflow: TextOverflow
                                              .visible, // permet d'afficher le texte qui dépasse
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }  },
                ),
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF012869),
        child: Icon(Icons.add),
        onPressed:(){
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
                      controller: titr,
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
                      controller: desc,
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
                      com.AjouterCommantaire(titr.text, desc.text);
                      GetCommantaire();
                      Navigator.of(context).pop(null);
                      }, child: Text('Ajouter'),)
                  ],
                ),
              ),
            );
          } );
        },
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
