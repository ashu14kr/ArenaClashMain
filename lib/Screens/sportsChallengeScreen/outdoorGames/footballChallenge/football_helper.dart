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
          children:  [
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 150,),
              child: Divider(
                thickness: 2,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 5,),
            const Text("Add Challenge", style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Enter Random ID",
                        prefixIcon: Icon(Icons.games_rounded, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                        ),
                        hintStyle: TextStyle(
                            color: Colors.grey,)),
                    cursorColor: Colors.white,
                  ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Coins",
                        prefixIcon: Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                        ),
                        hintStyle: TextStyle(
                            color: Colors.grey,)),
                    cursorColor: Colors.white,
                  ),
            ),
            const SizedBox(height: 35,),
            Container(
              height: 45,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(25)
              ),
              child: const Center(child: Text("Create Challenge", style: TextStyle(color: Colors.white, fontSize: 16))),
            )
          ],
        ),
      );
    });
  }
}
