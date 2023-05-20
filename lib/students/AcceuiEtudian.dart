import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

import '../Emploi/Emploi.dart';
import '../ResultatEtudiant/DateExamen.dart';
import '../ResultatEtudiant/resultatExam.dart';
import '../matiere/matiere.dart';
class AcceilEtudiant extends StatefulWidget {
  const AcceilEtudiant({Key? key}) : super(key: key);

  @override
  State<AcceilEtudiant> createState() => _AcceilEtudiantState();
}

class _AcceilEtudiantState extends State<AcceilEtudiant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: 32,
            ),
            Container(
              height:830,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF012869)
              ),
              child:Stack(
                children: [
                  Positioned(
                  top: 250
                  ,child:Container(color: Color(0xFFf7f7f7),
                  height: 578,
                  width:393,)),
                  Positioned(
                    top: 210,
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Container(
                          height: 70,
                          width:335,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow:[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset:Offset(1,1)
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset:Offset(-1,-1)
                              )
                            ]
                          ),
                          child:Center(
                            child: TextFormField(
                              decoration:InputDecoration(
                                prefixIcon:Icon(Icons.search),
                                hintText:"Search Cours...",
                                border: InputBorder.none
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text('Welcome',style:TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                      SizedBox(height: 10,),
                    ],
                  ),
                      )),
                  Positioned(
                  child:Container(color: Colors.white,
                  height: 32,
                  width: 392,)),
                  Positioned(
                  top: 100,
                  height: 100,
                  width: 380
                  ,child:  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child:DatePicker(
                      DateTime.now(),
                      selectedTextColor: Colors.white,
                      selectionColor: Colors.white.withOpacity(.1),
                      height: 100,
                      initialSelectedDate:DateTime.now(),
                      dateTextStyle:TextStyle(fontWeight: FontWeight.bold,fontSize:25),
                    ),
                  )),
                  Positioned(
                      top: 32
                      ,child:Container(padding: EdgeInsets.only(right: 3,top: 10,left: 12),
                    width: 392,
                    height: 80,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome',style:TextStyle(color:Colors.white,fontSize: 20),),
                            Text('Mohamed Ali..',style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                          ],
                        ),
                        CircleAvatar(
                          radius: 23,
                          backgroundImage:AssetImage('lib/students/iconacceuil/sdq.jpg'),
                        )
                      ],
                    ),
                  ),
                  ),
                  Positioned(
                    top: 345,
                    left: 15,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: Color(0xFFf7f7f7),
                        width: 370,
                        height: 470,
                        child:ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    Navigator.push(context,MaterialPageRoute(builder:(context)=>Matieres()));
                                  }
                                  ,
                                  child: Container(
                                    height: 140,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow:[
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset:Offset(1,1)
                                          ),
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset:Offset(-1,-1)
                                          )
                                        ]
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 25,
                                          child:Image.asset('lib/students/iconacceuil/book.png'),
                                        ),
                                        SizedBox(height:15,),
                                        Text('Matiéres',style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,),),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Emploi()));
                                  }
                                  ,
                                  child: Container(
                                    height: 140,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow:[
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset:Offset(1,1)
                                          ),
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset:Offset(-1,-1)
                                          )
                                        ]
                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child:Image.asset('lib/students/iconacceuil/schedule.png'),
                                        ),
                                        SizedBox(height:10,),
                                        Text('Emploi',style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,),),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 140,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow:[
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset:Offset(1,1)
                                        ),
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset:Offset(-1,-1)
                                        )
                                      ]
                                  ),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20,
                                        child:Image.asset('lib/students/iconacceuil/discussion (1).png'),
                                      ),
                                      SizedBox(height:10,),
                                      Text('Chat Room',style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=>resulEtudi()));
                                  },
                                  child: Container(
                                    height: 140,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow:[
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset:Offset(1,1)
                                          ),
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset:Offset(-1,-1)
                                          )
                                        ]
                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child:Image.asset('lib/students/iconacceuil/result (1).png'),
                                        ),
                                        SizedBox(height:10,),
                                        Text('Résultats',style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,),),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 140,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow:[
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset:Offset(1,1)
                                        ),
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset:Offset(-1,-1)
                                        )
                                      ]
                                  ),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25,
                                        child:Image.asset('lib/students/iconacceuil/blogger.png'),
                                      ),
                                      SizedBox(height:10,),
                                      Text('Boite de Reception',textAlign: TextAlign.center,style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,),),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=>DateEX()));
                                  }
                                 , child: Container(
                                    height: 140,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow:[
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset:Offset(1,1)
                                          ),
                                          BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset:Offset(-1,-1)
                                          )
                                        ]
                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 25,
                                          child:Image.asset('lib/students/iconacceuil/info.png'),
                                        ),
                                        SizedBox(height:10,),
                                        Text('A propos',textAlign: TextAlign.center,style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 140,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow:[
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset:Offset(1,1)
                                        ),
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset:Offset(-1,-1)
                                        )
                                      ]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25,
                                        child:Image.asset('lib/students/iconacceuil/buildings.png'),
                                      ),
                                      SizedBox(height:10,),
                                      Text('STAGE',textAlign: TextAlign.center,style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,),),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 140,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow:[
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset:Offset(1,1)
                                        ),
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset:Offset(-1,-1)
                                        )
                                      ]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25,
                                        child:Image.asset('lib/students/iconacceuil/report.png'),
                                      ),
                                      SizedBox(height:10,),
                                      Text('Rapport PFE',textAlign: TextAlign.center,style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,),),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 140,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow:[
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset:Offset(1,1)
                                        ),
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset:Offset(-1,-1)
                                        )
                                      ]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25,
                                        child:Image.asset('lib/students/iconacceuil/graduated.png'),
                                      ),
                                      SizedBox(height:10,),
                                      Text('PFE Book',textAlign: TextAlign.center,style:TextStyle(fontSize:17,fontWeight: FontWeight.bold,),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
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
