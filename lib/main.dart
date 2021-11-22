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
import 'package:arenaclash/Services/cricketcontestApi/get_finished_contest.dart';
import 'package:arenaclash/Services/cricketcontestApi/get_live_contest.dart';
import 'package:arenaclash/Services/cricketcontestApi/get_ongoing_contest.dart';
import 'package:arenaclash/Services/cricketcontestApi/post_cricket_contest.dart';
import 'package:arenaclash/Services/cricketcontestApi/update_contest_info.dart';
import 'package:arenaclash/Services/footballcontestApi/get_finished_contest.dart';
import 'package:arenaclash/Services/footballcontestApi/get_live_contest.dart';
import 'package:arenaclash/Services/footballcontestApi/get_ongoing_contest.dart';
import 'package:arenaclash/Services/footballcontestApi/post_football_contest.dart';
import 'package:arenaclash/Services/footballcontestApi/update_contest_info.dart';
import 'package:arenaclash/Services/location/get_location.dart';
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
import 'package:arenaclash/Services/walletApi/post_withdrawl_data.dart';
import 'package:arenaclash/Services/walletApi/update_balance.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Screens/loginScreen/login_screen.dart';
import 'Screens/splashScreen/splash_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'Arena Clash',
        debugShowCheckedModeBanner: false,
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
          ChangeNotifierProvider(create: (_) => GetCurrentLocation()),
          ChangeNotifierProvider(create: (_) => PostWithdrawalData()),
          ChangeNotifierProvider(create: (_) => GetCricketFinishedContest()),
          ChangeNotifierProvider(create: (_) => GetCricketLiveContest()),
          ChangeNotifierProvider(create: (_) => GetCricketOngoingContest()),
          ChangeNotifierProvider(create: (_) => PostCricketContest()),
          ChangeNotifierProvider(create: (_) => UpadateCricketContestInfo()),
          ChangeNotifierProvider(create: (_) => GetFootballFinishedContest()),
          ChangeNotifierProvider(create: (_) => GetFootballLiveContest()),
          ChangeNotifierProvider(create: (_) => GetFootballOngoingContest()),
          ChangeNotifierProvider(create: (_) => PostFootballContest()),
          ChangeNotifierProvider(create: (_) => UpadateFootballContestInfo()),
        ],
    );
  }
}