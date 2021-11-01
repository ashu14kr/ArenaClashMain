import 'package:arenaclash/modals/badminton_by_accepted.dart';
import 'package:arenaclash/modals/cricket_contest.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class GetCricketFinishedContest with ChangeNotifier{

  Future<List<CricketContestData>?> getFinishedContest()async{
    var userUid = FirebaseAuth.instance.currentUser!.uid.toString();
    var url = Uri.parse("http://34.93.18.143/user/cricket/tournament/mjhsgfdrte/finished/$userUid/$userUid");
    try {
      var response = await http.get(url);
      print(response.body);
      if (200 == response.statusCode) {
        final List<CricketContestData> who = cricketContestDataFromJson(response.body);
        return who;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      print(e);
    }
  }
}