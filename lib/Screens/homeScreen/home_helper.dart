import 'package:flutter/material.dart';

class HomeHelper with ChangeNotifier {
  Widget header(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png")))),
        const Text("Choose your",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28)),
        const Text("awesome games",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28)),
      ],
    );
  }
}
