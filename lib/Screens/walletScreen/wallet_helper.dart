import 'package:flutter/material.dart';

class WalletHelper with ChangeNotifier {
  Widget header(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
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

  Widget actions(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height*0.2,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.green,
                        size: 24,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Deposit",
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Divider(
                thickness: 0.2,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.green,
                        size: 24,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Withdraw",
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,)
                ],
              ),
            )
          ],
        ));
  }
}
