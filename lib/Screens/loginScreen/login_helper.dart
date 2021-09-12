import 'package:arenaclash/Screens/loginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Provider.of<LoginHelper>(context, listen: false).header(context),
            const SizedBox(height: 60),
            Provider.of<LoginHelper>(context, listen: false).loginOptions(context),
            const SizedBox(height: 80),
            Provider.of<LoginHelper>(context, listen: false).loginInfo(context),
            const SizedBox(height: 50),
            Provider.of<LoginHelper>(context, listen: false).loginAction(context),
          ],
        ),
      ),
    );
  }
}