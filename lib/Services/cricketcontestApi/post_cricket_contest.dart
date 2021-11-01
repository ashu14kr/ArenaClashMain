import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/badmintonChallenge/badminton_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/cicketChallenge/cricket_helper.dart';
import 'package:arenaclash/Services/location/get_location.dart';
import 'package:arenaclash/Services/userApi/get_user_data.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCricketContest with ChangeNotifier {
  Future postdualteamtournament(BuildContext context) async {
    Response response;
    var dio = Dio();
    var tdata = Provider.of<CricketHelper>(context, listen: false);
    num winamount = num.parse(tdata.totalCoins.text) * 1.8.round();
    var currentUid = FirebaseAuth.instance.currentUser!.uid;
    var userData = Provider.of<GetUserData>(context, listen: false);
    var location = Provider.of<GetCurrentLocation>(context, listen: false);
    try {
      response = await dio.post(
          "http://34.93.18.143/user/created/tournament/cricket/lljjsugsv",
          data: {
            "status": "live",
            "matchType": "dual",
            "totalOvers": tdata.totalOvers.text.toString(),
            "betCoins": tdata.totalCoins.text,
            "winningCoins": winamount,
            "whoWon": "",
            "whoLose": "",
            "userlat": location.contestCreaterlat,
            "userlng": location.contestCreaterlng,
            "userUidWhoCreated": currentUid.toString(),
            "userUidWhoAccepted": "jdhudehue",
            "userWhoCreatedLocation": "kskkssoqo",
            "userWhoCreatedContactDetail": userData.phone.toString(),
            "contestCreatedDate": "",
            "createrName": "",
            "acceperName": "oyo"
          });
          print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
