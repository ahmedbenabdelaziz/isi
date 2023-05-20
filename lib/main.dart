import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled62/adminstration/chhhhhhhhhhhhhhhhhhh.dart';
import 'package:untitled62/matiere/matiere.dart';
import 'package:untitled62/pfe/pfffff.dart';
import 'package:untitled62/pfe/rapport.dart';
import 'package:untitled62/pfe/societe.dart';
import 'package:untitled62/presence/pre.dart';
import 'package:untitled62/presence/presenece.dart';
import 'package:untitled62/students/AcceuiEtudian.dart';
import 'package:untitled62/students/EditProfile.dart';

import 'BoiteReception/Etudient/BoiteReceptionEtudient.dart';
import 'Emploi/Emploi.dart';
import 'Login/LoginEtudient/LoginUser/BlocUser/Login/login_bloc.dart';
import 'Login/LoginEtudient/LoginUser/BlocUser/Registre/registre_bloc.dart';
import 'Login/LoginEtudient/LoginUser/LoginUser.dart';
import 'ResultatEtudiant/DateExamen.dart';
import 'ResultatEtudiant/resultatExam.dart';
import 'ResultatEtudiant/res.dart';
import 'Screen.dart';
import 'adminstration/AccAdm.dart';
import 'adminstration/AcceuillAnnonc.dart';
import 'adminstration/AjouterEnseign.dart';
import 'adminstration/DateExamen.dart';
import 'adminstration/Departement.dart';
import 'adminstration/ListEtudient.dart';
import 'adminstration/ListeEnseignant.dart';
import 'adminstration/Resultats.dart';
import 'adminstration/Subjects.dart';
import 'adminstration/calendtest.dart';
import 'adminstration/chatadmistration.dart';
import 'adminstration/emploiDuTemps.dart';
import 'adminstration/societe.dart';
import 'adminstration/test.dart';
import 'annonce/a.dart';
import 'annonce/annonce.dart';
import 'chat/GroupChat.dart';
import 'chat/chatEnseignant/Listchat.dart';
import 'chat/chathome.dart';
import 'chat/chatttttttttttttttttclasse.dart';
import 'chat/uichat.dart';
import 'matiere/Cours/AcceuilCours.dart';
import 'matiere/Cours/Examen.dart';
import 'matiere/Cours/Td.dart';
import 'matiere/Cours/cours.dart';
import 'matiere/Cours/ApiCou/Api/ApiUser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main(){
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>RegistreBloc(ApiUser()),),
        BlocProvider(create: (context)=>LoginBloc(ApiUser()),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Subj(),
      ),
    );
  }
}

