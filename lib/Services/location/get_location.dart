import 'package:arenaclash/Services/tournamentApi/get_live_contest.dart';
import 'package:arenaclash/modals/badminton_contest.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class GetCurrentLocation with ChangeNotifier{

  var contestCreaterlat;
  var contestCreaterlng;
  var distance = 10;


  Future getUserLocation(BuildContext context) async{

    Position currentLocation;
    List<BadmintonContestData>? _livestatus;

    currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    contestCreaterlat = currentLocation.latitude;
    contestCreaterlng = currentLocation.longitude;

    Provider.of<GetLiveContest>(context, listen: false)
        .getcontestwithlive()
        .then((status) => {
                _livestatus = status,
            });

    for (var i = 0; i < _livestatus!.length; i++) {
      BadmintonContestData data = _livestatus![i];

      // distance = Geolocator.distanceBetween(data.userlat, data.userlng, contestCreaterlat, contestCreaterlng)/100;
    }

    // distance = Geolocator.distanceBetween(contestCreaterlat, contestCreaterlng, demolat, demolng)/100;

    // if (distance <= 20) {
    //   print(distance.round());
    // } else{
    //   print("no user found....");
    // }

  }
}