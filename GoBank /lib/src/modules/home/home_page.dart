import 'package:flutter/material.dart';
import '../card/mycard.dart';
import '../trash/notifications.dart';
import '../trash/request/request.dart';
import '../trash/scanpay/scan.dart';
import '../trash/seeallpayment.dart';
import '../trash/seealltransaction.dart';
import '../trash/topup/topupcard/topup.dart';
import '../trash/transfer/sendmoney.dart';
import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../profile/helpsupport.dart';
import '../profile/legalandpolicy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ColorNotifire notifire;

  void getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? previusstate = prefs.getBool('setIsDark');
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  List img = [
    'images/mobile.png',
    'images/shopping.png',
    'images/water.png',
    'images/wifi1.png',
    'images/assurance.png',
    'images/ticket.png',
    'images/bill.png',
    'images/categories.png',
  ];

  List paymentname = [
    CustomStrings.nearbystores,
    CustomStrings.onlineshopping,
    CustomStrings.travelflight,
    CustomStrings.eventsmovies,
    CustomStrings.buyinsurance,
    CustomStrings.getfastag,
    CustomStrings.buyelectronic,
    CustomStrings.allservices,
  ];

  List transaction = [
    'images/starbuckscoffee.png',
    'images/spotify.png',
    'images/netflix.png',
  ];
  List cashbankimg = [
    'images/cashback.png',
    'images/merchant1.png',
    'images/helpandsupport.png',
  ];
  List transactionname = [
    CustomStrings.starbuckscoffee,
    CustomStrings.spotifypremium,
    CustomStrings.netflixpremium,
  ];
  List transactioncolor = [
    Colors.red,
    Colors.green,
    Colors.red,
  ];
  List transactionamount = [
    '-\$.55.000',
    '+\$.27.000',
    '-\$.34.000',
  ];
  List cashbankname = [
    CustomStrings.cashback,
    CustomStrings.becomemerchant,
    CustomStrings.helpandsuppors,
  ];
  List cashbankdiscription = [
    CustomStrings.scratchcards,
    CustomStrings.startsccepting,
    CustomStrings.relatedpaytm,
  ];
  List transactiondate = [
    '12 Oct 2021 . 16:03',
    '8 Oct 2021 . 12:05',
    '4 Oct 2021 . 09:25',
  ];
  List cashbankdiscription2 = [
    CustomStrings.scratchcards2,
    CustomStrings.startsccepting2,
    CustomStrings.relatedpaytm2,
  ];
  bool selection = true;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CustomStrings.goodmorning,
                      style: TextStyle(
                        color: notifire.getdarkgreycolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Medium',
                      ),
                    ),
                    SizedBox(
                      height: height / 100,
                    ),
                    Text(
                      CustomStrings.hello,
                      style: TextStyle(
                        color: notifire.getdarkscolor,
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
                        builder: (context) => const MyCard(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'images/message1.png',
                    color: notifire.getdarkscolor,
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
                        builder: (context) =>
                            const Notificationindex(CustomStrings.notification),
                      ),
                    );
                  },
                  child: Image.asset(
                    'images/notification.png',
                    color: notifire.getdarkscolor,
                    height: height / 30,
                  ),
                ),
                SizedBox(
                  width: width / 20,
                ),
              ],
            ),
            SizedBox(
              height: height / 80,
            ),
            Stack(
              children: [
                Container(
                  color: notifire.getbackcolor,
                  child: Image.asset('images/backphoto.png'),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 30,
                    ),
                    Center(
                      child: Container(
                        height: height / 35,
                        width: width / 1.5,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Color(0xff8978fa),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: height / 7,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: notifire.getbluecolor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height / 40,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 20),
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
                                        'images/mastercard.png',
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
                                    color: selection
                                        ? Colors.transparent
                                        : Colors.transparent,
                                    child: selection
                                        ? Text(
                                            '\$.12.000.000',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: height / 35,
                                              fontFamily: 'Gilroy Bold',
                                            ),
                                          )
                                        : Text(
                                            '********',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: height / 20,
                                              fontFamily: 'Gilroy Bold',
                                            ),
                                          ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selection = !selection;
                                      });
                                    },
                                    child: selection
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                              bottom: height / 100,
                                            ),
                                            child: Image.asset(
                                              'images/eye.png',
                                              color: Colors.white,
                                              height: height / 40,
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(
                                              bottom: height / 100,
                                            ),
                                            child: const Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 30),
                        child: Container(
                          height: height / 7,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: notifire.getdarkwhitecolor,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: notifire.getbluecolor.withOpacity(0.4),
                                blurRadius: 15.0,
                                offset: const Offset(0.0, 0.75),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height / 50,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Scan(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: height / 15,
                                          width: width / 7,
                                          decoration: BoxDecoration(
                                            color: notifire.gettabwhitecolor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              'images/scanpay.png',
                                              height: height / 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 60,
                                      ),
                                      Text(
                                        CustomStrings.scanpay,
                                        style: TextStyle(
                                          fontFamily: 'Gilroy Bold',
                                          color: notifire.getdarkscolor,
                                          fontSize: height / 55,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SendMoney(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: height / 15,
                                          width: width / 7,
                                          decoration: BoxDecoration(
                                            color: notifire.gettabwhitecolor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              'images/transfer.png',
                                              height: height / 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 60,
                                      ),
                                      Text(
                                        CustomStrings.transfer,
                                        style: TextStyle(
                                          fontFamily: 'Gilroy Bold',
                                          color: notifire.getdarkscolor,
                                          fontSize: height / 55,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Request(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: height / 15,
                                          width: width / 7,
                                          decoration: BoxDecoration(
                                            color: notifire.gettabwhitecolor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              'images/request.png',
                                              height: height / 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 60,
                                      ),
                                      Text(
                                        CustomStrings.request,
                                        style: TextStyle(
                                          fontFamily: 'Gilroy Bold',
                                          color: notifire.getdarkscolor,
                                          fontSize: height / 55,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Topup(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: height / 15,
                                          width: width / 7,
                                          decoration: BoxDecoration(
                                            color: notifire.gettabwhitecolor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              'images/topup.png',
                                              height: height / 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 60,
                                      ),
                                      Text(
                                        CustomStrings.topup,
                                        style: TextStyle(
                                          fontFamily: 'Gilroy Bold',
                                          color: notifire.getdarkscolor,
                                          fontSize: height / 55,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Row(
                children: [
                  Text(
                    CustomStrings.discoverservices,
                    style: TextStyle(
                      fontFamily: 'Gilroy Bold',
                      color: notifire.getdarkscolor,
                      fontSize: height / 40,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Seeallpayment(),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        CustomStrings.seeall,
                        style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: notifire.getbluecolor,
                          fontSize: height / 45,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Container(
                color: Colors.transparent,
                height: height / 3.5,
                width: width,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: height / 15),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: height / 10,
                    mainAxisExtent: height / 8,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: height / 50,
                    mainAxisSpacing: height / 50,
                  ),
                  itemCount: img.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Scan(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: height / 15,
                            width: width / 7,
                            decoration: BoxDecoration(
                              color: notifire.gettabwhitecolor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                img[index],
                                height: height / 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 90,
                          ),
                          Center(
                            child: Text(
                              paymentname[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Gilroy Bold',
                                color: notifire.getdarkscolor,
                                fontSize: height / 55,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: height / 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Row(
                children: [
                  Text(
                    CustomStrings.lasttransaction,
                    style: TextStyle(
                      fontFamily: 'Gilroy Bold',
                      color: notifire.getdarkscolor,
                      fontSize: height / 40,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Seealltransaction(),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        CustomStrings.seeall,
                        style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: notifire.getbluecolor,
                          fontSize: height / 45,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            Container(
              height: height / 3,
              color: Colors.transparent,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: transaction.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 20,
                    vertical: height / 100,
                  ),
                  child: Container(
                    height: height / 11,
                    width: width,
                    decoration: BoxDecoration(
                      color: notifire.getdarkwhitecolor,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Row(
                        children: [
                          Container(
                            height: height / 15,
                            width: width / 7,
                            decoration: BoxDecoration(
                              color: notifire.gettabwhitecolor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                transaction[index],
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
                                    transactionname[index],
                                    style: TextStyle(
                                      fontFamily: 'Gilroy Bold',
                                      color: notifire.getdarkscolor,
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
                                    transactiondate[index],
                                    style: TextStyle(
                                      fontFamily: 'Gilroy Medium',
                                      color: notifire.getdarkgreycolor
                                          .withOpacity(0.6),
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
                                transactionamount[index],
                                style: TextStyle(
                                  fontFamily: 'Gilroy Bold',
                                  color: transactioncolor[index],
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
                                  color: notifire.getdarkgreycolor
                                      .withOpacity(0.6),
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
            ),
            Container(
              height: height / 2.5,
              color: Colors.transparent,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: cashbankname.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 20,
                    vertical: height / 100,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Notificationindex(CustomStrings.cashback),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpSupport(
                              CustomStrings.becomemerchant,
                            ),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LegalPolicy(CustomStrings.helps),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: height / 9,
                      width: width,
                      decoration: BoxDecoration(
                        color: notifire.getdarkwhitecolor,
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 20),
                        child: Row(
                          children: [
                            Container(
                              height: height / 15,
                              width: width / 7,
                              decoration: BoxDecoration(
                                color: notifire.gettabwhitecolor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  cashbankimg[index],
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
                                      cashbankname[index],
                                      style: TextStyle(
                                        fontFamily: 'Gilroy Bold',
                                        color: notifire.getdarkscolor,
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cashbankdiscription[index],
                                          style: TextStyle(
                                            fontFamily: 'Gilroy Medium',
                                            color: notifire.getdarkgreycolor
                                                .withOpacity(0.6),
                                            fontSize: height / 60,
                                          ),
                                        ),
                                        Text(
                                          cashbankdiscription2[index],
                                          style: TextStyle(
                                            fontFamily: 'Gilroy Medium',
                                            color: notifire.getdarkgreycolor
                                                .withOpacity(0.6),
                                            fontSize: height / 60,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: notifire.getdarkscolor,
                              size: height / 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
          ],
        ),
      ),
    );
  }

// Widget week() {
//   return selectedindex == 0
//       ? const ChatScreen()
//       : const ChatRound();
// }
}
