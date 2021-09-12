import 'package:flutter/material.dart';

class WalletHelper with ChangeNotifier{

  Widget header(BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: const [
          SizedBox(height: 10),
          Text("Balance", style: TextStyle(color: Colors.grey)),
          SizedBox(height: 5),
          Text("₹0.00", style: TextStyle(color: Colors.white, fontSize: 32))
        ],
      ),
    );
  }

  Widget actions(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
    );
  }

}