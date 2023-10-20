import 'package:flutter/material.dart';

import '../../../core/helpers/hoopay_color.dart';
import '../../../core/helpers/string.dart';

class InfoCardCreditWidget extends StatelessWidget {
  const InfoCardCreditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: height / 7,
        width: width / 1.2,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: HoopayColor.blueColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width / 20,
              ),
              child: Row(
                children: [
                  Text(
                    CustomStrings.totalwalletbalance,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 50,
                      fontFamily: 'Gilroy Medium',
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/mastercard.png',
                        height: height / 25,
                      ),
                      Text(
                        CustomStrings.mastercard,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height / 70,
                          fontFamily: 'Gilroy Medium',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 20),
              child: Row(
                children: [
                  Container(
                    height: height / 20,
                    width: width / 2.4,
                    color: Colors.transparent,
                    child: Text(
                      '\$.12.000.000',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height / 35,
                        fontFamily: 'Gilroy Bold',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // controller.selection.value = !controller.selection.value;
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: height / 100,
                      ),
                      child: Image.asset(
                        'assets/images/eye.png',
                        color: Colors.white,
                        height: height / 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
