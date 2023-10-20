import 'package:flutter/material.dart';

import '../../../core/helpers/hoopay_color.dart';
import '../../../core/helpers/string.dart';
import 'card_utils_info_widget.dart';

class RowCardUtilsInfoWidget extends StatelessWidget {
  const RowCardUtilsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 30),
      child: Center(
        child: Container(
          height: height / 7,
          width: width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: HoopayColor.primeryColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: HoopayColor.blueColor.withOpacity(0.4),
                blurRadius: 15.0,
                offset: const Offset(0.0, 0.75),
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardUtilsInfoWidget(
                title: CustomStrings.scanpay,
                path: 'assets/images/scanpay.png',
              ),
              CardUtilsInfoWidget(
                title: CustomStrings.transfer,
                path: 'assets/images/transfer.png',
              ),
              CardUtilsInfoWidget(
                title: CustomStrings.request,
                path: 'assets/images/request.png',
              ),
              CardUtilsInfoWidget(
                title: CustomStrings.topup,
                path: 'assets/images/topup.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
