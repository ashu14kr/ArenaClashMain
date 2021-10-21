import 'package:arenaclash/modals/current_balance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetCurrentBalance with ChangeNotifier{
  var amount;
  
  Future<List<CurrentBalance>?> getCurrentBalance() async {
    var currentuid = FirebaseAuth.instance.currentUser!.uid.toString();
    var Url = Uri.parse("http://34.93.18.143/walletBalance/user/$currentuid");
    try {
      var response = await http.get(Url);
      print(response.body);
      if (200 == response.statusCode) {
        final CurrentBalance currentBalance = currentBalanceFromJson(response.body);
        amount = currentBalance.amount;
        print(currentBalance.id);
      }else{
        throw Exception("data no found");
      }
    } catch (e) {
      print(e);
    }
  }
}