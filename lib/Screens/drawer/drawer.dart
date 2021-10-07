import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/drawer/drawer_helper.dart';
import 'package:arenaclash/Screens/drawer/home_drawer.dart';
import 'package:arenaclash/Screens/helpScreen/help_screen.dart';
import 'package:arenaclash/Screens/notificationScreen/notification_screen.dart';
import 'package:arenaclash/Screens/walletScreen/history_drawer.dart';
import 'package:arenaclash/Screens/walletScreen/wallet_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  ConstantColors constantColors = ConstantColors();

  int selectedMenuIndex = 0;

  List<String> menuItem = [
    "My account",
    "Notifications",
    "History",
    "My Wallet",
    "Security & Privacy",
    "Help",
  ];

  List<IconData> icons = [
    EvaIcons.person,
    EvaIcons.bellOutline,
    EvaIcons.clockOutline,
    Icons.account_balance_wallet,
    EvaIcons.lockOutline,
    EvaIcons.hashOutline,
  ];

  final pages = [
    const HomeAndDrawer(),
    const NotificationScreen(),
    const HistoryDrawer(),
    const WalletScreen(),
    const Drawer(),
    const HelpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
            0.5,
            0.9
          ],
              colors: [
            constantColors.darkColor,
            constantColors.blueGreyColor
          ])),
      child: Column(
        children: [
          Provider.of<DrawerHelper>(context, listen: false)
              .profileDetail(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          actionMenu(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Provider.of<DrawerHelper>(context, listen: false)
              .logoutAction(context)
        ],
      ),
    ));
  }

  Widget actionMenu(
    BuildContext context,
  ) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedMenuIndex = index;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => pages[index]));
                });
              },
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Icon(icons[index],
                          color: selectedMenuIndex == index
                              ? Colors.white
                              : Colors.grey),
                      const SizedBox(width: 15),
                      Text(menuItem[index],
                          style: TextStyle(
                              fontSize: 16,
                              color: selectedMenuIndex == index
                                  ? Colors.white
                                  : Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(height: 15)
              ]),
            );
          }),
    );
  }
}
