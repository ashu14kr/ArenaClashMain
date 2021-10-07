import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/walletScreen/about_screen.dart';
import 'package:arenaclash/Screens/walletScreen/actions_screen.dart';
import 'package:arenaclash/Screens/walletScreen/history_screen.dart';
import 'package:arenaclash/Screens/walletScreen/wallet_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: constantColors.mainColor,
        appBar: AppBar(
            title: const Text("Wallet",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0),
        body: Column(
          children: [
            Provider.of<WalletHelper>(context, listen: false).header(context),
            const TabBar(
              indicatorColor: Colors.red,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 40),
              indicatorWeight: 2.0,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              tabs: [
              Tab(text: "ACTIONS"),
              Tab(text: "HISTORY"),
              Tab(text: "ABOUT")
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.72,
              width: MediaQuery.of(context).size.width,
              child: const TabBarView(children: [
                ActionsScreen(),
                HistoryScreen(),
                AboutScreen(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
