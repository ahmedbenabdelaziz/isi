import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
class TdApi{

  late List list;
  // envoie cours
  PostTd(String title, String subtitle, File pdf, matiere_id,
      classe_id) async {
    http.MultipartRequest response = await http.MultipartRequest('POST',

      // Url ="http://localhost/ISIMM_eCampus/public/api/upload_cours";
      // token =2|pE4Et5zrUn1x6PZHOSnWagH3b17QI4tv3KIxvgNN
      Uri.parse(
          "http://192.168.1.37/ISIMM_eCampus/public/api/upload_exercice"),
    );
    Map<String, String> head = {
      'Authorization': 'Bearer 34|5swDq3pxoOYX1ZuAeCovj2DW10pjUyr73BXh9uXC',
      'Accept': 'application/json'
    };
    response.headers.addAll(head);
    response.fields['titre'] = title;
    response.fields['description'] = subtitle;
    response.fields['matiere_id'] = '1';
    response.fields['classe_id'] = '1';
    var fichierStream = http.ByteStream(pdf.openRead());
    var fichierlength = await pdf.length();
    var UploadFileRequest = http.MultipartFile(
        'file', fichierStream, fichierlength, filename:'$title.pdf');
    response.files.add(UploadFileRequest);
    var data = await response.send();
    if (data.statusCode == 200) {
      print("Exercice Ajouter");
      print(data);
    } else {

      print(data.statusCode);
    }
  }
  // telecharger cours
  downloadTd(filename) async {
    String url = "";
    http.Response response = await http.get(Uri.parse(
        'http://192.168.1.25/ISIMM_eCampus/public/api/download_exercice?filename=H1654SBhg8VmuRecqNNL'),
        headers: {
          'Authorization': 'Bearer 2|pE4Et5zrUn1x6PZHOSnWagH3b17QI4tv3KIxvgNN',
          'Accept': 'application/json'
        });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(data);
    } else {
      print(data);
    }
  }

  // Supprimer cours
  DeleteTd(matier_id, classe_id) async {
    String url = "";
    http.Response response = await http.post(Uri.parse(
        "http://192.168.1.37/ISIMM_eCampus/public/api/supprimer_exercice/1?matiere_id=1&classe_id=1"),
        headers: {
          'Authorization': 'Bearer 34|5swDq3pxoOYX1ZuAeCovj2DW10pjUyr73BXh9uXC',
          'Content-type': 'application/json',
          'Accept': 'application/json'
        }
    );
    var data = jsonDecode(response.body);
    if (response == 200) {
      print(data);
      return data;
    } else {
      print(data);
      return data;
    }
  }

  //Update cours
  UpdateTd(String title, String subtitle,id) async {
    http.Response response = await http.post(Uri.parse(
        "http://192.168.1.37/ISIMM_eCampus/public/api/update_exercice/${id}?matiere_id=1&classe_id=1"),
        body: {
          'titre': title,
          'description': subtitle,
        },
        headers: {
          'Authorization': 'Bearer 34|5swDq3pxoOYX1ZuAeCovj2DW10pjUyr73BXh9uXC',
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