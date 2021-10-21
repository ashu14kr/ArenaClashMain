import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/cicketChallenge/cricket_helper.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WinOrLossScreen extends StatefulWidget {
  const WinOrLossScreen({ Key? key }) : super(key: key);

  @override
  _WinOrLossScreenState createState() => _WinOrLossScreenState();
}

class _WinOrLossScreenState extends State<WinOrLossScreen> {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: constantColors.mainColor,
      appBar: AppBar(
        title: const Text("Circket Challenge"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: size.height*0.2,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: const [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.blue,
                                    ),
                                    Text("Salena Gomez",
                                        style: TextStyle(fontSize: 10))
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text("CRICKET_OneVsOne",
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
                                      radius: 25,
                                      backgroundColor: Colors.blue,
                                    ),
                                    Text("Waiting...",
                                        style: TextStyle(fontSize: 10))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
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
                                  InkWell(
                                    onTap: (){
                                      Provider.of<CricketHelper>(context, listen: false).fullChallengeDetail(context);
                                    },
                                    child: Text("Details", style: TextStyle(color: Colors.blue[800])))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
            ),
          ),
          const SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton.extended(onPressed: (){}, label: Column(
                  children: const [
                    Icon(Icons.sports_cricket_rounded),
                    Text("Won")
                  ],
                ), backgroundColor: Colors.red,),
                FloatingActionButton.extended(onPressed: (){}, label: Column(
                  children: const [
                    Icon(Icons.personal_injury),
                    Text("Lost")
                  ],
                ), backgroundColor: Colors.red,),
                FloatingActionButton.extended(onPressed: (){}, label: Column(
                  children: const [
                    Icon(Icons.cancel_outlined),
                    Text("Cancel")
                  ],
                ), backgroundColor: Colors.red,),
              ],
            ),
          )
        ],
      ),
    );
  }
}