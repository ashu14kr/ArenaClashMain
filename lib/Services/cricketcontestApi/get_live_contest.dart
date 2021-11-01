import 'package:arenaclash/modals/cricket_contest.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetCricketLiveContest with ChangeNotifier {

  Future<List<CricketContestData>?> getcontestwithlive() async {
    var url = Uri.parse(
        "http://34.93.18.143/user/cricket/tournament/mjhsgfdrte/live");
    try {
      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final List<CricketContestData> liveContest = cricketContestDataFromJson(response.body);
        print(liveContest);
        return liveContest;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      print(e);
    }
  }
}