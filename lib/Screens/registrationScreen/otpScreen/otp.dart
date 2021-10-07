import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/registrationScreen/registration_helper.dart';
import 'package:arenaclash/Services/phone_auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return Scaffold(
      backgroundColor: constantColors.mainColor,
      appBar: AppBar(
        title:
            const Text("Verify Phone", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(EvaIcons.arrowBackOutline)),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text("Code is send to ",
                      style: TextStyle(
                          color: Colors.grey.shade500, fontSize: 18))),
              Center(
                  child: Text(
                      Provider.of<RegistrationHelper>(context, listen: false)
                          .userNumber
                          .text,
                      style: TextStyle(
                          color: Colors.grey.shade500, fontSize: 18))),
            ],
          ),
          const SizedBox(height: 60),
          OtpTextField(
            numberOfFields: 6,
            showFieldAsBox: true,
            borderColor: Colors.grey.shade900,
            fillColor: Colors.grey,
            focusedBorderColor: Colors.grey,
            textStyle: const TextStyle(color: Colors.white),
            onCodeChanged: (String code) {
            },
            onSubmit: (pin){
              Provider.of<PhoneAuth>(context, listen: false).verifyPin(pin, context);
            },
          )
        ],
      ),
    );
  }
}
