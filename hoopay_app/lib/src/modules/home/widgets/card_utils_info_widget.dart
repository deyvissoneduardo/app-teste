// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/helpers/hoopay_color.dart';

class CardUtilsInfoWidget extends StatelessWidget {
  final String title;
  final String path;
  const CardUtilsInfoWidget({
    Key? key,
    required this.title,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Container(),
              ),
            );
          },
          child: Container(
            height: height / 15,
            width: width / 7,
            margin: EdgeInsets.only(top: height / 50),
            decoration: BoxDecoration(
              color: HoopayColor.lightbackColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Image.asset(
                path,
                height: height / 20,
              ),
            ),
          ),
        ),
        SizedBox(
          height: height / 60,
        ),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Gilroy Bold',
            color: HoopayColor.darkColor,
            fontSize: height / 55,
          ),
        ),
      ],
    );
  }
}
