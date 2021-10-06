import 'package:arenaclash/Constantcolors.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ConstantColors constantColors = ConstantColors();
    return Scaffold(
        backgroundColor: constantColors.mainColor,
        body: ListView.builder(
            itemCount: 34,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Container(
                  height: size.height * 0.1,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 15, left: 10),
                                child: Icon(
                                  Icons.account_balance,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 10),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 14,
                                    ),
                                    Text(
                                      ' Deposit',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 120, top: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text('30 Sept 2021, 21:15',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('4500.00' ' INR',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      paymentHistoryDetail(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_drop_down_circle_rounded,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Future paymentHistoryDetail(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: size.height * 0.6,
            width: size.width,
            decoration: BoxDecoration(
                color: constantColors.mainColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Status', style: TextStyle(color: Colors.grey)),
                      Text('Complete', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Request Id', style: TextStyle(color: Colors.grey)),
                      Text('D8876968', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Account', style: TextStyle(color: Colors.grey)),
                      Text('Wallet', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Payment Method', style: TextStyle(color: Colors.grey)),
                      Text('Instant bank transfers', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Sender Name', style: TextStyle(color: Colors.grey)),
                      Text('Ashutosh Kumar', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Payment Created', style: TextStyle(color: Colors.grey)),
                      Text('Sep 30,2021 9:15 PM', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Processed on', style: TextStyle(color: Colors.grey)),
                      Text('Sep 30,2021 9:15 PM', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Credited amount', style: TextStyle(color: Colors.grey)),
                      Text('4600.00 INR', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        });
  }
}