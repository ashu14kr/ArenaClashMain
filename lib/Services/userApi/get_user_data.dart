import 'package:arenaclash/modals/current_user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetUserData with ChangeNotifier{

  var name;
  var email;
  var phone;

  Future<List<CurrentUserData>?> getUserData() async{
    var currentuid = FirebaseAuth.instance.currentUser!.uid.toString();
    var Url = Uri.parse("http://34.93.18.143/connected/user/$currentuid");
    try {
      var response = await http.get(Url);
      print(response.body);
      if (200 == response.statusCode) {
        final CurrentUserData currentUserData = currentUserDataFromJson(response.body);
        name = currentUserData.name;
        email = currentUserData.email;
        phone = currentUserData.phoneno;
        print(currentUserData.name);
      } else {
        throw Exception("data not found");
      }
    } catch (e) {
      print(e);
    }
  } 

}