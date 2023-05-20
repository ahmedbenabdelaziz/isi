import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class ApiUser{
 List<String>? message;

  Future<Map<String,dynamic>> LoginUser(String email,String password) async {
    http.Response response = await http.post(Uri.parse("https://192.168.1.37/ISIMM_eCampus/public/api/login"),
         body : jsonEncode({
        'email': email,
        'password': password,
        }),
        headers: {
          'content-type':'application/json',
          'accept':'application/json',
        }
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return data;
    } else {
      return data;
    }
  }


  RegistreUser(String nom, String prenom, String email, String password, String date, String telephone, File image) async {
   try {
     var request = http.MultipartRequest(
       'POST',
       Uri.parse('https://192.168.1.25/ISIMM_eCampus/public/api/register_enseignant'),
     );

     var imageStream = http.ByteStream(image.openRead());
     var imageLength = await image.length();
     var imageUploadRequest = http.MultipartFile(
       'image',
       imageStream,
       imageLength,
       filename: basename(image.path),
     );
     request.files.add(imageUploadRequest);

     request.fields['name'] = nom;
     request.fields['prenom'] = prenom;
     request.fields['email'] = email;
     request.fields['password'] = password;
     request.fields['password_confirmation'] = password;
     request.fields['date_de_naissance'] = date;
     request.fields['telephone'] = telephone;

     var response = await request.send();
     if (response.statusCode == 200) {
       String responseText = await response.stream.bytesToString();
       Map<String, dynamic> responseData = jsonDecode(responseText);
       print(responseData);
       return responseData['message'];
     } else {
       String responseText = await response.stream.bytesToString();
       Map<String, dynamic> responseData = jsonDecode(responseText);
       print(responseData['message']);
       return responseData['message'];


     }
   } catch (e) {
     print("eee");
   }
 }


}