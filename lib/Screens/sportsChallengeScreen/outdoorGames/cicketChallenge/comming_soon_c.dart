import 'package:arenaclash/Constantcolors.dart';
import 'package:flutter/material.dart';

class CommingSoonCricket extends StatefulWidget {
  const CommingSoonCricket({ Key? key }) : super(key: key);

  @override
  _CommingSoonCricketState createState() => _CommingSoonCricketState();
}

class _CommingSoonCricketState extends State<CommingSoonCricket> {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.mainColor,
      body: const Center(child: Image(image: AssetImage("assets/images/empty.png"))),
    );
  }
}