import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/football_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/live_challenges.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/my_challenges.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/ongoing_challenges.dart';
import 'package:arenaclash/Services/walletApi/get_current_balance.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FootballScreen extends StatefulWidget {
  const FootballScreen({Key? key}) : super(key: key);

  @override
  _FootballScreenState createState() => _FootballScreenState();
}

class _FootballScreenState extends State<FootballScreen> {
  ConstantColors constantColors = ConstantColors();

  @override
  void initState() {
    var userbalance = Provider.of<GetCurrentBalance>(context, listen: false).getCurrentBalance();
    userbalance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: constantColors.mainColor,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Provider.of<FootballHelper>(context, listen: false).createChallenge(context);
          },
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
              Provider.of<FootballHelper>(context, listen: false)
                  .upperContainer(context),
              const TabBar(
                  indicatorColor: Colors.red,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
                  indicatorWeight: 2.0,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "Live"),
                    Tab(text: "Ongoing"),
                    Tab(text: "History"),
                  ]),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: const TabBarView(children: [
                  LiveChallenges(),
                  FootballOngoingChallenge(),
                  FootballMyChallenge(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
