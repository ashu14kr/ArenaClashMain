import 'package:arenaclash/Screens/walletScreen/walletDeposit/paytm_form.dart';
import 'package:arenaclash/Screens/walletScreen/walletWithdraw/paytm_withdrawal_form.dart';
import 'package:arenaclash/Services/walletApi/get_current_balance.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class WalletHelper with ChangeNotifier {
  Widget header(BuildContext context) {
    var _amount = Provider.of<GetCurrentBalance>(context, listen: false).amount;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Text("Balance", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 5),
          _amount == null
              ? const Text("Loading...",
                  style: TextStyle(color: Colors.white, fontSize: 32))
              : Text(_amount.toString() + ".00",
                  style: const TextStyle(color: Colors.white, fontSize: 32))
        ],
      ),
    );
  }

  Widget actions(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const PaytmForm(),
                          type: PageTransitionType.leftToRight));
                },
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
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const WithdrawalForm(),
                          type: PageTransitionType.leftToRight));
                },
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
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
