import 'package:arenaclash/modals/badminton_contest.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetLiveContest with ChangeNotifier {

  Future<List<BadmintonContestData>?> getcontestwithlive() async {
    var url = Uri.parse(
        "http://34.93.18.143/user/badminton/tournament/mjhsgfdrte/live");
    try {
      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final List<BadmintonContestData> liveContest = badmintonFromJson(response.body);
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
