import 'package:arenaclash/modals/badminton_by_accepted.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetBadmintonOngoingContest with ChangeNotifier{

  Future<List<BadmintonContestByAccepted>?> getByAccepted()async{
    var userUid = FirebaseAuth.instance.currentUser!.uid.toString();
    var url = Uri.parse("http://34.93.18.143/user/badminton/tournament/mjhsgfdrte/ongoing/$userUid/$userUid");
    try {
      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final List<BadmintonContestByAccepted> getWhoAccept = badmintonContestByAcceptedFromJson(response.body);
        print(getWhoAccept);
        return getWhoAccept;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      print(e);
    }
  }
}