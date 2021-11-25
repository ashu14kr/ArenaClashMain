import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/football_helper.dart';
import 'package:arenaclash/Services/location/get_location.dart';
import 'package:arenaclash/Services/userApi/get_user_data.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostFootballContest with ChangeNotifier {
  Future postdualteamtournament(BuildContext context) async {
    Response response;
    DateTime now = DateTime.now();
    String time = now.month.toString()+ ","+now.day.toString()+","+  now.year.toString() + " "+ now.hour.toString() + ":" + now.minute.toString();
    var dio = Dio();
    var tdata = Provider.of<FootballHelper>(context, listen: false);
    num winamount = num.parse(tdata.totalCoins.text);
    double winningamount = winamount * 1.8;
    String formatted = winningamount.toStringAsFixed(2);
    double formattedDouble = double.parse(formatted);
    var currentUid = FirebaseAuth.instance.currentUser!.uid;
    var userData = Provider.of<GetUserData>(context, listen: false);
    var location = Provider.of<GetCurrentLocation>(context, listen: false);
    try {
      response = await dio.post(
          "http://34.93.18.143/user/created/tournament/football/lljjsugsv",
          data: {
            "status": "live",
            "matchType": "Team",
            "totalGoals": tdata.totalGoals.text.toString(),
            "betCoins": tdata.totalCoins.text.toString(),
            "winningCoins": formattedDouble.toString(),
            "whoWon": "",
            "whoLose": "",
            "userlat": location.contestCreaterlat,
            "userlng": location.contestCreaterlng,
            "userUidWhoCreated": currentUid.toString(),
            "userUidWhoAccepted": "jdhudehue",
            "userWhoCreatedLocation": tdata.totalPlayers.text.toString(),
            "userWhoCreatedContactDetail": userData.phone.toString(),
            "contestCreatedDate": time.toString(),
            "createrName": userData.name.toString(),
            "acceperName": "oyo"
          });
          print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
