import 'package:arenaclash/Screens/sportsChallengeScreen/onlineGames/freefireChallenge/freefire_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OnlineGames extends StatefulWidget {
  const OnlineGames({Key? key}) : super(key: key);

  @override
  _OnlineGamesState createState() => _OnlineGamesState();
}

class _OnlineGamesState extends State<OnlineGames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          /*
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const FreefireChallenge(),
                          type: PageTransitionType.leftToRight));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/freefire.png"),
                          fit: BoxFit.contain)),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/ludo.png"),
                          fit: BoxFit.contain)),
                ),
              ),
            ],
          ),
          */
          Center(child: Image(image: AssetImage("assets/images/empty.png"))),
        ],
      ),
    );
  }
}
