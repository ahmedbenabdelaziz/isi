import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ChatUi extends StatefulWidget {
  const ChatUi({Key? key}) : super(key: key);

  @override
  State<ChatUi> createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi> {

  List classe =[
    'lib/chat/chatEnseignant/img/conference.png',
    'lib/chat/chatEnseignant/img/eleves.png',
    'lib/chat/chatEnseignant/img/icons8-classe-48.png',
    'lib/chat/chatEnseignant/img/patron.png',
    'lib/chat/chatEnseignant/img/presentation.png',
    'lib/chat/chatEnseignant/img/icons8-classe-48.png',
    'lib/chat/chatEnseignant/img/patron.png',
    'lib/chat/chatEnseignant/img/presentation.png', 'lib/chat/chatEnseignant/img/icons8-classe-48.png',
    'lib/chat/chatEnseignant/img/patron.png',
    'lib/chat/chatEnseignant/img/presentation.png',
    'lib/chat/chatEnseignant/img/salle-de-classe-avec-groupe-detudiants-et-professeur.png'
  ];

  StreamController<Map<String, dynamic>> _streamController = StreamController.broadcast();


  Future<Map<String,dynamic>>getChat()async{
    Map<String, String> headers = {
      'Authorization': 'Bearer 29|5hgVXla4KfqX6kArbvLDElBtabsbh3rIr4nrwRai',
      'Accept': 'application/json',

    };
    http.Response response = await http.get(Uri.parse('http://192.168.1.37/ISIMM_eCampus/public/api/chat_classes'),
    headers: headers);
    var data = jsonDecode(response.body) as Map<String,dynamic>;
    if(response.statusCode==200){
      print(data);
      return data;
    }else{
      print(response.statusCode);
      return data;
    }
  }

  @override
  void initState() {
    super.initState();
    getChat();

    setState(() {
      _streamController =  StreamController.broadcast();
      getChat();
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
      backgroundColor:Color(0xFF012869),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 32,
          color: Colors.white,),
          SizedBox(
            height: 140,
            child:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed:(){},icon:Icon(Icons.arrow_back,color: Colors.white,size:25,))
                        ,CircleAvatar(
                            radius:20,
                            backgroundImage:AssetImage('lib/chat/téléchargement.jpg'),
                          )
                        ],
                      ),
                      SizedBox(height:30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Chat Messages',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration:BoxDecoration(
                borderRadius:BorderRadius.only(topRight:Radius.circular(20),topLeft: Radius.circular(20))
                ,color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                  ,  color: Colors.white,
                  ),
                    child:StreamBuilder<Map<String,dynamic>>(
                      stream:Stream.fromFuture(getChat())
                        ,builder:(BuildContext context,AsyncSnapshot <Map<String,dynamic>> snapshot){

    if (!snapshot.hasData) {
    return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
    return Text("${snapshot.error}");
    } else {
                      var  data = snapshot.data!;
                      List<dynamic> chat = snapshot.data!['chat_Room'];
                      return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: chat.length,
                            itemBuilder:(context,id){
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  child:Image.asset(classe[id]),
                                ),
                                SizedBox(height: 5,),
                                Text(chat[id]['name'],style:TextStyle(fontWeight:FontWeight.w500))
                              ],
                            ),
                          );
                        });}
                    }
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: StreamBuilder<Map<String,dynamic>>(
                        stream: Stream.fromFuture(getChat()),
                        builder: (context, snapshot) {
    if (!snapshot.hasData) {
    return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
    return Text("${snapshot.error}");
    } else {
                          var  data = snapshot.data!;
                          List<dynamic> chat = snapshot.data!['chat_Room'];
                          return ListView.builder(
                          itemCount: chat.length
                          ,itemBuilder:(context,id){
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                                  child:Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 32,
                                        backgroundImage:AssetImage('lib/chat/135397796_1171775189945124_3258220724117022209_n.jpg'),
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(chat[id]['name'],style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                                       ,SizedBox(height: 4,),
                                          Text(chat[id]['lastmessages']['text'],style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey,fontSize: 15),)
                                          ,
                                        ],
                                      ),
                                      SizedBox(width:60,),
                                      Column(
                                        children: [
                                          Text('14.30',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                                          SizedBox(height: 5,),
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.green,
                                            child:Text('2'),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Divider(thickness: 0.8,
                                ),
                              ],
                            );
                          });}
                        }
                      ),
                    ),
                  ),
                ],
              ),
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
