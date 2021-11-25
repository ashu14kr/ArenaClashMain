import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/cicketChallenge/cricket_screen.dart';
import 'package:arenaclash/Services/cricketcontestApi/get_ongoing_contest.dart';
import 'package:arenaclash/modals/cricket_contest.dart';
import 'package:dio/dio.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CircketOngoingChallenge extends StatefulWidget {
  const CircketOngoingChallenge({ Key? key }) : super(key: key);

  @override
  _CircketOngoingChallengeState createState() => _CircketOngoingChallengeState();
}

class _CircketOngoingChallengeState extends State<CircketOngoingChallenge> {
  List<CricketContestData>? _data;
  bool? _loading;

  @override
  void initState() {
    _loading = true;
    Provider.of<GetCricketOngoingContest>(context, listen: false)
        .getByAccepted()
        .then((value) => {
              setState(() {
                _data = value;
                _loading = false;
              }),
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: null == _data ? 0 : _data!.length,
              itemBuilder: (context, index) {
                CricketContestData whoAccepted = _data![index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Stack(children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return Container(
                                height: size.height * 0.55,
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: constantColors.darkColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        topRight: Radius.circular(16))),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 150),
                                      child: Divider(
                                        thickness: 2,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Status',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          Text(whoAccepted.status.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Match Type',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          Text(whoAccepted.matchType.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Winning',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          Text(
                                              whoAccepted.winningCoins
                                                      .toString() +
                                                  ' coins',
                                              style: const TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Created By',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          Text(whoAccepted.createrName.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Contact Details',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          Text(
                                              whoAccepted
                                                  .userWhoCreatedContactDetail
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Contest Created',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                          Text(whoAccepted.contestCreatedDate.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FloatingActionButton.extended(
                                            onPressed: () async {
                                              Response response;
                                              var dio = Dio();
                                              var id =
                                                  whoAccepted.id.toString();
                                              try {
                                                response = await dio.patch(
                                                    "http://34.93.18.143/cricket/contest/user/info/status/$id",
                                                    data: {
                                                      "status": "ongoing",
                                                      "whoWon": FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .uid
                                                          .toString(),
                                                    }).whenComplete(() => {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          PageTransition(
                                                              child:
                                                                  const CricketScreen(),
                                                              type: PageTransitionType
                                                                  .leftToRight))
                                                    });
                                                print(response.data);
                                              } catch (e) {
                                                print(e);
                                              }
                                            },
                                            label: Column(
                                              children: const [
                                                Icon(Icons
                                                    .sports_cricket_rounded),
                                                Text("Won")
                                              ],
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                          FloatingActionButton.extended(
                                            onPressed: () async {
                                              Response response;
                                              var dio = Dio();
                                              var id =
                                                  whoAccepted.id.toString();
                                              try {
                                                response = await dio.patch(
                                                    "http://34.93.18.143/cricket/contest/user/info/status/$id",
                                                    data: {
                                                      "status": "ongoing",
                                                      "whoLose": FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .uid
                                                          .toString(),
                                                    }).whenComplete(() => {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          PageTransition(
                                                              child:
                                                                  const CricketScreen(),
                                                              type: PageTransitionType
                                                                  .leftToRight))
                                                    });
                                                print(response.data);
                                              } catch (e) {
                                                print(e);
                                              }
                                            },
                                            label: Column(
                                              children: const [
                                                Icon(Icons.personal_injury),
                                                Text("Lost")
                                              ],
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                          FloatingActionButton.extended(
                                            onPressed: () async {
                                              Response response;
                                              var dio = Dio();
                                              var id =
                                                  whoAccepted.id.toString();
                                              try {
                                                response = await dio.patch(
                                                    "http://34.93.18.143/cricket/contest/user/info/status/$id",
                                                    data: {
                                                      "status": "finished",
                                                    }).whenComplete(() => {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          PageTransition(
                                                              child:
                                                                  const CricketScreen(),
                                                              type: PageTransitionType
                                                                  .leftToRight))
                                                    });
                                                print(response.data);
                                              } catch (e) {
                                                print(e);
                                              }
                                            },
                                            label: Column(
                                              children: const [
                                                Icon(Icons.cancel_outlined),
                                                Text("Cancel")
                                              ],
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
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
                                          "BADMINTON_" +
                                              whoAccepted.matchType.toString(),
                                          style: const TextStyle(
                                              color: Colors.red, fontSize: 12)),
                                      const SizedBox(height: 5),
                                      const Text("has challenged for"),
                                      const SizedBox(height: 4),
                                      Text(
                                          whoAccepted.betCoins.toString() +
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
                                      Text("Arena Clash",
                                          style: TextStyle(fontSize: 10))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Text("Winning:",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(
                                            whoAccepted.winningCoins
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
                                    const SizedBox(width: 25),
                                    Text("Waiting",
                                        style:
                                            TextStyle(color: Colors.blue[800]))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                );
              }),
        ));
  }
}