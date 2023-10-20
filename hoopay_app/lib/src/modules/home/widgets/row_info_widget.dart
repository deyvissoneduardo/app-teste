import 'package:flutter/material.dart';

import '../../../core/helpers/hoopay_color.dart';
import '../../../core/helpers/string.dart';

class RowInfoWidget extends StatelessWidget {
  const RowInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        top: height / 20,
        left: 15,
        right: 15,
        bottom: 15,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CustomStrings.goodmorning,
                style: TextStyle(
                  color: HoopayColor.greyColor,
                  fontSize: height / 50,
                  fontFamily: 'Gilroy Medium',
                ),
              ),
              Text(
                CustomStrings.hello,
                style: TextStyle(
                  color: HoopayColor.darkColor,
                  fontSize: height / 40,
                  fontFamily: 'Gilroy Bold',
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
              );
            },
            child: Image.asset(
              'assets/images/message1.png',
              color: HoopayColor.darkColor,
              height: height / 30,
            ),
          ),
          SizedBox(
            width: width / 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
              );
            },
            child: Image.asset(
              'assets/images/notification.png',
              color: HoopayColor.darkColor,
              height: height / 30,
            ),
          ),
        ],
      ),
    );
  }
}
