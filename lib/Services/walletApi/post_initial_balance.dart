import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostInitialBalance with ChangeNotifier{

  Future postRegistrationBalance(BuildContext context)async{
    Response response;
    var dio = Dio();
    try {
      response = await dio.post("http://34.93.18.143/userWalletBalance", data: {
        "_id": FirebaseAuth.instance.currentUser!.uid.toString(),
        "amount": 0
      });
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

}