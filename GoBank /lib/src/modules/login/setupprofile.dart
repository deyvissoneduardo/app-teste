import 'package:flutter/material.dart';
import '/src/modules/verification/indetyfiyverifiy.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/src/modules/utils/button.dart';
import '/src/modules/utils/colornotifire.dart';
import '/src/modules/utils/media.dart';
import '/src/modules/utils/normaltextfild.dart';
import '/src/modules/utils/string.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({Key? key}) : super(key: key);

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
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

  String dropdownvalue = '01';
  String monthvalue = 'Jan';
  String yearvalue = '2018';
  String gendervalue = CustomStrings.male;

  var items = [
    '01',
    '02',
    '03',
    '04',
    '05',
  ];
  var monthitems = [
    'Jan',
    'feb',
    'mar',
    'ape',
    'may',
  ];
  var yearitems = [
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
  ];
  var genderitems = [
    CustomStrings.male,
    CustomStrings.female,
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  color: Colors.transparent,
                  child: Image.asset(
                    'images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: notifire.getdarkscolor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            CustomStrings.setupprofile,
                            style: TextStyle(
                              color: notifire.getdarkscolor,
                              fontSize: height / 40,
                              fontFamily: 'Gilroy Bold',
                            ),
                          ),
                          const Spacer(),
                          Text(
                            CustomStrings.skip,
                            style: TextStyle(
                              color: notifire.getdarkscolor,
                              fontSize: height / 50,
                              fontFamily: 'Gilroy Bold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 6,
                    ),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            height: height / 1.2,
                            width: width / 1.1,
                            decoration: BoxDecoration(
                              color: notifire.getprimerycolor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: height / 7.5),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width / 18,
                                    ),
                                    Text(
                                      CustomStrings.personalinformations,
                                      style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 45,
                                        fontFamily: 'Gilroy Bold',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height / 40),
                                Container(
                                  height: height / 2,
                                  width: width / 1.25,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xff6C56F9)
                                          .withOpacity(0.10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: height / 50),
                                      Row(
                                        children: [
                                          SizedBox(width: width / 20),
                                          Text(
                                            CustomStrings.fullnamee,
                                            style: TextStyle(
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 50,
                                              fontFamily: 'Gilroy Bold',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 80),
                                      NormalCustomtextfilds.textField(
                                        notifire.getdarkscolor,
                                        notifire.getdarkgreycolor,
                                        notifire.getbluecolor,
                                        CustomStrings.antorpaul,
                                        width / 20,
                                        notifire.gettabwhitecolor,
                                      ),
                                      SizedBox(height: height / 45),
                                      Row(
                                        children: [
                                          SizedBox(width: width / 20),
                                          Text(
                                            CustomStrings.contactnumber,
                                            style: TextStyle(
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 50,
                                              fontFamily: 'Gilroy Bold',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 80),
                                      NormalCustomtextfilds.textField(
                                        notifire.getdarkscolor,
                                        notifire.getdarkgreycolor,
                                        notifire.getbluecolor,
                                        '+1 59405 5946',
                                        width / 20,
                                        notifire.gettabwhitecolor,
                                      ),
                                      SizedBox(height: height / 50),
                                      Row(
                                        children: [
                                          SizedBox(width: width / 20),
                                          Text(
                                            CustomStrings.dateofbirth,
                                            style: TextStyle(
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 50,
                                              fontFamily: 'Gilroy Bold',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 80),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: height / 17,
                                            width: width / 5,
                                            decoration: BoxDecoration(
                                              color: notifire.gettabwhitecolor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                              ),
                                            ),
                                            child: DropdownButton(
                                              underline: const SizedBox(),
                                              // Initial Value
                                              value: dropdownvalue,

                                              // Down Arrow Icon
                                              icon: Row(
                                                children: [
                                                  SizedBox(width: width / 40),
                                                  Icon(
                                                    Icons
                                                        .arrow_drop_down_outlined,
                                                    color:
                                                        notifire.getdarkscolor,
                                                  ),
                                                ],
                                              ),

                                              // Array list of items
                                              items: items.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: width / 50,
                                                      ),
                                                      Text(
                                                        items,
                                                        style: TextStyle(
                                                          fontSize: height / 60,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                          Container(
                                            height: height / 17,
                                            width: width / 5,
                                            decoration: BoxDecoration(
                                              color: notifire.gettabwhitecolor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                              ),
                                            ),
                                            child: DropdownButton(
                                              underline: const SizedBox(),
                                              // Initial Value
                                              value: monthvalue,

                                              // Down Arrow Icon
                                              icon: Row(
                                                children: [
                                                  SizedBox(width: width / 40),
                                                  Icon(
                                                    Icons
                                                        .arrow_drop_down_outlined,
                                                    color:
                                                        notifire.getdarkscolor,
                                                  ),
                                                ],
                                              ),

                                              // Array list of items
                                              items: monthitems
                                                  .map((String monthitems) {
                                                return DropdownMenuItem(
                                                  value: monthitems,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: width / 50,
                                                      ),
                                                      Text(
                                                        monthitems,
                                                        style: TextStyle(
                                                          fontSize: height / 60,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  monthvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                          Container(
                                            height: height / 17,
                                            width: width / 5,
                                            decoration: BoxDecoration(
                                              color: notifire.gettabwhitecolor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                              ),
                                            ),
                                            child: DropdownButton(
                                              underline: const SizedBox(),
                                              // Initial Value
                                              value: yearvalue,

                                              // Down Arrow Icon
                                              icon: Row(
                                                children: [
                                                  SizedBox(width: width / 40),
                                                  Icon(
                                                    Icons
                                                        .arrow_drop_down_outlined,
                                                    color:
                                                        notifire.getdarkscolor,
                                                  ),
                                                ],
                                              ),

                                              // Array list of items
                                              items: yearitems
                                                  .map((String yearitems) {
                                                return DropdownMenuItem(
                                                  value: yearitems,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: width / 50,
                                                      ),
                                                      Text(
                                                        yearitems,
                                                        style: TextStyle(
                                                          fontSize: height / 60,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  yearvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 50),
                                      Row(
                                        children: [
                                          SizedBox(width: width / 20),
                                          Text(
                                            CustomStrings.gender,
                                            style: TextStyle(
                                              color: notifire.getdarkscolor,
                                              fontSize: height / 50,
                                              fontFamily: 'Gilroy Bold',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 80),
                                      Container(
                                        height: height / 17,
                                        width: width / 1.4,
                                        decoration: BoxDecoration(
                                          color: notifire.gettabwhitecolor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(0.3),
                                          ),
                                        ),
                                        child: DropdownButton(
                                          underline: const SizedBox(),
                                          // Initial Value
                                          value: gendervalue,

                                          // Down Arrow Icon
                                          icon: Row(
                                            children: [
                                              SizedBox(width: width / 2),
                                              Icon(
                                                Icons.arrow_drop_down_outlined,
                                                color: notifire.getdarkscolor,
                                              ),
                                            ],
                                          ),

                                          // Array list of items
                                          items: genderitems
                                              .map((String genderitems) {
                                            return DropdownMenuItem(
                                              value: genderitems,
                                              child: Row(
                                                children: [
                                                  SizedBox(width: width / 50),
                                                  Text(
                                                    genderitems,
                                                    style: TextStyle(
                                                      fontSize: height / 60,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              gendervalue = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: height / 32),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const VerifiyIdenty(),
                                      ),
                                    );
                                  },
                                  child: Custombutton.button(
                                    notifire.getbluecolor,
                                    CustomStrings.continues,
                                    width / 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height / 10,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: height / 6,
                            width: width / 2.5,
                            decoration: BoxDecoration(
                              color: notifire.getbluecolor.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                size: height / 9,
                                color: notifire.getbluecolor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: width / 3.5,
                              top: height / 10,
                            ),
                            child: Image.asset(
                              'images/adprofile.png',
                              height: height / 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
