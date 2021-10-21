import 'package:arenaclash/Screens/drawer/home_drawer.dart';
import 'package:arenaclash/Screens/registrationScreen/registration_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PhoneAuth with ChangeNotifier {
  bool codesend = false;
  late String verId;

  verifyPhone(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" +
            Provider.of<RegistrationHelper>(context, listen: false)
                .userNumber
                .text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          const snackBar = SnackBar(content: Text("login sucess"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        verificationFailed: (FirebaseAuthException e) {
          final snackBar = SnackBar(content: Text("${e.message}"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        codeSent: (String verificationId, int? resendToken) {
          codesend = true;
          verId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verId = verificationId;
        },
        timeout: const Duration(seconds: 60));
  }

  verifyPin(String pin, BuildContext context) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: pin);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      const snackBar = SnackBar(content: Text("login sucess"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: const HomeAndDrawer(),
              type: PageTransitionType.leftToRight));
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text("${e.message}"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
