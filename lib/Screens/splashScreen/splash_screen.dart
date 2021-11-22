import 'dart:async';
import 'package:arenaclash/Screens/drawer/home_drawer.dart';
import 'package:arenaclash/Screens/loginScreen/login_helper.dart';
import 'package:arenaclash/Services/userApi/get_user_data.dart';
import 'package:arenaclash/Services/walletApi/get_current_balance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    var userdata = Provider.of<GetUserData>(context, listen: false).getUserData();
    var userbalance = Provider.of<GetCurrentBalance>(context, listen: false).getCurrentBalance();
    userdata;
    userbalance;
    if (user != null) {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: const HomeAndDrawer(),
                type: PageTransitionType.leftToRight)));
    } else{
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: const LoginScreen(),
                type: PageTransitionType.leftToRight)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Container(
            height: size.height*0.05,
            width: size.width*0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/logo.png"),fit: BoxFit.cover)
            ),
          )),
    );
  }
}