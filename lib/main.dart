import 'package:arenaclash/Screens/drawer/drawer_helper.dart';
import 'package:arenaclash/Screens/homeScreen/home_helper.dart';
import 'package:arenaclash/Screens/registrationScreen/registration_helper.dart';
import 'package:arenaclash/Screens/splashScreen/splash_screen.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/onlineGames/freefireChallenge/freefire_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/badmintonChallenge/badminton_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/football_helper.dart';
import 'package:arenaclash/Screens/walletScreen/wallet_helper.dart';
import 'package:arenaclash/Services/add_user_login.dart';
import 'package:arenaclash/Services/phone_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/loginScreen/login_screen.dart';
import 'Screens/splashScreen/splash_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          ChangeNotifierProvider(create: (_) => BadmintonHelper()),
          ChangeNotifierProvider(create: (_) => FreefireHelper()),
          ChangeNotifierProvider(create: (_) => PhoneAuth()),
          ChangeNotifierProvider(create: (_) => AddUserData()),
        ],
    );
  }
}