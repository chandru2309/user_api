import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'module.dart';

 class ApiServer {
//   Future<List<UserModel>?> getUsers() async {
//     try {
//       var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
//       print('-- API URL --- ${url}');
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         print('------ DATA SUCCESS');
//
//         List<UserModel> userModelFromJson(String str) => List<UserModel>.from(
//             json.decode(str).map((x) => UserModel.fromJson(x)));
//
//         List<UserModel> model = userModelFromJson(response.body);
//
//         print('*** RESPONSE *** ${response.body}');
//         return model;
//       } else {
//         print('================ ERROR ================');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
//
// class ApiConstants {
//
//   static String baseUrl = 'https://jsonplaceholder.typicode.com';
//   static String usersEndpoint = '/users';
// }
   //
   Future<List<OfficeModel>?> getUsers() async {
     try {
       print('Reading from asset');
       final String response =
       await rootBundle.loadString('assets/office.json');



       if (response != null) {
         print('------ DATA SUCCESS');

         List<OfficeModel> userModelFromJson(String str) =>
             List<OfficeModel>.from(
                 json.decode(str).map((x) => OfficeModel.fromJson(x)));

         List<OfficeModel> model = userModelFromJson(response);

         print('*** RESPONSE *** ${response}');
         return model;
       } else {
         print('================ ERROR ================');
       }
     } catch (e) {
       print(e.toString());
     }
   }
 }


