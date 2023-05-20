import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';
import '../annonce/ApiAnnonce.dart';
import 'chatadmistration.dart';

class AnnonceAdmistration extends StatefulWidget {


  const AnnonceAdmistration({Key? key,

  }) : super(key: key);

  @override
  State<AnnonceAdmistration> createState() => _AnnonceAdmistrationState();
}

class _AnnonceAdmistrationState extends State<AnnonceAdmistration> {

  StreamController<Map<String, dynamic>> _streamController = StreamController.broadcast();
  ApiAnnonce com = ApiAnnonce();

  Future<Map<String, dynamic>> getAnnonce() async {
    Map<String, String> headers = {
      'Authorization': 'Bearer 8|vPWnz3i58JNfNRHMYL2w48bS5KFjkxgvgFFqYVbd',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*'
    };



    final response = await http.get(
      Uri.parse('http://192.168.1.37/ISIMM_eCampus/public/api/annonces'),
      headers: headers,
    );
    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return jsonData;
    } else {
      print(jsonData);
      throw Exception('Failed to load data');
    }
  }


  @override
  void initState() {
    super.initState();
    getAnnonce();
    setState(() {
      _streamController =  StreamController.broadcast();
      getAnnonce();
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
  var uuid =Uuid();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFff7f7fa),
      //Color(0xFff7f7fa)
      body:Container(
        child:Column(children: [
          Container(
            height: 50,
            padding:EdgeInsets.only(right:30),
            width: double.infinity,
            color: Colors.white,
            child:Row(
              children: [
              CircleAvatar(
                radius: 30,
                child:Image.asset('lib/adminstration/img/téléchargement (2).png'),
              ),
                Row(
                  children: [
                    Text('ISIMM',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFF26519e)),),
                    Text('_eCAMPUS',style:TextStyle(fontSize: 20),),
                  ],
                ),
                SizedBox(width: 40,),
                Container(
                  width: 40,
                  height: 40,
                  decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue
                  ),
                  child:Center(
                    child:Icon(Icons.dashboard,color: Colors.white,),
                  ),
                ),
                SizedBox(width: 20,),
                Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius:BorderRadius.circular(10)
                    )
                    ,child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration:InputDecoration(
                        border: InputBorder.none,
                        hintText: "search..."
                    ),
                  ),
                )),
                Expanded(child:Container()),
                Container(
                  padding: EdgeInsets.all(8),
                  child:Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.1),
                        ),

                      ),
                      Positioned(
                          top: 5,
                          left: 5,
                          right: 5,
                          bottom: 5
                          ,child:CircleAvatar(
                        backgroundImage:AssetImage('lib/adminstration/img/tunisie.png'),
                      ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child:Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                          child:CircleAvatar(
                        backgroundColor:Colors.black.withOpacity(0.05),
                        child: Icon(Icons.notifications_none,color: Colors.black,),
                      ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child:Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.03),
                        ),
                      ),
                      Positioned(
                          child:CircleAvatar(
                            backgroundColor:Colors.black.withOpacity(0.03),

                        child:Icon(Icons.email_outlined,color: Colors.black,),
                      ))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius:20,
                child:Image.asset('lib/ISIM_LOGO_ar.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ISIMM',style:TextStyle(fontWeight: FontWeight.bold),),
                          Text('Adminstration',style:TextStyle(color: Colors.blue),)

                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10,right: 10,top: 20),
                height: 551,
                width: 215,
                color:Colors.white,
                child:ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Text('Menu principal',style:TextStyle(color:Colors.black38,fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal:10,vertical:3),
                            decoration: BoxDecoration(
                              color: Color(0xFF3d5ee1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(),
                              child: Row(
                                children: [
                                  Icon(Icons.home,color: Colors.white,),
                                  SizedBox(width: 20,),
                                  Text('Acceuille',style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
                                  Expanded(child: Container()),
                                  SizedBox(width:10,),
                                  Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/prof.png')),
                                SizedBox(width: 20,),
                                Text('enseignants',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/etudiant-diplome.png')),
                                SizedBox(width: 20,),
                                Text('Etudiants',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text('Extra',style:TextStyle(color:Colors.black38,fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/discuter.png')),
                                SizedBox(width: 10,),
                                GestureDetector(
                                    onTap:(){
                                      Navigator.push(context,MaterialPageRoute(builder:(context)=>ChatAdmin(name:"ahmad", userId:uuid.v1(),)));

                                    }
                                    ,child: Text('Boite De Recéption',style:TextStyle(color:Colors.black54,))),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/calendrier.png',color: Colors.black54,)),
                                SizedBox(width: 10,),
                                Text('Calendrier',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/presse-papiers.png')),
                                SizedBox(width: 10,),
                                Text('Résultats',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/emploi-du-temps.png')),
                                SizedBox(width: 10,),
                                Text('Emploi Du temps',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 25,
                                    width: 25
                                    ,child: Image.asset('lib/adminstration/img/discuter.png')),
                                SizedBox(width: 10,),
                                Text('Horaires Examens',style:TextStyle(color:Colors.black54,)),
                                Expanded(child: Container()),
                                Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Text('Autre',style:TextStyle(color:Colors.black38,fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('Rapports PFE',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('PFE BOOK',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('Société',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                    Text('Gestion',style:TextStyle(color:Colors.black38,fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('Rapports PFE',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('PFE BOOK',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              width: 25
                              ,child: Image.asset('lib/adminstration/img/files-and-folder.png')),
                          SizedBox(width: 10,),
                          Text('Société',style:TextStyle(color:Colors.black54,)),
                          Expanded(child: Container()),
                          Icon(Icons.arrow_forward_ios,color: Colors.black54,size: 15,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    height: 50,
                    width: 765,
                    color:Color(0xFff7f7fa),
                    child:Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:AssetImage('lib/annonce/343101852_761963091991078_3927862018311633401_n.jpg'),
                        ),
                        SizedBox(width: 7,),
                        Container(
                          height: 40,
                          width: 550,
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
                                            maxLines: 10,
                                            decoration:InputDecoration(
                                                hintText: "publier quellque chose ..."
                                            ),
                                          ),
                                          Container(
                                            child:Row(
                                              children: [
                                                TextButton(onPressed:(){
                                                }, child:Text('Ajouter une image')),
                                                IconButton(onPressed:(){}, icon:Icon(Icons.picture_as_pdf,color: Colors.green,size: 30,))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              width: 400
                                              ,child: ElevatedButton(onPressed:(){
                                            setState(() {

                                            });
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

                  Container(
                    height: 501,
                    width: 765,
                   // color: Color(0xFff7f7fa),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical
                            ,child: Container(
                              height:501,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 501,
                                  width: 750,
                                  child: StreamBuilder<Map<String, dynamic>>(
                                    stream:Stream.fromFuture(getAnnonce()),
                                    builder:(context,AsyncSnapshot<Map<String, dynamic>> snapshot){
                                      if (!snapshot.hasData) { // if snapshot has no data this is going to run
                                        return Container(
                                            alignment: FractionalOffset.center,
                                            child: CircularProgressIndicator());
                                      }else if(snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      }                         else
                                      {
                                        var data = snapshot.data!;
                                        List<dynamic> annonces = data['annonces'] ?? [];
                                        List<dynamic> proprietaires = data['proprietaires'] ?? [];
                                        List<dynamic> soutitre = data['soutitre'] ?? [];
                                      return ListView.builder(
                                        itemCount:annonces.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(right: 8.0,left:20,top: 8),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black.withOpacity(0.1),
                                                      spreadRadius: 0,
                                                      blurRadius: 3,
                                                      offset:Offset(1,1)
                                                  ),
                                                  BoxShadow(
                                                      color: Colors.black.withOpacity(0.1),
                                                      spreadRadius: 0,
                                                      blurRadius: 3,
                                                      offset:Offset(-1,-1)
                                                  )
                                                ],
                                              ),
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundImage:NetworkImage("http://192.168.1.37/ISIMM_eCampus/storage/app/public/${annonces[index]['image']}"),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("${proprietaires[index]['prenom']} ${proprietaires[index]['nom']}",style:TextStyle(fontWeight: FontWeight.bold),),
                                                          SizedBox(height: 3,),
                                                          Text(soutitre[index],style:TextStyle(color: Colors.black.withOpacity(0.5)),),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                    child: SingleChildScrollView(
                                                      scrollDirection: Axis.vertical,
                                                      child: ExpandableText(
                                                        annonces[index]['description'],
                                                        textAlign: TextAlign.left,
                                                        expandText: 'Read More',
                                                        maxLines:3,
                                                        linkColor: Colors.blue,
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.4,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Image.network("http://192.168.1.37/ISIMM_eCampus/storage/app/public/${annonces[index]['image']}",
                                                    fit: BoxFit.cover,

                                                  ),
                                                  Divider(
                                                    thickness: 2,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                                    child: Row(
                                                      children: [
                                                        Text('2 hours , 12 mintues ago'),
                                                        Expanded(child:Container()),
                                                        Text(annonces[index]['likes_count'].toString(),style:TextStyle(fontWeight: FontWeight.bold),),
                                                        IconButton(onPressed:(){
                                                          print(annonces[index]['id']);
                                                          setState(() {
                                                            com.LikeAnnonce(annonces[index]['id']);
                                                            getAnnonce();
                                                          });
                                                        }, icon:Icon(Icons.thumb_up,color: Colors.blue,)),
                                                        Text(annonces[index]['deslikes_count'].toString(),style:TextStyle(fontWeight: FontWeight.bold),),
                                                        IconButton(onPressed:(){
                                                          setState(() {
                                                            com.DisLikeAnnonce(annonces[index]['id']);
                                                            getAnnonce();
                                                          });
                                                        }, icon:Icon(Icons.thumb_down,color: Colors.blue,))

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );}
                                    }
                                  ),
                                ),
                              ],
                            ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 345,
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child:TableCalendar(

                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      calendarStyle: CalendarStyle(
                        selectedTextStyle: TextStyle().copyWith(color: Colors.blue),

                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 206,
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child:Column(
                      children: [
                        Container(
                          height: 90,
                          width: 260,
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          decoration:BoxDecoration(
                              color: Color(0xFF1877f2),
                            borderRadius:BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Compte Facebook',style:TextStyle(color: Colors.white,fontSize: 15),)
                                  ,SizedBox(height: 5,),
                                  Text('4 953',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)
                                ],
                              ),
                              SizedBox(width: 40,),
                              Stack(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration:BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  Positioned(
                                      top: 10,
                                      bottom: 10,
                                      left: 10,
                                      right: 10
                                      ,child:Image.asset('lib/adminstration/img/facebook-icon-logo-png-7.jpg'))
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          height: 90,
                          width: 260,
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          decoration:BoxDecoration(
                              color: Color(0xFF0a66c2),                              borderRadius:BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Compte LinkedIn',style:TextStyle(color: Colors.white,fontSize: 15),)
                                  ,SizedBox(height: 5,),
                                  Text('4 099',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)
                                ],
                              ),
                              SizedBox(width: 40,),
                              Stack(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration:BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  Positioned(
                                      top: 10,
                                      bottom: 10,
                                      left: 10,
                                      right: 10
                                      ,child:Image.asset('lib/adminstration/img/téléchargement (3).png'))
                                ],
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],),
      ),
    );

  }
}
