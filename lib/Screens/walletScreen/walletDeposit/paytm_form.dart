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
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaytmForm extends StatefulWidget {
  const PaytmForm({Key? key}) : super(key: key);

  @override
  _PaytmFormState createState() => _PaytmFormState();
}

class _PaytmFormState extends State<PaytmForm> {
  ConstantColors constantColors = ConstantColors();
  TextEditingController amount = TextEditingController();
  late Razorpay _razorpay;
  var paymentid;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout() async {
    var userdata = Provider.of<GetUserData>(context, listen: false);
    int amounttopay = int.parse(amount.text) * 100;
    var options = {
      'key': 'rzp_live_c3FoRoxuKhNdXk',
      'amount': amounttopay,
      'name': 'Arena clash',
      'description': 'wallet refil',
      'prefill': {'contact': '${userdata.phone}', 'email': '${userdata.email}'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("error $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(
        "Payment success ${response.orderId}, ${response.paymentId}, ${response.signature}");
    paymentid = response.paymentId;
    postTransactionHistory(context);
    updateCurrentBalance(context);

    Navigator.pushReplacement(
        context,
        PageTransition(
            child: const WalletScreen(), type: PageTransitionType.leftToRight));
    final snackBar = SnackBar(
        content: Text(
            "Payment success ${response.orderId}, ${response.paymentId}, ${response.signature}"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _handlePaymentError(PaymentFailureResponse response) {}

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: constantColors.mainColor,
      appBar: AppBar(
        title: const Text("New Deposit"),
        backgroundColor: constantColors.mainColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: size.height * 0.27,
              width: size.width,
              color: Colors.black.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    const Text("Deposit details",
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
                        "Minimum deposit amount: 10",
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
                              controller: amount,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Deposit amount",
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
                  const Text("Deposit confirmation",
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
                      const Text("Deposit amount:",
                          style: TextStyle(color: Colors.grey)),
                      Text(amount.text,
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
                      Text("Payment method:",
                          style: TextStyle(color: Colors.grey)),
                      Text("All", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 120),
            FloatingActionButton.extended(
              onPressed: () {
                var depositAmount = num.parse(amount.text);
                if (depositAmount >= 10) {
                  openCheckout();
                } else {
                  Fluttertoast.showToast(
                      msg: "Minimum Deposit amount: 10",
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
    var dio = Dio();
    var userData = Provider.of<GetUserData>(context, listen: false);
    DateTime now = DateTime.now();
    String time = now.month.toString()+ "."+now.day.toString()+","+  now.year.toString() + " "+ now.hour.toString() + ":" + now.minute.toString();
    try {
      responsehttp = await dio.post(
          "http://34.93.18.143/user/payment/wallethistory/id/lpjkhy",
          data: {
            "user": FirebaseAuth.instance.currentUser!.uid.toString(),
            "status": "completed",
            "requestId": paymentid,
            "senderName": userData.name,
            "paymentCreated": time.toString(),
            "processedOn": time.toString(),
            "amount": amount.text
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
    num updatedBalance = num.parse(amount.text) + currentAmount;
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
}
