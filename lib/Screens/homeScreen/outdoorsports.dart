import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/badmintonChallenge/badminton_screen.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/cicketChallenge/cricket_screen.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/football_screen.dart';
import 'package:arenaclash/Services/location/get_location.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OutdoorSports extends StatefulWidget {
  const OutdoorSports({Key? key}) : super(key: key);

  @override
  _OutdoorSportsState createState() => _OutdoorSportsState();
}

class _OutdoorSportsState extends State<OutdoorSports> {

  @override
  void initState() {
    Provider.of<GetCurrentLocation>(context, listen: false).getUserLocation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const FootballScreen(),
                          type: PageTransitionType.leftToRight));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/football.png"),
                          fit: BoxFit.contain)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const CricketScreen(),
                          type: PageTransitionType.leftToRight));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/cricket.png"),
                          fit: BoxFit.contain)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const BadmintonScreen(),
                          type: PageTransitionType.leftToRight));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/badminton.png"),
                          fit: BoxFit.contain)),
                ),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.23,
              //   width: MediaQuery.of(context).size.width * 0.5,
              //   decoration: const BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage("assets/images/volleyball.png"),
              //           fit: BoxFit.contain)),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
