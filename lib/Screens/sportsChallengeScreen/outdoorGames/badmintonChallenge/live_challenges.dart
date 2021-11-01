import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/badmintonChallenge/badminton_screen.dart';
import 'package:arenaclash/Services/location/get_location.dart';
import 'package:arenaclash/Services/tournamentApi/get_live_contest.dart';
import 'package:arenaclash/Services/walletApi/get_current_balance.dart';
import 'package:arenaclash/modals/badminton_contest.dart';
import 'package:dio/dio.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BadmintonLiveChallenges extends StatefulWidget {
  const BadmintonLiveChallenges({Key? key}) : super(key: key);

  @override
  _BadmintonLiveChallengesState createState() =>
      _BadmintonLiveChallengesState();
}

class _BadmintonLiveChallengesState extends State<BadmintonLiveChallenges> {
  ConstantColors constantColors = ConstantColors();
  List<BadmintonContestData>? _livestatus;
  bool? _loading;

  @override
  void initState() {
    _loading = true;
    Provider.of<GetLiveContest>(context, listen: false)
        .getcontestwithlive()
        .then((status) => {
              setState(() {
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
        ? const Text("Loading...")
        : Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: null == _livestatus ? 0 : _livestatus!.length,
                  itemBuilder: (context, index) {
                    BadmintonContestData badmintonContestData =
                        _livestatus![index];
                    var distance = Geolocator.distanceBetween(
                        location.contestCreaterlat,
                        location.contestCreaterlng,
                        badmintonContestData.userlat,
                        badmintonContestData.userlng)/100;
                    return distance <= 2 ? Padding(
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
                                          backgroundColor: Colors.blue,
                                        ),
                                        Text("Arena Clash",
                                            style: TextStyle(fontSize: 10))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                            "BADMINTON_" +
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
                                                ".0 Coins",
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 15)),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        CircleAvatar(
                                          backgroundColor: Colors.blue,
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
                                                      .toString() +
                                                  ".00",
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
                                                          height: 25),
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
                                                                    '.00 coins',
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
                                                          children: const [
                                                            Text('Created By',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                            Text('Arena Clash',
                                                                style: TextStyle(
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
                                                                'Contact Details',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                            Text(
                                                                badmintonContestData
                                                                    .userWhoCreatedContactDetail
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
                                                          children: const [
                                                            Text(
                                                                'Contest Created',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                            Text(
                                                                'Oct 30,2021 9:15 PM',
                                                                style: TextStyle(
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
                                                          height: 30),
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
                                                                                response = await dio.patch("http://34.93.18.143/badminton/contest/user/info/status/$id", data: {
                                                                                  "status": "ongoing",
                                                                                  "userUidWhoAccepted": FirebaseAuth.instance.currentUser!.uid.toString(),
                                                                                })
                                                                              })
                                                                      .whenComplete(
                                                                          () =>
                                                                              {
                                                                                Navigator.pushReplacement(context, PageTransition(child: const BadmintonScreen(), type: PageTransitionType.leftToRight))
                                                                              });
                                                            } catch (e) {
                                                              print(e);
                                                            }
                                                          } else {
                                                            print(
                                                                "balance is less");
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
