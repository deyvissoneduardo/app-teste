import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/helpers/hoopay_color.dart';
import '../../core/helpers/string.dart';
import './home_controller.dart';
import 'widgets/double_card_credit_widget.dart';
import 'widgets/info_card_credit_widget.dart';
import 'widgets/last_transactions_widget.dart';
import 'widgets/row_card_utils_info_widget.dart';
import 'widgets/row_info_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    Widget currentScreen = const HomePage();
    return Scaffold(
      backgroundColor: HoopayColor.primeryColor,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          color: HoopayColor.primeryColor,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  currentScreen = const HomePage();
                  controller.currentTab.value = 0;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.currentTab.value == 0
                        ? Image.asset(
                            'assets/images/home1.png',
                            height: height / 34,
                            color: HoopayColor.blueColor,
                          )
                        : Image.asset(
                            'assets/images/home.png',
                            height: height / 33,
                            color: HoopayColor.darkColor,
                          ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  currentScreen = Container(
                    alignment: Alignment.center,
                    child: const Text('01'),
                  );
                  controller.currentTab.value = 1;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.currentTab.value == 1
                        ? Image.asset(
                            'assets/images/order1.png',
                            height: height / 33,
                            color: HoopayColor.blueColor,
                          )
                        : Image.asset(
                            'assets/images/variant.png',
                            height: height / 33,
                            color: HoopayColor.darkColor,
                          ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  currentScreen = Container(
                    alignment: Alignment.center,
                    child: const Text('02'),
                  );
                  controller.currentTab.value = 3;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.currentTab.value == 3
                        ? Image.asset(
                            'assets/images/wallet.png',
                            height: height / 30,
                            color: HoopayColor.blueColor,
                          )
                        : Image.asset(
                            'assets/images/message1.png',
                            height: height / 30,
                            color: HoopayColor.darkColor,
                          ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  currentScreen = Container(
                    alignment: Alignment.center,
                    child: const Text('03'),
                  );
                  controller.currentTab.value = 4;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.currentTab.value == 4
                        ? Image.asset(
                            'assets/images/profile1.png',
                            height: height / 30,
                            color: HoopayColor.blueColor,
                          )
                        : Image.asset(
                            'assets/images/profile.png',
                            height: height / 30,
                            color: HoopayColor.darkColor,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RowInfoWidget(),
            Stack(
              children: [
                Container(
                  color: HoopayColor.lightbackColor,
                  child: Image.asset('assets/images/backphoto.png'),
                ),
                const Column(
                  children: [
                    DoubleCardCreditWidget(),
                    InfoCardCreditWidget(),
                    RowCardUtilsInfoWidget(),
                  ],
                ),
              ],
            ),
            SizedBox(height: height / 30),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  CustomStrings.lasttransaction,
                  style: TextStyle(
                    fontFamily: 'Gilroy Bold',
                    color: HoopayColor.darkColor,
                    fontSize: height / 40,
                  ),
                ),
              ),
            ),
            const LastTransactionsWidget(),
          ],
        ),
      ),
    );
  }
}
