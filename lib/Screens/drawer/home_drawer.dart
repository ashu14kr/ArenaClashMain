import 'package:arenaclash/Screens/drawer/drawer.dart';
import 'package:arenaclash/Screens/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';

class HomeAndDrawer extends StatefulWidget {
  const HomeAndDrawer({ Key? key }) : super(key: key);

  @override
  _HomeAndDrawerState createState() => _HomeAndDrawerState();
}

class _HomeAndDrawerState extends State<HomeAndDrawer> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
          children:const [
            DrawerScreen(),
            HomeScreen()
          ],
      ),
    );
  }
}