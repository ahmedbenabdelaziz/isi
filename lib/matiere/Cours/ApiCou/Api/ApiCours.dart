import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
class Cours{

    late List list;
   Future<List<dynamic>> GetCrous(matiere_id,classe_id)async {
      String url = "http://192.168.1.25/ISIMM_eCampus/public/api/cours?matiere_id=1&classe_id=1";
      http.Response response = await http.get(Uri.parse(url),
          headers: {
            'Authorization': 'Bearer 2|pE4Et5zrUn1x6PZHOSnWagH3b17QI4tv3KIxvgNN',
            'Content-type': 'application/json',
            'Accept': 'application/json'
          });
      List data = jsonDecode(response.body)['cours'];
      if (response.statusCode == 200) {
        print(data.reversed.toList());
        return data.reversed.toList();
      } else {
        print(response.statusCode);
        print(data);
        return data;
      }}


    // envoie cours
    Future<void> PostCours(String title, String subtitle, File pdf, matiere_id, classe_id) async {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("http://192.168.1.37/ISIMM_eCampus/public/api/upload_cours"),
      );

      request.headers['Authorization'] = 'Bearer 34|5swDq3pxoOYX1ZuAeCovj2DW10pjUyr73BXh9uXC';
      request.headers['Content-type'] = 'application/json';
      request.headers['Accept'] = 'application/json';

      request.fields['name'] = title;
      request.fields['description'] = subtitle;
      request.fields['matiere_id'] = '1';
      request.fields['classe_id'] = '1';

      var fichierStream = http.ByteStream(Stream.castFrom(pdf.openRead()));
      var fichierlength = await pdf.length();
      var uploadFileRequest = http.MultipartFile(
        'file',
        fichierStream,
        fichierlength,
        filename: '$title.pdf',
      );
      request.files.add(uploadFileRequest);

      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var decodedJson = jsonDecode(responseString);
      if (response.statusCode == 200) {
        print("File Uploaded");

        // Decode the response body

        print(decodedJson);
      } else {
        print(response.statusCode);
        print(decodedJson);

        print("Error");
      }
    }





    // telecharger cours
      downloadCours(filename) async {
        String url = "";
        http.Response response = await http.get(Uri.parse(
            'http://192.168.1.37/ISIMM_eCampus/public/api/download_cours?filename=H1654SBhg8VmuRecqNNL'),
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
      DeleteCours(matier_id, classe_id, commentair) async {
        http.Response response = await http.post(Uri.parse(
            "http://192.168.1.37/ISIMM_eCampus/public/api/supprimer_cours/$commentair?matiere_id=1&classe_id=1"),
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
      UpdateCours(String title, String subtitle,id) async {
        http.Response response = await http.post(Uri.parse(
            "http://192.168.1.37/ISIMM_eCampus/public/api/update_cours/${id}?matiere_id=1&classe_id=1"),
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