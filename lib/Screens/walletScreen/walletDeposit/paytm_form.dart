import 'package:arenaclash/Constantcolors.dart';
import 'package:arenaclash/Screens/walletScreen/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout() async {
    int amounttopay = int.parse(amount.text) * 100;
    var options = {
      'key': 'rzp_test_onfTbEge15K3ej',
      'amount': amounttopay,
      'name': 'Arena clash',
      'description': 'wallet refil',
      'prefill': {'contact': '8789553987', 'email': 'hello@gmail.com'},
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
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const WalletScreen(),
                      type: PageTransitionType.leftToRight));
            },
            icon: const Icon(Icons.arrow_back)),
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
            const SizedBox(height: 20),
            FloatingActionButton.extended(
              onPressed: openCheckout,
              label: const Text("CONFIRM"),
              backgroundColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}