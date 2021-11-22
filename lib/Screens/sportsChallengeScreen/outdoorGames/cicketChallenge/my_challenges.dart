import 'package:arenaclash/Services/cricketcontestApi/get_finished_contest.dart';
import 'package:arenaclash/modals/cricket_contest.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyChallenges extends StatefulWidget {
  const MyChallenges({Key? key}) : super(key: key);

  @override
  _MyChallengesState createState() => _MyChallengesState();
}

class _MyChallengesState extends State<MyChallenges> {
  List<CricketContestData>? _data;
  bool? _loading;
  var uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    _loading = true;
    Provider.of<GetCricketFinishedContest>(context, listen: false)
        .getFinishedContest()
        .then((value) => {
          setState((){
            _data = value;
            _loading = false;
          })
        });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: null == _data ? 0 : _data!.length,
              itemBuilder: (context, index) {
                CricketContestData data = _data![index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Text("CRICKET_${data.matchType}",
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 12)),
                                    const SizedBox(height: 5),
                                    const Text("has challenged for"),
                                    const SizedBox(height: 4),
                                    Text("${data.betCoins.toString()}.0 Coins",
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 15)),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
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
                                          style: TextStyle(color: Colors.grey)),
                                      Text(data.winningCoins.toString()+".00",
                                          style: const TextStyle(color: Colors.green))
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
                                  Text(data.whoWon == uid ? "You Won" : data.whoLose == uid ? "You Lose" : "Cancelled",
                                      style: TextStyle(color: Colors.blue[800]))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                );
              }),
        ));
  }
}
