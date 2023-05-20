import 'package:flutter/material.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
          Container(height: 32,
          color: Colors.white,),
          Container(
            height: 260,
            decoration:BoxDecoration(
                color: Color(0xFF012869),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))
            ),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed:(){}, icon:Icon(Icons.arrow_back,color: Colors.white,)),
                    Text('Profile',style:TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
                    IconButton(onPressed:(){}, icon:Icon(Icons.edit,color: Colors.white,))
                  ],
                ),
                SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                     decoration:BoxDecoration(
                       color: Colors.white,
                       shape: BoxShape.circle
                     ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 3,
                            left: 3,
                            right:3,
                            bottom:3,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage:AssetImage('lib/students/iconacceuil/sdq.jpg',),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text('Ahmed Abdelaziz',style:TextStyle(color: Colors.white,fontWeight:FontWeight.w500,fontSize: 20),),
                        SizedBox(height: 10,),
                        Text('L3 Génie Logiciel',style:TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 20),)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30,right: 30),
              color: Colors.white,
              width: double.infinity,
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Adresse Email :',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                , SizedBox(height: 10,)
                  ,Text('ahmedbenabdelaziz'
                        '@gmail.com',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:Color(0xFF8f9094)),)
                    , SizedBox(height: 10,),
                    Divider(color: Colors.grey,),
                    SizedBox(height:10),
                    Text('Password :',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                  , SizedBox(height: 10,),
                    Text('*************',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:Color(0xFF8f9094)),)
                    ,Divider(color: Colors.grey,),
                    SizedBox(height:10),
                    Text('Confirm Password :',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                    , SizedBox(height: 10,)
                    ,Text('*************',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:Color(0xFF8f9094)),)
                    ,Divider(color: Colors.grey,),
                    SizedBox(height:10),
                    Text('Phone Number:',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                    , SizedBox(height: 10,)
                    ,Text('+216 21050601',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:Color(0xFF8f9094)),)
                    ,Divider(color: Colors.grey,),
                    SizedBox(height:10),
                    Text('Date Of Birth:',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                    , SizedBox(height: 10,)
                    ,Text('16-05-2001',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:Color(0xFF8f9094)),)
                  ],
                ),
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
