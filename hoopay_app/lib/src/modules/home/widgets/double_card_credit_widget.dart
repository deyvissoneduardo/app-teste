import 'package:flutter/material.dart';

class DoubleCardCreditWidget extends StatelessWidget {
  const DoubleCardCreditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: height / 35,
        width: width / 1.5,
        margin: EdgeInsets.only(top: height / 30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Color(0xff8978fa),
        ),
      ),
    );
  }
}
