import 'package:arenaclash/Screens/loginScreen/login_helper.dart';
import 'package:arenaclash/Services/Auth/emailandpass_auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class RegistrationHelper with ChangeNotifier {
  TextEditingController userNumber = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();  
  bool namevalidate = false;
  bool emailvalidate = false;
  bool phonevalidate = false;
  bool passvalidate = false;
  bool nameerror = false;
  bool emailerror = false;
  bool phoneerror = false;
  bool passerror = false;
  Widget header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.black45,
                border: Border.all(width: 1, color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: const LoginScreen(),
                            type: PageTransitionType.rightToLeft));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                  )),
            ),
          ),
          const SizedBox(width: 15),
          const Text("Sign up",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget registrationOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sign up with one of the following options.",
              style: TextStyle(color: Colors.grey.shade800)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1.0, color: Colors.grey.shade800),
                    color: Colors.black45),
                child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          EvaIcons.google,
                          color: Colors.white,
                        ))),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1.0, color: Colors.grey.shade800),
                    color: Colors.black45),
                child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          EvaIcons.facebook,
                          color: Colors.white,
                        ))),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget registrationInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              const SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade800,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black45,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: userName,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: namevalidate
                            ? const Icon(Icons.error, color: Colors.red)
                            : null,
                        hintText: "Enter your name",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade800, fontSize: 12)),
                    cursorColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              const SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade800,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black45,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: userEmail,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: emailvalidate
                            ? const Icon(Icons.error, color: Colors.red)
                            : null,
                        hintText: "example@gmail.com",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade800, fontSize: 12)),
                    cursorColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Phone no',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              const SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade800,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black45,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: userNumber,
                    style: const TextStyle(color: Colors.white),
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: phonevalidate
                            ? const Icon(Icons.error, color: Colors.red)
                            : null,
                        hintText: "eg. 6666666666",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade800, fontSize: 12)),
                    cursorColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Password',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              const SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade800,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black45,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: userPassword,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: passvalidate
                            ? const Icon(Icons.error, color: Colors.red)
                            : null,
                        hintText: "Pick a strong password",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade800, fontSize: 12)),
                    cursorColor: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget registrationAction(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {            
                userName.text.isEmpty ? namevalidate = true : false;
                userEmail.text.isEmpty ? emailvalidate = true : false;
                userNumber.text.isEmpty ? phonevalidate = true : false;
                userPassword.text.isEmpty ? passvalidate = true : false;
                userName.text.isNotEmpty ? nameerror = true : false;
                userEmail.text.isNotEmpty ? emailerror = true : false;
                userNumber.text.isNotEmpty ? phoneerror = true : false;
                userPassword.text.isNotEmpty ? passerror = true : false;
                if (nameerror == true && emailerror == true && phoneerror == true && passerror == true) {
                  Provider.of<EmailAndPass>(context, listen: false).emailAuth(context);
                }else{
                  const snackBar =
                    SnackBar(content: Text("Error plz fill form properly"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Text("Already have an account?  ",
                      style: TextStyle(color: Colors.grey.shade700)),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const LoginScreen(),
                                type: PageTransitionType.rightToLeft));
                      },
                      child: const Text("Log in",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
