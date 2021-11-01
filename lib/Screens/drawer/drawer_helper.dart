import 'package:arenaclash/Screens/settingScreen/setting_screen.dart';
import 'package:arenaclash/Services/Auth/emailandpass_auth.dart';
import 'package:arenaclash/Services/userApi/get_user_data.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DrawerHelper with ChangeNotifier {
  Widget profileDetail(BuildContext context) {
    var userdata = Provider.of<GetUserData>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 40),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.orange,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             userdata.name == null ? const Text("Loading.....",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)) : Text(userdata.name.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              Text(userdata.email.toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 12))
            ],
          )
        ],
      ),
    );
  }

  Widget logoutAction(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          const Icon(EvaIcons.settings, color: Colors.grey),
          const SizedBox(width: 15),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const SettingScreen(),
                        type: PageTransitionType.leftToRight));
              },
              child: const Text("Setting",
                  style: TextStyle(fontSize: 16, color: Colors.grey))),
          const SizedBox(width: 5),
          const Text("|", style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(width: 5),
          InkWell(
              onTap: () {
                Provider.of<EmailAndPass>(context, listen: false)
                    .emailLogout(context);
              },
              child: const Text("LogOut",
                  style: TextStyle(fontSize: 16, color: Colors.grey))),
        ],
      ),
    );
  }
}
