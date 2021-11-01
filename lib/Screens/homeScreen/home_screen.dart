import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/homeScreen/online_games.dart';
import 'package:arenaclash/Screens/homeScreen/outdoorsports.dart';
import 'package:arenaclash/Services/userApi/get_user_data.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConstantColors constantColors = ConstantColors();
  double xoffset = 0;
  double yoffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xoffset, yoffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      child: Material(
        elevation: 12,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                leading: isDrawerOpen
                    ? IconButton(
                        icon: const Icon(EvaIcons.arrowIosBack),
                        onPressed: () {
                          setState(() {
                            xoffset = 0;
                            yoffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        },
                      )
                    : IconButton(
                        icon: const Icon(EvaIcons.menu2Outline),
                        onPressed: () {
                          setState(() {
                            xoffset = 230;
                            yoffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        }),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
              backgroundColor: constantColors.mainColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                        child: Provider.of<HomeHelper>(context, listen: false)
                            .header(context)),
                    const SizedBox(height: 15),
                    const TabBar(
                        indicatorColor: Colors.red,
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 80),
                        indicatorWeight: 2.0,
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: "Outdoor Games"),
                          Tab(text: "Online Games"),
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        color: Colors.transparent,
                        child: const TabBarView(children: [
                          OutdoorSports(),
                          OnlineGames(),
                        ]),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
