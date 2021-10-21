import 'package:arenaclash/modals/badminton_by_accepted.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetFinishedContest with ChangeNotifier{

  Future<List<BadmintonContestByAccepted>?> getFinishedContest()async{
    var userUid = FirebaseAuth.instance.currentUser!.uid.toString();
    var url = Uri.parse("http://34.93.18.143/user/badminton/tournament/mjhsgfdrte/finised/$userUid/$userUid");
    try {
      var response = await http.get(url);
      print(response.body);
      if (200 == response.statusCode) {
        final List<BadmintonContestByAccepted> who = badmintonContestByAcceptedFromJson(response.body);
        return who;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      print(e);
    }
  }
}