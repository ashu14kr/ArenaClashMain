import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/football_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OutdoorSports extends StatefulWidget {
  const OutdoorSports({Key? key}) : super(key: key);

  @override
  _OutdoorSportsState createState() => _OutdoorSportsState();
}

class _OutdoorSportsState extends State<OutdoorSports> {
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
                  Navigator.pushReplacement(
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
              Container(
                height: MediaQuery.of(context).size.height * 0.23,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/badminton.png"),
                        fit: BoxFit.contain)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [],
          )
        ],
      ),
    );
  }
}
