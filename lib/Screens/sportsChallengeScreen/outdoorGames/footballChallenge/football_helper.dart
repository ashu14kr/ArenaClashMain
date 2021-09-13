import 'package:arenaclash/Constantcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootballHelper with ChangeNotifier {
  Widget upperContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: const [
            Text("Football Challenge", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23)),
            Text("Let's Play Together", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26)),
          ],
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(56)),
          color: Colors.white
        ),
      ),
    );
  }

  Future createChallenge(BuildContext context){
    ConstantColors constantColors = ConstantColors();
    return showModalBottomSheet(context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context){
      return Container(
        height: MediaQuery.of(context).size.height*0.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: constantColors.darkColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )
        ),
        child: Column(
          children: const [
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150,),
              child: Divider(
                thickness: 2,
                color: Colors.red,
              ),
            ),
            Text("Add Challenge", style: TextStyle(color: Colors.green, fontSize: 20))
          ],
        ),
      );
    });
  }
}
