import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/cicketChallenge/cricket_screen.dart';
import 'package:arenaclash/Screens/walletScreen/wallet_screen.dart';
import 'package:arenaclash/Services/cricketcontestApi/post_cricket_contest.dart';
import 'package:arenaclash/Services/location/get_location.dart';
import 'package:arenaclash/Services/userApi/get_user_data.dart';
import 'package:arenaclash/Services/walletApi/get_current_balance.dart';
import 'package:arenaclash/Services/walletApi/update_balance.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CricketHelper with ChangeNotifier {
  TextEditingController totalOvers = TextEditingController();
  TextEditingController totalPlayers = TextEditingController();
  TextEditingController totalCoins = TextEditingController();
  bool overs = false;
  bool players = false;
  bool coins = false;
  var betcoin;
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
                      const Text("1.  Team vs Team",
                          style: TextStyle(color: Colors.white)),
                      IconButton(
                          onPressed: () {
                            teamVsTeamChallenges(context);
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
                      const Text("2.  OnePlayer vs OnePlayer",
                          style: TextStyle(color: Colors.white)),
                      IconButton(
                          onPressed: () {
                            alertBox(context);
                            // oneOnOneChallenge(context);
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
    var currentBalance = Provider.of<GetCurrentBalance>(context, listen: false);
    var updateBalance = Provider.of<UpdateBalance>(context, listen: false);
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: totalOvers,
                      decoration: const InputDecoration(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: totalPlayers,
                      decoration: const InputDecoration(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: totalCoins,
                      decoration: const InputDecoration(
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
                  InkWell(
                    onTap: (){
                      totalOvers.text.isNotEmpty ? overs = true : overs = false;
                      totalPlayers.text.isNotEmpty ? players = true : players = false;
                      totalCoins.text.isNotEmpty ? coins = true : coins =false;
                      Provider.of<GetCurrentLocation>(context, listen: false).getUserLocation(context);
                      Provider.of<GetCurrentBalance>(context, listen: false)
                          .getCurrentBalance();
                      Provider.of<GetUserData>(context, listen: false)
                          .getUserData()
                          .whenComplete(() => {
                            betcoin = num.parse(totalCoins.text),
                                if (overs == true && players == true && coins == true) {
                                  if (currentBalance.amount >= betcoin){
                                    Provider.of<PostCricketContest>(context,
                                            listen: false)
                                        .postdualteamtournament(context),
                                    Provider.of<UpdateBalance>(context,
                                            listen: false)
                                        .cricketUpdateCurrentBalance(context),
                                    Fluttertoast.showToast(
                                        msg: "Contest created succesfully...",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 3,
                                        textColor: Colors.white,
                                        fontSize: 16.0),
                                    Navigator.pushReplacement(
                                            context,
                                            PageTransition(
                                                child: const CricketScreen(),
                                                type: PageTransitionType
                                                    .leftToRight))
                                        .whenComplete(() => {
                                              totalCoins.clear(),
                                              totalOvers.clear(),
                                              totalPlayers.clear(),
                                            })
                                  }
                                else
                                  {
                                    print("balance is less"),
                                    Fluttertoast.showToast(
                                        msg:
                                            "Balance is insufficient add it to play....",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 3,
                                        textColor: Colors.white,
                                        fontSize: 16.0),
                                    Navigator.pushReplacement(
                                            context,
                                            PageTransition(
                                                child: const WalletScreen(),
                                                type: PageTransitionType
                                                    .leftToRight))
                                        .whenComplete(() => {
                                              totalCoins.clear(),
                                              totalOvers.clear(),
                                              totalPlayers.clear(),
                                            })
                                  }
                                }else{
                                  Fluttertoast.showToast(
                                        msg:
                                            "Fill all columns",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 3,
                                        textColor: Colors.white,
                                        fontSize: 16.0)
                                }
                          });
                    },
                    child: Container(
                                  height: 45,
                                  width: 200,
                                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: const Center(child: Text("Create Challenge", style: TextStyle(color: Colors.white, fontSize: 16))),
                                ),
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

  Future alertBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return  const AlertDialog(
            title: Text("Cricket Challenge"),
            content: Text("Single Player Cricket challenge is not available yet."),
          );
        });
  }
}
