import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/walletScreen/history_screen.dart';
import 'package:flutter/material.dart';

class HistoryDrawer extends StatefulWidget {
  const HistoryDrawer({Key? key}) : super(key: key);

  @override
  _HistoryDrawerState createState() => _HistoryDrawerState();
}

class _HistoryDrawerState extends State<HistoryDrawer> {
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return Scaffold(
      backgroundColor: constantColors.mainColor,
      appBar: AppBar(
        title: const Text("History"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: const HistoryScreen()
    );
  }
}
