import 'package:arenaclash/Screens/registrationScreen/registration_helper.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserData with ChangeNotifier {
  Future postUserData(BuildContext context) async {
    Response response;
    var dio = Dio();
    try {
      response = await dio.post('http://34.93.18.143/users', data:{
      "_id": FirebaseAuth.instance.currentUser!.uid.toString(),
      "name": Provider.of<RegistrationHelper>(context, listen: false).userName.text,
      "email": FirebaseAuth.instance.currentUser!.email.toString(),
      "phoneno":Provider.of<RegistrationHelper>(context, listen: false).userNumber.text,
      "password":Provider.of<RegistrationHelper>(context, listen: false).userPassword.text,
      });
      print(response.data);
      print(response.statusCode);
    } catch (e) {
      print(e);
    }  }
}



      