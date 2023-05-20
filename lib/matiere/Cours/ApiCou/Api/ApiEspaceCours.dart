import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiComment {

  Future<List<dynamic>> GetCommantaire() async {
      http.Response response = await http.get(Uri.parse("http://192.168.1.25/ISIMM_eCampus/public/api/remarques?matiere_id=1&classe_id=1"),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer 2|pE4Et5zrUn1x6PZHOSnWagH3b17QI4tv3KIxvgNN',
        }
    );
    var data = jsonDecode(response.body)['remarques'];
    if (response.statusCode == 200) {
      print(data.reversed.toList());
    return data;
    } else {
      print(response.statusCode);
      return data.reversed.toList();


    }
  }

  AjouterCommantaire(String cmntr,desc) async {
      http.Response response = await http.post(Uri.parse("http://192.168.1.37/ISIMM_eCampus/public/api/ajouter_remarque?matiere_id=1&classe_id=1"),
        body:
            {
              'description': desc,
              'titre': cmntr,
            },

        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer 34|5swDq3pxoOYX1ZuAeCovj2DW10pjUyr73BXh9uXC',
        }
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("Commanaire ajuter");
      print(data);
    } else {
      print(data);

    }
  }


  UpdateCommantaire(String cmntr,desc,int id) async {
    http.Response response = await http.post(Uri.parse("http://192.168.1.25/ISIMM_eCampus/public/api/update_remarque/"+id.toString()),
    body: {
      'description': desc,
      'titre': cmntr,
    },
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer 2|pE4Et5zrUn1x6PZHOSnWagH3b17QI4tv3KIxvgNN',
      }
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(data);
    } else {
      print(response.statusCode);
      print(data);
    }
  }


    DeleteCommantaire(int id) async {
      http.Response response = await http.delete(
          Uri.parse("http://192.168.1.37/ISIMM_eCampus/public/api/supprimer_remarques/"+ id.toString() +"?matiere_id=1&classe_id=1"),
      headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer 34|5swDq3pxoOYX1ZuAeCovj2DW10pjUyr73BXh9uXC',
      }
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200 ) {
        print(data);
      } else {
        print("s");
        print(data);
      }
    }}
