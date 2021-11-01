import 'package:arenaclash/Screens/drawer/home_drawer.dart';
import 'package:arenaclash/Screens/loginScreen/login_helper.dart';
import 'package:arenaclash/Screens/loginScreen/login_screen.dart';
import 'package:arenaclash/Screens/registrationScreen/registration_helper.dart';
import 'package:arenaclash/Services/userApi/add_user_login.dart';
import 'package:arenaclash/Services/walletApi/post_initial_balance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class EmailAndPass with ChangeNotifier {
  bool emailnotvalid = false;
  bool passnotvalid = false;
  bool founduser = false;
  bool user = false;
  bool alreadynotemail = false;
  bool resemailnotvalid = false;

  emailAuth(BuildContext context) async {
    var resdata = Provider.of<RegistrationHelper>(context, listen: false);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: Provider.of<RegistrationHelper>(context, listen: false)
                  .userEmail
                  .text,
              password: Provider.of<RegistrationHelper>(context, listen: false)
                  .userPassword
                  .text)
          .whenComplete(() => {
                Provider.of<AddUserData>(context, listen: false)
                    .postUserData(context),
                Provider.of<PostInitialBalance>(context, listen: false)
                    .postRegistrationBalance(context),
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        const snackBar =
            SnackBar(content: Text("the email address is not valid"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        resemailnotvalid = true;
      } else if (e.code == 'email-already-in-use') {
        const snackBar = SnackBar(
            content: Text(
                "there already exists an account with the given email address"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        alreadynotemail = true;
      }
    }
    if (emailnotvalid == false && alreadynotemail == false) {
      Fluttertoast.showToast(
                          msg: "Loading....",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          textColor: Colors.white,
                          fontSize: 16.0);
      Navigator.pushReplacement(
              context,
              PageTransition(
                  child: const LoginScreen(),
                  type: PageTransitionType.leftToRight))
          .whenComplete(() => {
                resdata.userName.clear(),
                resdata.userEmail.clear(),
                resdata.userNumber.clear(),
                resdata.userPassword.clear()
              });
    }
    notifyListeners();
  }

  emailLogin(BuildContext context) async {
    var logindata = Provider.of<LoginHelper>(context, listen: false);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:
              Provider.of<LoginHelper>(context, listen: false).useremail.text,
          password:
              Provider.of<LoginHelper>(context, listen: false).userpass.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        const snackBar =
            SnackBar(content: Text("the email address is not valid"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        emailnotvalid = true;
      } else if (e.code == 'user-disabled') {
        const snackBar = SnackBar(
            content: Text(
                "the user corresponding to the given email has been disabled."));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        passnotvalid = true;
      } else if (e.code == 'user-not-found') {
        const snackBar = SnackBar(
            content: Text("there is no user corresponding to the given email"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        founduser = true;
      } else if (e.code == 'wrong-password') {
        const snackBar = SnackBar(
            content: Text(
                "the password is invalid for the given email, or the account corresponding to the email does not have a password set."));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        user = true;
      }
    }
    if (emailnotvalid == false &&
        passnotvalid == false &&
        founduser == false &&
        user == false) {
      Fluttertoast.showToast(
                          msg: "Loading....",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          textColor: Colors.white,
                          fontSize: 16.0);
      Navigator.pushReplacement(
              context,
              PageTransition(
                  child: const HomeAndDrawer(),
                  type: PageTransitionType.leftToRight))
          .whenComplete(() => {
                logindata.useremail.clear(),
                logindata.userpass.clear(),
              });
    }
    notifyListeners();
  }

  emailLogout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().whenComplete(() => {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  child: const LoginScreen(),
                  type: PageTransitionType.leftToRight))
        });
  }
}
