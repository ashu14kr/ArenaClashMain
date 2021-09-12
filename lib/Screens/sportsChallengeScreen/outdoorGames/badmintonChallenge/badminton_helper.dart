import 'package:flutter/material.dart';

class BadmintonHelper with ChangeNotifier{

  Widget upperContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: const [
            Text("Badminton Challenge", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23)),
            Text("Let's Play Together", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26)),
          ],
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(56)),
          color: Colors.white
        ),
      ),
    );
  }

}