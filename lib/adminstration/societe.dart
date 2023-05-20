import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:expandable_text/expandable_text.dart';
class Societ extends StatefulWidget {
  const Societ({Key? key}) : super(key: key);

  @override
  State<Societ> createState() => _SocietState();
}

class _SocietState extends State<Societ> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
backgroundColor:Color(0xFff7f7fa),
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
height: 530,
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
Text('Boite De Recéption',style:TextStyle(color:Colors.black54,)),
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
SizedBox(width: 40,),
  Container(
    height: 500,
    width: 765,
    child: GridView.builder(itemBuilder:(context,id){
      return Container(
        margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
        height: 320,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow:[
              BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(1,1)
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image.asset('lib/adminstration/img/images (3).png',)),
              SizedBox(height: 15,),
              Text("Au niveau de la licence, obligatoires (management des entreprises, langues et communication, C2i) et une ouverture sur la vie professionnelle par des stages en entreprise ou en laboratoire.",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
              ,SizedBox(height: 1,),
              ExpandableText(
                "Au niveau de la licence, adopte une approche pluridisciplinaire (connaissances fondamentales de base en première année, spécialisations diversifiées en deuxième et troisième années), une ouverture à la recherche ou sur le monde professionnel (en troisième année), des modules transversaux obligatoires (management des entreprises, langues et communication, C2i) et une ouverture sur la vie professionnelle par des stages en entreprise ou en laboratoire. Au niveau de la licence, le projet de l'ISIMM adopte une approche pluridisciplinaire (connaissances fondamentales de base en première année, spécialisations diversifiées en deuxième et troisième années), une ouverture à la recherche ou sur le monde professionnel (en troisième année), des modules transversaux obligatoires (management des entreprises, langues et communication, C2i) et une ouverture sur la vie professionnelle par des stages en entreprise ou en laboratoire.",
                textAlign: TextAlign.left,
                expandText: 'Read More',
                maxLines:5,
                linkColor: Colors.blue,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  height: 1.4,
                ),
              )
              ,Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,color:  Colors.blueAccent,),
                        Text('Rue de Bagdad, Sousse',style:TextStyle(color: Color(0xFF3d5ee1),fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    Row(children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.email_outlined),
                      ),
                      SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('lib/imagsoc/8787518.png'),
                      ),
                      SizedBox(width: 5,),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('lib/societe/8743996.png'),
                      ),
                    ],)
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),),
  ),
Column(
children: [
Container(
height: 340,
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
height: 191,
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
