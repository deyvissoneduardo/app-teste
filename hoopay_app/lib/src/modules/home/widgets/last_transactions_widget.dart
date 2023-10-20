import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helpers/hoopay_color.dart';
import '../home_controller.dart';

class LastTransactionsWidget extends StatelessWidget {
  const LastTransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final controller = Get.find<HomeController>();
    return Container(
      height: height / 3,
      color: Colors.transparent,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: controller.transaction.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width / 20,
            vertical: height / 100,
          ),
          child: Container(
            height: height / 11,
            width: width,
            decoration: BoxDecoration(
              color: HoopayColor.primeryColor,
              border: Border.all(
                color: Colors.grey.withOpacity(1),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 45),
              child: Row(
                children: [
                  Container(
                    height: height / 15,
                    width: width / 7,
                    decoration: BoxDecoration(
                      color: HoopayColor.darktabwhiteColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        controller.transaction[index],
                        height: height / 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height / 70,
                      ),
                      Row(
                        children: [
                          Text(
                            controller.transactionname[index],
                            style: TextStyle(
                              fontFamily: 'Gilroy Bold',
                              color: HoopayColor.darkColor,
                              fontSize: height / 50,
                            ),
                          ),
                          // SizedBox(width: width / 7,),
                        ],
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Row(
                        children: [
                          Text(
                            controller.transactiondate[index],
                            style: TextStyle(
                              fontFamily: 'Gilroy Medium',
                              color: HoopayColor.darkgreyColor.withOpacity(0.6),
                              fontSize: height / 60,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: height / 70,
                      ),
                      Text(
                        controller.transactionamount[index],
                        style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: controller.transactioncolor[index],
                          fontSize: height / 45,
                        ),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Text(
                        'Order ID:***ase21',
                        style: TextStyle(
                          fontFamily: 'Gilroy Medium',
                          color: HoopayColor.darkgreyColor.withOpacity(0.6),
                          fontSize: height / 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
