import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/onlineGames/freefireChallenge/freefire_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/badmintonChallenge/live_challenges.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FreefireChallenge extends StatefulWidget {
  const FreefireChallenge({ Key? key }) : super(key: key);

  @override
  _FreefireChallengeState createState() => _FreefireChallengeState();
}

class _FreefireChallengeState extends State<FreefireChallenge> {

  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return 
      DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: constantColors.mainColor,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Icon(EvaIcons.plus),
          backgroundColor: Colors.red,
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Provider.of<FreefireHelper>(context, listen: false)
                  .upperContainer(context),
              const TabBar(
                  indicatorColor: Colors.red,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 80),
                  indicatorWeight: 2.0,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "Live challenges"),
                    Tab(text: "My Challenges"),
                  ]),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: const TabBarView(children: [
                  BadmintonLiveChallenges(),
                  BadmintonLiveChallenges(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}