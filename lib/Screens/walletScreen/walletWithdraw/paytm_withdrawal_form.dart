import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/walletScreen/wallet_screen.dart';
import 'package:arenaclash/Services/userApi/get_user_data.dart';
import 'package:arenaclash/Services/walletApi/get_current_balance.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class WithdrawalForm extends StatefulWidget {
  const WithdrawalForm({Key? key}) : super(key: key);

  @override
  _WithdrawalFormState createState() => _WithdrawalFormState();
}

class _WithdrawalFormState extends State<WithdrawalForm> {
  ConstantColors constantColors = ConstantColors();
  TextEditingController withAmount = TextEditingController();
  TextEditingController withUserNumber = TextEditingController();
  bool paytmNumber = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: constantColors.mainColor,
      appBar: AppBar(
        title: const Text("New Withdrawal"),
        backgroundColor: constantColors.mainColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: size.height * 0.35,
              width: size.width,
              color: Colors.black.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    const Text("Withdrawal details",
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    const SizedBox(height: 10),
                    Container(
                      height: size.height * 0.04,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: constantColors.mainColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Center(
                          child: Text(
                        "Minimum withdrawal amount: 100",
                        style: TextStyle(color: Colors.grey),
                      )),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height * 0.06,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: constantColors.mainColor,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Currency",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text("INR",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.06,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: constantColors.mainColor,
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              controller: withAmount,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Withdrawal amount",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12)),
                              cursorColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height * 0.06,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: constantColors.mainColor,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Paytm",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text("Number",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.06,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: constantColors.mainColor,
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              controller: withUserNumber,
                              style: const TextStyle(color: Colors.white),
                              maxLength: 10,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Paytm Number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12)),
                              cursorColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Withdrawal confirmation",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Withdrawal amount:",
                          style: TextStyle(color: Colors.grey)),
                      Text(withAmount.text.toString(),
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("Withdrawal method:",
                          style: TextStyle(color: Colors.grey)),
                      Text("Paytm", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            FloatingActionButton.extended(
              onPressed: () {
                var currentAmount =
                    Provider.of<GetCurrentBalance>(context, listen: false)
                        .amount;
                num amount = num.parse(withAmount.text);
                withUserNumber.text.isNotEmpty ? paytmNumber = true : paytmNumber = false;
                if (paytmNumber == true) {
                  if (amount >= 100) {
                  if (currentAmount >= amount) {
                  currentAmount;
                  updateCurrentBalance(context)
                      .whenComplete(() => {
                            postWithdrawalData(context),
                            postTransactionHistory(context),
                          })
                      .whenComplete(() => {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const WalletScreen(),
                                    type: PageTransitionType.leftToRight))
                          });
                } else {
                  Fluttertoast.showToast(
                          msg: "Balance is insufficient....",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          textColor: Colors.white,
                          fontSize: 16.0)
                      .whenComplete(() => {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const WalletScreen(),
                                    type: PageTransitionType.leftToRight))
                          });
                }
                }else{
                  Fluttertoast.showToast(
                          msg: "Minimum withdrawal amount: 100",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          textColor: Colors.white,
                          fontSize: 16.0);
                }
                }else{
                  Fluttertoast.showToast(
                          msg: "Add paytm Number",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          textColor: Colors.white,
                          fontSize: 16.0);
                }
              },
              label: const Text("CONFIRM"),
              backgroundColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }

  Future postTransactionHistory(BuildContext context) async {
    Response responsehttp;
    var userData = Provider.of<GetUserData>(context, listen: false);
    DateTime now = DateTime.now();
    String time = now.month.toString()+ "."+now.day.toString()+","+  now.year.toString() + " "+ now.hour.toString() + ":" + now.minute.toString();
    var dio = Dio();
    try {
      responsehttp = await dio.post(
          "http://34.93.18.143/user/payment/wallethistory/id/lpjkhy",
          data: {
            "user": FirebaseAuth.instance.currentUser!.uid.toString(),
            "status": "pending",
            "requestId": "",
            "senderName":userData.name,
            "paymentCreated": time.toString(),
            "processedOn": "",
            "amount": withAmount.text
          });
      print(responsehttp.data);
      print(responsehttp.statusCode);
    } catch (e) {
      print(e);
    }
  }

  Future updateCurrentBalance(BuildContext context) async {
    var currentAmount =
        Provider.of<GetCurrentBalance>(context, listen: false).amount;
    num updatedBalance = currentAmount - num.parse(withAmount.text);
    Response response;
    var dio = Dio();
    var currentuid = FirebaseAuth.instance.currentUser!.uid.toString();
    try {
      response = await dio.patch(
          "http://34.93.18.143/walletBalance/user/updated/$currentuid",
          data: {"amount": updatedBalance});
    } catch (e) {
      print(e);
    }
  }

  Future postWithdrawalData(BuildContext context) async {
    Response response;
    var dio = Dio();
    var userData = Provider.of<GetUserData>(context, listen: false);
    DateTime now = DateTime.now();
    String time = now.month.toString()+ "."+now.day.toString()+","+  now.year.toString() + " "+ now.hour.toString() + ":" + now.minute.toString();
    try {
      response = await dio.post(
          "http://34.93.18.143/user/created/withdrawal/cmp/data/lljjshhgyugsv",
          data: {
            "status": "pending",
            "userUid": FirebaseAuth.instance.currentUser!.uid.toString(),
            "amount": withAmount.text,
            "createddate": time.toString(),
            "requestedId": "",
            "paymentMethod": "paytm",
            "completedDate": "",
            "transactiontype": "Withdrawl"
          });
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
