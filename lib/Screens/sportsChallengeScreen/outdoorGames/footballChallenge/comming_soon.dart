import 'package:arenaclash/Constantcolors.dart';
import 'package:flutter/material.dart';

class CommingSoon extends StatefulWidget {
  const CommingSoon({ Key? key }) : super(key: key);

  @override
  _CommingSoonState createState() => _CommingSoonState();
}

class _CommingSoonState extends State<CommingSoon> {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.mainColor,
      body: const Center(child: Image(image: AssetImage("assets/images/empty.png"))),
    );
  }
}