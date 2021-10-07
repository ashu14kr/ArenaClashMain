import 'package:arenaclash/Constantcolors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({ Key? key }) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  Future? _launched;
  final String _url = 'https://wa.me/qr/U3QTDEGMSNQSL1';

  Future _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return Scaffold(
      backgroundColor: constantColors.mainColor,
      appBar: AppBar(
        title: const Text("Contact us"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text("Got a question", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.whatshot_sharp, color: Colors.yellow),
                const SizedBox(width: 20),
                InkWell(
                  onTap: (){
                    launch(_url);
                  },
                  child: const Text("Connect via whatsappp", style: TextStyle(color: Colors.white))),
              ],
            )
          ],
        ),
      ),
    );
  }
}