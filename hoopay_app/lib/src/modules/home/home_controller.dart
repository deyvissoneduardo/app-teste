import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/helpers/string.dart';

class HomeController extends GetxController {
  final List img = [
    'assets/images/mobile.png',
    'assets/images/shopping.png',
    'assets/images/water.png',
    'assets/images/wifi1.png',
    'assets/images/assurance.png',
    'assets/images/ticket.png',
    'assets/images/bill.png',
    'assets/images/categories.png',
  ];

  final List paymentname = [
    CustomStrings.nearbystores,
    CustomStrings.onlineshopping,
    CustomStrings.travelflight,
    CustomStrings.eventsmovies,
    CustomStrings.buyinsurance,
    CustomStrings.getfastag,
    CustomStrings.buyelectronic,
    CustomStrings.allservices,
  ];

  final List transaction = [
    'assets/images/starbuckscoffee.png',
    'assets/images/spotify.png',
    'assets/images/netflix.png',
  ];

  final List cashbankimg = [
    'assets/images/cashback.png',
    'assets/images/merchant1.png',
    'assets/images/helpandsupport.png',
  ];

  final List transactionname = [
    CustomStrings.starbuckscoffee,
    CustomStrings.spotifypremium,
    CustomStrings.netflixpremium,
  ];

  final List transactioncolor = [
    Colors.red,
    Colors.green,
    Colors.red,
  ];

  final List transactionamount = [
    '-\$.55.000',
    '+\$.27.000',
    '-\$.34.000',
  ];

  final List cashbankname = [
    CustomStrings.cashback,
    CustomStrings.becomemerchant,
    CustomStrings.helpandsuppors,
  ];

  final List cashbankdiscription = [
    CustomStrings.scratchcards,
    CustomStrings.startsccepting,
    CustomStrings.relatedpaytm,
  ];

  final List transactiondate = [
    '12 Oct 2021 . 16:03',
    '8 Oct 2021 . 12:05',
    '4 Oct 2021 . 09:25',
  ];

  final List cashbankdiscription2 = [
    CustomStrings.scratchcards2,
    CustomStrings.startsccepting2,
    CustomStrings.relatedpaytm2,
  ];

  RxBool selection = true.obs;

  RxInt currentTab = 0.obs;
}
