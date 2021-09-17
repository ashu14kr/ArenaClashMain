import 'package:arenaclash/Screens/walletScreen/wallet_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionsScreen extends StatefulWidget {
  const ActionsScreen({ Key? key }) : super(key: key);

  @override
  _ActionsScreenState createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            height: MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Row(
              children: [
                Provider.of<WalletHelper>(context, listen: false).actions(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}