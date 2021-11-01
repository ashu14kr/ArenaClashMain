import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpadateCricketContestInfo with ChangeNotifier{
  var id;

  Future updateContestInfo()async{
    Response response;
    var dio = Dio();
    try {
      response =  await dio.patch("/cricket/contest/user/info/status/$id", data: {
        "status": "ongoing",
        "userUidWhoAccepted": FirebaseAuth.instance.currentUser!.uid.toString(),
      });
    } catch (e) {
      print(e);
    }
    print(id.toString());
  }

}