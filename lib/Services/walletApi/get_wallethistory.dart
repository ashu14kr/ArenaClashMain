import 'package:arenaclash/modals/transaction_history.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetCurrenUserWalletHistory with ChangeNotifier{

  Future<List<TransactionHistory>?> getUserTransactionHistory()async{
    var currentuid = FirebaseAuth.instance.currentUser!.uid.toString();
    var url = Uri.parse("http://34.93.18.143/walletreact/$currentuid");
    try {
      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final List<TransactionHistory> history = transactionHistoryFromJson(response.body);
        print(history);
        return history;
      }else{
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e);
    }
}
}

