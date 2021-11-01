import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostWithdrawalData with ChangeNotifier{

  // Future postRegistrationBalance(BuildContext context)async{
  //   Response response;
  //   var dio = Dio();
  //   DateTime now = DateTime.now();
  //   try {
  //     response = await dio.post("http://34.93.18.143//user/created/withdrawal/cmp/data/lljjshhgyugsv", data: {
  //       "status": "pending",
  //       "userUid": FirebaseAuth.instance.currentUser!.uid.toString(),
  //       "amount": ,
  //       "createddate": now,
  //       "requestedId": "",
  //       "paymentMethod": "paytm",
  //       "completedDate": "",
  //       "transactiontype": "Withdrawl"
  //     });
  //     print(response.data);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}