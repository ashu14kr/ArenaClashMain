import 'package:arenaclash/Screens/drawer/drawer_helper.dart';
import 'package:arenaclash/Screens/helpScreen/help_helper.dart';
import 'package:arenaclash/Screens/homeScreen/home_helper.dart';
import 'package:arenaclash/Screens/registrationScreen/registration_helper.dart';
import 'package:arenaclash/Screens/splashScreen/splash_screen.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/onlineGames/freefireChallenge/freefire_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/badmintonChallenge/badminton_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/cicketChallenge/cricket_helper.dart';
import 'package:arenaclash/Screens/sportsChallengeScreen/outdoorGames/footballChallenge/football_helper.dart';
import 'package:arenaclash/Screens/walletScreen/wallet_helper.dart';
import 'package:arenaclash/Services/tournamentApi/get_finished_contest.dart';
import 'package:arenaclash/Services/tournamentApi/get_live_contest.dart';
import 'package:arenaclash/Services/tournamentApi/get_ongoing_contest.dart';
import 'package:arenaclash/Services/tournamentApi/post_badminton_contest.dart';
import 'package:arenaclash/Services/tournamentApi/update_contest_info.dart';
import 'package:arenaclash/Services/userApi/add_user_login.dart';
import 'package:arenaclash/Services/Auth/emailandpass_auth.dart';
import 'package:arenaclash/Services/Auth/phone_auth.dart';
import 'package:arenaclash/Services/userApi/get_user_data.dart';
import 'package:arenaclash/Services/walletApi/get_current_balance.dart';
import 'package:arenaclash/Services/walletApi/get_wallethistory.dart';
import 'package:arenaclash/Services/walletApi/post_initial_balance.dart';
import 'package:arenaclash/Services/walletApi/update_balance.dart';
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
          ChangeNotifierProvider(create: (_) => HelpHelper()),
          ChangeNotifierProvider(create: (_) => EmailAndPass()),
          ChangeNotifierProvider(create: (_) => CricketHelper()),
          ChangeNotifierProvider(create: (_) => PostInitialBalance()),
          ChangeNotifierProvider(create: (_) => GetCurrenUserWalletHistory()),
          ChangeNotifierProvider(create: (_) => GetCurrentBalance()),
          ChangeNotifierProvider(create: (_) => GetUserData()),
          ChangeNotifierProvider(create: (_) => PostBadmintonContest()),
          ChangeNotifierProvider(create: (_) => UpdateBalance()),
          ChangeNotifierProvider(create: (_) => GetLiveContest()),
          ChangeNotifierProvider(create: (_) => UpadateContestInfo()),
          ChangeNotifierProvider(create: (_) => GetBadmintonOngoingContest()),
          ChangeNotifierProvider(create: (_) => GetFinishedContest()),
        ],
    );
  }
}