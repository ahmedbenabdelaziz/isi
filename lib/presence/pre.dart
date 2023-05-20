import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
class Presence extends StatefulWidget {
  const Presence({Key? key}) : super(key: key);

  @override
  State<Presence> createState() => _PresenceState();
}

class _PresenceState extends State<Presence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFeaeaeb),
      body:Column(
        children: [
          Container(
            color: Colors.white,
            height: 32,
          ),
          Container(
            height: 80,
              color: Color(0xFF012869)
,            child: DatePicker(
              DateTime.now(),
              selectedTextColor: Colors.white,
              selectionColor: Colors.white.withOpacity(.1),
              height: 60,
              initialSelectedDate:DateTime.now(),
              dateTextStyle:TextStyle(fontWeight: FontWeight.bold,fontSize:25),
            ),
          ),
          Expanded(
            child: Container(
              child:ListView.builder(itemBuilder:(context,id){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                  padding: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
                  height: 80,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('1'),
                          SizedBox(width: 5,),
                          VerticalDivider(
                            thickness: 2,
                            color: Colors.green,
                          ),
                          SizedBox(width: 5,),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:AssetImage('lib/annonce/343101852_761963091991078_3927862018311633401_n.jpg'),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ahmed Ben Abdelaziz',style:TextStyle(color:Color(0xFF012869),fontWeight: FontWeight.bold,fontSize: 17),),
                                  SizedBox(height: 3,),
                                  Text('Absent',style:TextStyle(),)
                                ],
                              ),

                           ],
                          ),
                        ],
                      ),
                      Checkbox(value:true, onChanged:(value){})
                    ],
                  ),
                );
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
