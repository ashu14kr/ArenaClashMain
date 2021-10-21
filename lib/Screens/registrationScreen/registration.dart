import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/registrationScreen/otpScreen/otp.dart';
import 'package:arenaclash/Screens/registrationScreen/registration_helper.dart';
import 'package:arenaclash/Services/Auth/phone_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({ Key? key }) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return Scaffold(
      backgroundColor: constantColors.mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Provider.of<PhoneAuth>(context, listen: false).codesend ? const OtpScreen():
            const SizedBox(height: 60),
            Provider.of<RegistrationHelper>(context, listen: false).header(context),
            const SizedBox(height: 80),
            Provider.of<RegistrationHelper>(context, listen: false).registrationInfo(context),
            const SizedBox(height: 50),
            Provider.of<RegistrationHelper>(context, listen: false).registrationAction(context),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}