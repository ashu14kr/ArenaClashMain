import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/badmintonChallenge/badminton_helper.dart';
import 'package:arenaclash/Services/location/get_location.dart';
import 'package:arenaclash/Services/userApi/get_user_data.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostBadmintonContest with ChangeNotifier {
  Future postdualteamtournament(BuildContext context) async {
    Response response;
    var dio = Dio();
    var tdata = Provider.of<BadmintonHelper>(context, listen: false);
    num winamount = num.parse(tdata.dualcoins.text) * 1.9.round();
    var currentUid = FirebaseAuth.instance.currentUser!.uid;
    var userData = Provider.of<GetUserData>(context, listen: false);
    var location = Provider.of<GetCurrentLocation>(context, listen: false);
    try {
      response = await dio.post(
          "http://34.93.18.143/user/created/tournament/badminton/lljjsugsv",
          data: {
            "status": "live",
            "matchType": "dual",
            "totalPoints": tdata.dualPoint.text.toString(),
            "betCoins": tdata.dualcoins.text,
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
