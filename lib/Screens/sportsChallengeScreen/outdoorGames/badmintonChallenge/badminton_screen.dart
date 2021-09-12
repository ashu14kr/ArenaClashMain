import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/drawer/home_drawer.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/badmintonChallenge/badminton_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/badmintonChallenge/live_challenges.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class BadmintonScreen extends StatefulWidget {
  const BadmintonScreen({ Key? key }) : super(key: key);

  @override
  _BadmintonScreenState createState() => _BadmintonScreenState();
}

class _BadmintonScreenState extends State<BadmintonScreen> {
  ConstantColors constantColors = ConstantColors();
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const HomeAndDrawer(),
                        type: PageTransitionType.leftToRight));
              },
              icon: const Icon(EvaIcons.arrowIosBack)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Provider.of<BadmintonHelper>(context, listen: false)
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