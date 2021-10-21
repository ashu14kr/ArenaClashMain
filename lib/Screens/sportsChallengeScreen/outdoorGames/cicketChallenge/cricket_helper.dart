import 'package:arenaclash/Constantcolors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CricketHelper with ChangeNotifier {
  Widget upperContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: const [
            Text("Cricket Challenge",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23)),
            Text("Let's Play Together",
                style: TextStyle(
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
            color: Colors.white),
      ),
    );
  }

  Future createChallenge(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: constantColors.darkColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                )),
            child: Column(
              children: [
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 150,
                  ),
                  child: Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Add Challenge",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                const SizedBox(height: 10),
                const Text("Select Match Type",
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("1.  OnePlayer vs OnePlayer",
                          style: TextStyle(color: Colors.white)),
                      IconButton(
                          onPressed: () {
                            oneOnOneChallenge(context);
                          },
                          icon: const Icon(EvaIcons.checkmarkCircle,
                              color: Colors.red))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("2.  Team vs Team",
                          style: TextStyle(color: Colors.white)),
                      IconButton(
                          onPressed: () {
                            teamVsTeamChallenges(context);
                          },
                          icon: const Icon(EvaIcons.checkmarkCircle,
                              color: Colors.red))
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Future oneOnOneChallenge(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: constantColors.darkColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  )),
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 150,
                    ),
                    child: Divider(
                      thickness: 2,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("OneVsOne Challenge",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(height: 10),
                  const Text("Fill All Details",
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Total Overs",
                          prefixIcon: Icon(Icons.sports_cricket,
                              color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          )),
                      cursorColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Coins",
                          prefixIcon: Icon(Icons.account_balance_wallet_outlined,
                              color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          )),
                      cursorColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
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
            ),
          );
        });
  }

  Future teamVsTeamChallenges(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: constantColors.darkColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  )),
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 150,
                    ),
                    child: Divider(
                      thickness: 2,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("TeamVsTeam Challenge",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  const SizedBox(height: 10),
                  const Text("Fill All Details",
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Total Overs",
                          prefixIcon: Icon(Icons.sports_cricket,
                              color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          )),
                      cursorColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Total Players",
                          prefixIcon: Icon(Icons.person,
                              color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          )),
                      cursorColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Coins",
                          prefixIcon: Icon(Icons.account_balance_wallet_outlined,
                              color: Colors.white),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                          )),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          )),
                      cursorColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
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
            ),
          );
        });
  }

  Future acceptConfirmation(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: size.height * 0.6,
            width: size.width,
            decoration: BoxDecoration(
                color: constantColors.darkColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Status', style: TextStyle(color: Colors.grey)),
                      Text('Live', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Match Type', style: TextStyle(color: Colors.grey)),
                      Text('OneVsOne', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Winning', style: TextStyle(color: Colors.grey)),
                      Text('100 coins', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Created By', style: TextStyle(color: Colors.grey)),
                      Text('Ashutosh kumar', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Contact Details', style: TextStyle(color: Colors.grey)),
                      Text('8789553987', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Contest Created', style: TextStyle(color: Colors.grey)),
                      Text('Oct 30,2021 9:15 PM', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                height: 45,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: const Center(child: Text("Confirm", style: TextStyle(color: Colors.white, fontSize: 16))),
              )
              ],
            ),
          );
        });
  }

  Future fullChallengeDetail(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: size.height * 0.45,
            width: size.width,
            decoration: BoxDecoration(
                color: constantColors.darkColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 2,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Status', style: TextStyle(color: Colors.grey)),
                      Text('Live', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Match Type', style: TextStyle(color: Colors.grey)),
                      Text('OneVsOne', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Winning', style: TextStyle(color: Colors.grey)),
                      Text('100 coins', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Created By', style: TextStyle(color: Colors.grey)),
                      Text('Ashutosh kumar', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Contact Details', style: TextStyle(color: Colors.grey)),
                      Text('8789553987', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Contest Created', style: TextStyle(color: Colors.grey)),
                      Text('Oct 30,2021 9:15 PM', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),                
              ],
            ),
          );
        });
  }
}
