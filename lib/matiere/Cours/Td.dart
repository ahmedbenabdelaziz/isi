import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'AcceuilCours.dart';
import 'ApiCou/Api/apiexamen.dart';
import 'ApiCou/Api/apitd.dart';

class TD extends StatefulWidget {
  const TD({Key? key}) : super(key: key);

  @override
  State<TD> createState() => _TDState();
}

class _TDState extends State<TD> {

  TextEditingController titr= TextEditingController();
  TextEditingController desc= TextEditingController();
  TextEditingController titre= TextEditingController();
  TextEditingController description= TextEditingController();
  late StreamController<List<dynamic>> _streamController ;
  late Stream<List<dynamic>> stream;
  TdApi  com =new TdApi();
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
  Future<Map<String,dynamic>> GetTD() async {
    http.Response response = await http.get(Uri.parse("http://192.168.1.37/ISIMM_eCampus/public/api/exercices?matiere_id=1&classe_id=1"),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer 34|5swDq3pxoOYX1ZuAeCovj2DW10pjUyr73BXh9uXC',
        }
    );
    var data = jsonDecode(response.body) as Map<String,dynamic>;
    if (response.statusCode == 200) {
      print(data);
      return data;
    } else {
      print(response.statusCode);
      return data;
   //   _streamController.add(data.reversed.toList());
    }
  }


  @override
  void initState() {
    super.initState();
    setState(() {
      _streamController =  StreamController.broadcast();
      stream =_streamController.stream;
      GetTD();
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
      body:Column(
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
                                Text('Espace TD',style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
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
                                hintText: "Recherche TD ...",
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
                            ,child: Text('Examen',style:TextStyle(color:Color(0xFFc2daee),fontWeight: FontWeight.bold,fontSize: 20),))
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
          Expanded(
            child: Container(
              child: StreamBuilder<Map<String,dynamic>>(
                stream:Stream.fromFuture(GetTD()),
                builder: (BuildContext context, AsyncSnapshot<Map<String,dynamic>> snapshot) {
               //   List<dynamic> commentaires = snapshot.data!.reversed.toList(); // utilise la méthode reversed() pour inverser l'ordre des commentaires
                 print(snapshot.data);
                 List<dynamic> commentaires= snapshot.data!['exercices'];
                  if (snapshot.hasData) {
                    return  ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder:(context,id){
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
                              subtitle: Text(commentaires[id]['description']),
                              title:Text(commentaires[id]['titre'],style:TextStyle(fontWeight: FontWeight.bold),),
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
                                          com.DeleteTd(1, 1);
                                          GetTD();
                                        });
                                      }else if (value=='modifier'){
                                        print('modifier');
                                        var titmod= TextEditingController(text:commentaires[id]['titre']);
                                        var descmod= TextEditingController(text:commentaires[id]['description']);
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
                                                      com.UpdateTd(titmod.text, descmod.text,1);
                                                      GetTD();
                                                      Navigator.of(context).pop(null);
                                                    });
                                                    //  titmod.text, descmod.text,cours[id]['id']
                                                    Navigator.of(context).pop(null);
                                                  }, child: Text('Modifier'),)
                                                ],
                                              ),
                                            ),
                                          );
                                        } );

                                      }
                                    },
                                  ),

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
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          )
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
setState(() {
  PickCours();

});
                          },
                          child: Text('Téléverser TD',style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF012869)),)
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
                            com.PostTd(titre.text, desc.text, File(filecours), 1, 1);
                            GetTD()                                               ;
                          });
                          Navigator.of(context).pop(null);
                        },
                        child: Center(
                            child: Text('Ajouter TD')
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
