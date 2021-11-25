import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/cicketChallenge/cricket_screen.dart';
import 'package:arenaclash/Screens/walletScreen/wallet_screen.dart';
import 'package:arenaclash/Services/cricketcontestApi/get_live_contest.dart';
import 'package:arenaclash/Services/location/get_location.dart';
import 'package:arenaclash/Services/walletApi/get_current_balance.dart';
import 'package:arenaclash/modals/cricket_contest.dart';
import 'package:dio/dio.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CricketLiveChallenges extends StatefulWidget {
  const CricketLiveChallenges({ Key? key }) : super(key: key);

  @override
  _CricketLiveChallengesState createState() => _CricketLiveChallengesState();
}

class _CricketLiveChallengesState extends State<CricketLiveChallenges> {

  ConstantColors constantColors = ConstantColors();
  List<CricketContestData>? _livestatus;
  bool? _loading;

  @override
  void initState() {
    Provider.of<GetCurrentLocation>(context, listen: false).getUserLocation(context);
    var userbalance = Provider.of<GetCurrentBalance>(context, listen: false).getCurrentBalance();
    _loading = true;
    Provider.of<GetCricketLiveContest>(context, listen: false)
        .getcontestwithlive()
        .then((status) => {
              setState(() {
                userbalance;
                _livestatus = status;
                _loading = false;
              }),
            });
    super.initState();
  }

  Future _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    var location = Provider.of<GetCurrentLocation>(context, listen: false);
    return _loading == true
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: null == _livestatus ? 0 : _livestatus!.length,
                  itemBuilder: (context, index) {
                    CricketContestData badmintonContestData =
                        _livestatus![index];
                    var distance = Geolocator.distanceBetween(
                        location.contestCreaterlat,
                        location.contestCreaterlng,
                        badmintonContestData.userlat,
                        badmintonContestData.userlng);
                    return distance <= 2000 && badmintonContestData.userUidWhoCreated != FirebaseAuth.instance.currentUser!.uid ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Stack(children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: const [
                                        CircleAvatar(
                                          backgroundColor: Colors.red,
                                          child: Icon(EvaIcons.personOutline),
                                        ),
                                        Text("Arena Clash",
                                            style: TextStyle(fontSize: 10))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                            "CRICKET_" +
                                                badmintonContestData.matchType
                                                    .toString(),
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 12)),
                                        const SizedBox(height: 5),
                                        const Text("has challenged for"),
                                        const SizedBox(height: 4),
                                        Text(
                                            badmintonContestData.betCoins
                                                    .toString() +
                                                " Coins",
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 15)),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        CircleAvatar(
                                          backgroundColor: Colors.red,
                                          child: Icon(EvaIcons.personOutline),
                                        ),
                                        Text("Waiting...",
                                            style: TextStyle(fontSize: 10))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.89,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(5.0, 5.0),
                                          blurRadius: 10.0,
                                          spreadRadius: 2.0)
                                    ],
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Winning:",
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          Text(
                                              badmintonContestData.winningCoins
                                                      .toString(),
                                              style: const TextStyle(
                                                  color: Colors.green))
                                        ],
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        height: 25,
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 35),
                                      InkWell(
                                        onTap: () {
                                          String lat = badmintonContestData
                                              .userlat
                                              .toString();
                                          String lng = badmintonContestData
                                              .userlng
                                              .toString();
                                          launch(
                                              "https://www.google.com/maps/place/$lat"
                                              ",$lng/");
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(EvaIcons.pinOutline),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 35),
                                      Container(
                                        height: 25,
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 25),
                                      InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              backgroundColor:
                                                  Colors.transparent,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  height: size.height * 0.6,
                                                  width: size.width,
                                                  decoration: BoxDecoration(
                                                      color: constantColors
                                                          .darkColor,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              topLeft: Radius
                                                                  .circular(16),
                                                              topRight: Radius
                                                                  .circular(
                                                                      16))),
                                                  child: Column(
                                                    children: [
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    150),
                                                        child: Divider(
                                                          thickness: 2,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text('Status',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                            Text(
                                                                badmintonContestData
                                                                    .status
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white))
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        child: Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                                'Match Type',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                            Text(
                                                                badmintonContestData
                                                                    .matchType
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white))
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        child: Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                                'Winning',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                            Text(
                                                                badmintonContestData
                                                                        .winningCoins
                                                                        .toString() +
                                                                    ' coins',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white))
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        child: Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text('Created By',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                            Text(badmintonContestData.createrName,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white))
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        child: Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                                'Opponent Total Player',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                            Text(
                                                                badmintonContestData
                                                                    .userWhoCreatedLocation
                                                                    .toString() + " players",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white))
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        child: Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                                'Match Total Duration',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                            Text(
                                                                badmintonContestData
                                                                    .totalOvers
                                                                    .toString() + " overs",
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white))
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        child: Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                                'Contest Created',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                            Text(
                                                                badmintonContestData.contestCreatedDate.toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white))
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 15),
                                                        child: Divider(
                                                          thickness: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      InkWell(
                                                        onTap: () async {
                                                          Response? response;
                                                          var dio = Dio();
                                                          var currentId =
                                                              FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid
                                                                  .toString();
                                                          var currentBalance =
                                                              Provider.of<
                                                                      GetCurrentBalance>(
                                                                  context,
                                                                  listen:
                                                                      false);
                                                          var updateUserBalance =
                                                              currentBalance
                                                                      .amount -
                                                                  badmintonContestData
                                                                      .betCoins;
                                                          var id =
                                                              badmintonContestData
                                                                  .id
                                                                  .toString();
                                                          currentBalance
                                                              .getCurrentBalance();
                                                          if (currentBalance
                                                                  .amount >=
                                                              badmintonContestData
                                                                  .betCoins) {
                                                            try {
                                                              response =
                                                                  await dio
                                                                      .patch(
                                                                          "http://34.93.18.143/walletBalance/user/updated/$currentId",
                                                                          data: {
                                                                            "amount":
                                                                                updateUserBalance,
                                                                          })
                                                                      .whenComplete(
                                                                          () async =>
                                                                              {
                                                                                response = await dio.patch("http://34.93.18.143/cricket/contest/user/info/status/$id", data: {
                                                                                  "status": "ongoing",
                                                                                  "userUidWhoAccepted": FirebaseAuth.instance.currentUser!.uid.toString(),
                                                                                })
                                                                              })
                                                                      .whenComplete(
                                                                          () =>
                                                                              {
                                                                                Navigator.pushReplacement(context, PageTransition(child: const CricketScreen(), type: PageTransitionType.leftToRight))
                                                                              });
                                                            } catch (e) {
                                                              print(e);
                                                            }
                                                          } else {
                                                            Fluttertoast.showToast(
                                                                      msg:
                                                                          "Balance is less. please refill your wallet to play",
                                                                      toastLength:
                                                                          Toast
                                                                              .LENGTH_SHORT,
                                                                      gravity: ToastGravity
                                                                          .CENTER,
                                                                      timeInSecForIosWeb:
                                                                          1,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      textColor:
                                                                          Colors
                                                                              .white,
                                                                      fontSize:
                                                                          16.0);
                                                                  Navigator.pushReplacement(
                                                                      context,
                                                                      PageTransition(
                                                                          child:
                                                                              const WalletScreen(),
                                                                          type:
                                                                              PageTransitionType.leftToRight));
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          width: 200,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.green,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                          child: const Center(
                                                              child: Text(
                                                                  "Confirm",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16))),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: Text("Accept",
                                            style: TextStyle(
                                                color: Colors.blue[800])),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ): const Text("data", style: TextStyle(fontSize: 0),);
                  }),
            ));
  }
}