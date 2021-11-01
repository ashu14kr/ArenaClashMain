import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/badmintonChallenge/badminton_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/cicketChallenge/cricket_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/football_helper.dart';
import 'package:arenaclash/Services/walletApi/get_current_balance.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateBalance with ChangeNotifier{

  Future updateCurrentBalance(BuildContext context) async {
    var currentAmount = Provider.of<GetCurrentBalance>(context, listen: false).amount;
    var balance = Provider.of<BadmintonHelper>(context, listen: false);
    num updatedBalance = num.parse(balance.dualcoins.text);
    var testedUpdatedBalnce = currentAmount - updatedBalance;
    Response response;
    var dio = Dio();
    var currentuid = FirebaseAuth.instance.currentUser!.uid.toString();
    try {
      response = await dio.patch("http://34.93.18.143/walletBalance/user/updated/$currentuid", data: {
        "amount": testedUpdatedBalnce
      });
    } catch (e) {
      print(e);
    }
  }

  Future footballUpdateCurrentBalance(BuildContext context) async {
    var currentAmount = Provider.of<GetCurrentBalance>(context, listen: false).amount;
    var balance = Provider.of<FootballHelper>(context, listen: false);
    num updatedBalance = num.parse(balance.totalCoins.text);
    var testedUpdatedBalnce = currentAmount - updatedBalance;
    Response response;
    var dio = Dio();
    var currentuid = FirebaseAuth.instance.currentUser!.uid.toString();
    try {
      response = await dio.patch("http://34.93.18.143/walletBalance/user/updated/$currentuid", data: {
        "amount": testedUpdatedBalnce
      });
    } catch (e) {
      print(e);
    }
  }

  Future cricketUpdateCurrentBalance(BuildContext context) async {
    var currentAmount = Provider.of<GetCurrentBalance>(context, listen: false).amount;
    var balance = Provider.of<CricketHelper>(context, listen: false);
    num updatedBalance = num.parse(balance.totalCoins.text);
    var testedUpdatedBalnce = currentAmount - updatedBalance;
    Response response;
    var dio = Dio();
    var currentuid = FirebaseAuth.instance.currentUser!.uid.toString();
    try {
      response = await dio.patch("http://34.93.18.143/walletBalance/user/updated/$currentuid", data: {
        "amount": testedUpdatedBalnce
      });
    } catch (e) {
      print(e);
    }
  }
}