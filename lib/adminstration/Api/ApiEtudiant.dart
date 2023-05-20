import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
class Apiet {


  getEtudiant()async{
    http.Response response = await http.get(Uri.parse('http://192.168.1.37/ISIMM_eCampus/public/api/etudiants'));
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      print("ok");
      print(data);
    }else{
      print(response.statusCode);
      return jsonDecode(response.body);
    }
  }



  Future<void> deletetudiant(int ense) async {

    final response = await http.delete(
      Uri.parse('http://192.168.1.37/ISIMM_eCampus/public/api/supprimer_etudiant/$ense'),
      headers: {
        'Authorization': 'Bearer 29|5hgVXla4KfqX6kArbvLDElBtabsbh3rIr4nrwRai',
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Announcement deleted successfully');
      print(data);
    } else {
      print('An error occurred while deleting the announcement');
      print(response.body);
    }

  }


  UpdateEtudiant( nom,prenom,email,telephone, int idannonce) async {
    http.Response response = await http.post(Uri.parse(
        "http://192.168.1.37/ISIMM_eCampus/public/api/modifier_etudiant/${idannonce}"),
        body: {
          'name': nom,
          'prenom':prenom,
          'email':email,
          'telephone':telephone
        },
        headers: {
          'Authorization': 'Bearer 27|jun5dbLGuIVCc9Gd74aZYqzZVhXokaDgCY1V2gB8',
          'Accept': 'application/json'
        }
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("Update avec succes");

      print(data);
    } else {
      print(data);
    }
  }



}