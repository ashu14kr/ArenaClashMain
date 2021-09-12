import 'package:arenaclash/Screens/drawer/drawer_helper.dart';
import 'package:arenaclash/Screens/homeScreen/home_helper.dart';
import 'package:arenaclash/Screens/registrationScreen/registration_helper.dart';
import 'package:arenaclash/Screens/splashScreen/splash_screen.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/football_helper.dart';
import 'package:arenaclash/Screens/walletScreen/wallet_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/loginScreen/login_screen.dart';
import 'Screens/splashScreen/splash_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen()),
        providers: [
          ChangeNotifierProvider(create: (_) => SplashHelper()),
          ChangeNotifierProvider(create: (_) => LoginHelper()),
          ChangeNotifierProvider(create: (_) => RegistrationHelper()),
          ChangeNotifierProvider(create: (_) => HomeHelper()),
          ChangeNotifierProvider(create: (_) => DrawerHelper()),
          ChangeNotifierProvider(create: (_) => WalletHelper()),
          ChangeNotifierProvider(create: (_) => FootballHelper()),
        ],
    );
  }
}