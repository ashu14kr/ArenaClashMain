import 'package:arenaclash/Screens/registrationScreen/registration_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddUserData with ChangeNotifier {
  Future postUserData(BuildContext context) async {
    var url = Uri.parse('https://thawing-lake-36012.herokuapp.com/users');
    var response = await http.post(url, body: {
      "_id": FirebaseAuth.instance.currentUser!.uid.toString(),
      "name": Provider.of<RegistrationHelper>(context, listen: false).userName.text.toString(),
      "email": Provider.of<RegistrationHelper>(context, listen: false).userEmail.text.toString(),
      "phoneno":Provider.of<RegistrationHelper>(context, listen: false).userNumber.text.toString(),
      "password":Provider.of<RegistrationHelper>(context, listen: false).userPassword.text.toString()
    });
    print("kinatic" + response.body);
  }
}
