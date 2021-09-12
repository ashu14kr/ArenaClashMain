import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class LiveChallenges extends StatefulWidget {
  const LiveChallenges({Key? key}) : super(key: key);

  @override
  _LiveChallengesState createState() => _LiveChallengesState();
}

class _LiveChallengesState extends State<LiveChallenges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
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
                                    Text("Salena Gomez",
                                        style: TextStyle(fontSize: 10))
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text("FOOTBALL_DGBDWUHN",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12)),
                                    SizedBox(height: 5),
                                    Text("has challenged for"),
                                    SizedBox(height: 4),
                                    Text("100.0 Coins",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 15)),
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
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Row(
                                    children: const [
                                      Text("Winning:",
                                          style: TextStyle(color: Colors.grey)),
                                      Text("180.00",
                                          style: TextStyle(color: Colors.green))
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    height: 25,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 35),
                                  Row(
                                    children: const [
                                      Icon(EvaIcons.pinOutline),
                                    ],
                                  ),
                                  const SizedBox(width: 35),
                                  Container(
                                    height: 25,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 25),
                                  Text("Accept", style: TextStyle(color: Colors.blue[800]))
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
