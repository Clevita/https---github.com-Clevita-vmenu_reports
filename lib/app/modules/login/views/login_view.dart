// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pinput/pinput.dart';
import 'package:vmenu_reports/Colours.dart';
import 'package:vmenu_reports/Fonts.dart';
import 'package:vmenu_reports/WidgetPlugin/Cardchart1/cardchart1_controller.dart';
import 'package:vmenu_reports/WidgetPlugin/Cardchart1/model_cardchart_model.dart';

import 'package:vmenu_reports/WidgetPlugin/GraphChart/graphchart2_controller.dart';
import 'package:vmenu_reports/WidgetPlugin/GraphChart/graphchart_controller.dart';


import 'package:vmenu_reports/WidgetPlugin/GraphChart/model_graph_chart_model.dart';
import 'package:vmenu_reports/WidgetPlugin/PieChart/model_pie_chart_model.dart';
import 'package:vmenu_reports/WidgetPlugin/PieChart/piechartcontroller.dart';


import '../controllers/login_controller.dart';

class LoginView extends GetResponsiveView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  @override
  Widget builder() {
    if (screen.isDesktop) {
      return Desktop();
    } else if (screen.isPhone) {
      print('mobile');
      return Mobile();
    } else if (screen.isTablet) {
      print('tablet');
      return Desktop();
    } else {
      return Desktop();
    }
  }

  Future First_signupDialogue() async {
    await showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (builder) {
          return Dialog(
            alignment: Alignment.center,
            backgroundColor: ColorsApp.COLOR_SECONDARY,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorsApp.COLOR_TERTIARY),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            // contentPadding: EdgeInsets.only(top: 10.0),
            child: SafeArea(
              child: Container(
                width: 360,
                height: 330,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 40),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Sign Up!",
                          style: TextStyle(
                              color: ColorsApp.COLOR_SECONDARY_TEXT,
                              fontSize: 21,
                              letterSpacing: 1.2,
                              fontFamily: Fonts.font_Montserrat,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        // margin: EdgeInsets.only(left: 16, right: 16),
                        width: 200,
                        child: TextFormField(
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorsApp.COLOR_SECONDARY_TEXT,
                                fontSize: 17,
                                fontFamily: Fonts.font_Montserrat),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                            ],
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "invalid";
                              }
                            },
                            autofocus: true,
                            onTap: () {
                              LoginController.txt_tokenno_controller.selection =
                                  TextSelection(
                                      baseOffset: 0,
                                      extentOffset: LoginController
                                          .txt_tokenno_controller
                                          .value
                                          .text
                                          .length);
                            },
                            controller: LoginController.txt_tokenno_controller,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5,
                                        color: ColorsApp.COLOR_PRIMARY)),
                                labelText: "Token Number".capitalize!,
                                labelStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: ColorsApp.COLOR_PRIMARY,
                                    fontFamily: Fonts.font_Montserrat,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: ColorsApp.COLOR_NIGHT_PRIMARY),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.black,
                                )),
                                suffixIcon: Icon(LineIcons.coins))),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        width: 200,
                        child: Obx(() => TextFormField(
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: ColorsApp.COLOR_SECONDARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat,
                                  fontSize: 17),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]')),
                              ],
                              validator: (value) {
                                if (value!.isEmpty || int.parse(value) >= 4) {
                                  return "password must be 4 digits";
                                } else {
                                  return null;
                                }
                              },
                              obscureText:
                                  LoginController.passwordVisible.value,
                              autofocus: true,
                              onTap: () {
                                LoginController
                                        .txt_password_controller.selection =
                                    TextSelection(
                                        baseOffset: 0,
                                        extentOffset: LoginController
                                            .txt_password_controller
                                            .value
                                            .text
                                            .length);
                              },
                              controller:
                                  LoginController.txt_password_controller,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5,
                                        color: ColorsApp.COLOR_PRIMARY)),
                                labelText: "Password".capitalize!,
                                labelStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: ColorsApp.COLOR_PRIMARY,
                                    fontFamily: Fonts.font_Montserrat,
                                    fontSize: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: ColorsApp.COLOR_NIGHT_PRIMARY),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.black,
                                )),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    LoginController.passwordVisible.value ==
                                            true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    LoginController.passwordVisible.value =
                                        !LoginController.passwordVisible.value;
                                    print(
                                        LoginController.passwordVisible.value);
                                    print(
                                        !LoginController.passwordVisible.value);
                                  },
                                ),
                              ),
                              // keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              obscuringCharacter: "*",
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 33,
                        width: 90,
                        child: FloatingActionButton(
                          backgroundColor: ColorsApp.COLOR_PRIMARY,
                          onPressed: () {
                            LoginController().Appregistration_getdata();
                          },
                          child: Text("Proceed",
                              style: TextStyle(
                                  color: ColorsApp.COLOR_PRIMARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat,
                                  fontSize: 14,
                                  letterSpacing: 1)),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future pinnumber_dialogue() async {
    await showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (builder) {
          return Dialog(
            alignment: Alignment.center,
            backgroundColor: ColorsApp.COLOR_SECONDARY,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorsApp.COLOR_TERTIARY),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            // contentPadding: EdgeInsets.only(top: 10.0),
            child: SafeArea(
              child: Container(
                width: 360,
                height: 300,
                // width: 500,
                // height: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 37, left: 35),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          textWidthBasis: TextWidthBasis.longestLine,
                          "Enter Your Pin Number Here.",
                          style: TextStyle(
                              color: ColorsApp.COLOR_SECONDARY_TEXT,
                              fontSize: 14,
                              letterSpacing: 0.3,
                              wordSpacing: 2,
                              fontFamily: Fonts.font_Montserrat,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Container(
                          height: 40,
                          // margin: EdgeInsets.only(left: 16, right: 16),
                          width: 200,
                          child: TextFormField(
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorsApp.COLOR_SECONDARY_TEXT,
                                fontSize: 17,
                                fontFamily: Fonts.font_Montserrat),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                            ],
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "invalid";
                              }
                            },
                            autofocus: true,
                            onTap: () {
                              LoginController.txt_pinno_controller.selection =
                                  TextSelection(
                                      baseOffset: 0,
                                      extentOffset: LoginController
                                          .txt_pinno_controller
                                          .value
                                          .text
                                          .length);
                            },
                            controller: LoginController.txt_pinno_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: ColorsApp.COLOR_PRIMARY)),
                              labelText: "Pin Number".capitalize!,
                              labelStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: ColorsApp.COLOR_PRIMARY,
                                  fontFamily: Fonts.font_Montserrat,
                                  fontSize: 16),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.5,
                                    color: ColorsApp.COLOR_NIGHT_PRIMARY),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.black,
                              )),
                            ),
                            obscureText: true,
                            obscuringCharacter: "*",
                            onChanged: (value) {
                              if (value.length! > 4) {
                                Get.snackbar(
                                  "WARNING!",
                                  "Pin Must Be 4 Digits",
                                  backgroundColor: ColorsApp.COLOR_SECONDARY,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            },
                          )),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Center(
                      child: Container(
                          height: 40,
                          // margin: EdgeInsets.only(left: 16, right: 16),
                          width: 200,
                          child: TextFormField(
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorsApp.COLOR_SECONDARY_TEXT,
                                fontSize: 17,
                                fontFamily: Fonts.font_Montserrat),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                            ],
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "invalid";
                              }
                            },
                            autofocus: true,
                            onTap: () {
                              LoginController.txt_pinno2_controller.selection =
                                  TextSelection(
                                      baseOffset: 0,
                                      extentOffset: LoginController
                                          .txt_pinno2_controller
                                          .value
                                          .text
                                          .length);
                            },
                            controller: LoginController.txt_pinno2_controller,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5,
                                      color: ColorsApp.COLOR_PRIMARY)),
                              labelText: "Re-Enter".capitalize!,
                              labelStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: ColorsApp.COLOR_PRIMARY,
                                  fontFamily: Fonts.font_Montserrat,
                                  fontSize: 16),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.5,
                                    color: ColorsApp.COLOR_NIGHT_PRIMARY),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 0.5,
                                color: Colors.black,
                              )),
                            ),
                            obscureText: true,
                            obscuringCharacter: "*",
                            onChanged: (value) {
                              if (value.length! > 4) {
                                Get.snackbar(
                                  "WARNING!",
                                  "Pin Must Be 4 Digits",
                                  backgroundColor: ColorsApp.COLOR_SECONDARY,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              } else {
                                if (value.length == 4) {
                                  if (LoginController
                                          .txt_pinno_controller.text !=
                                      LoginController
                                          .txt_pinno2_controller.text) {
                                    Get.snackbar(
                                      "WARNING!",
                                      "Pin Is In Correct Re-Enter The Pin Again",
                                      backgroundColor:
                                          ColorsApp.COLOR_SECONDARY,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  }
                                }
                              }
                            },
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 33,
                        width: 90,
                        child: FloatingActionButton(
                          backgroundColor: ColorsApp.COLOR_PRIMARY,
                          onPressed: () {
                            LoginController().Save_Pinnumber(
                                pinnumber:
                                    LoginController.txt_pinno_controller.text);
                          },
                          child: Text("OK",
                              style: TextStyle(
                                  color: ColorsApp.COLOR_PRIMARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat,
                                  fontSize: 14,
                                  letterSpacing: 1)),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class Desktop extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Text(
                "Application Pin",
                style: TextStyle(
                    color: ColorsApp.COLOR_SECONDARY_TEXT,
                    letterSpacing: 0.3,
                    wordSpacing: 1,
                    fontFamily: Fonts.font_Montserrat,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                "Enter Your Application Pin Number .",
                style: TextStyle(
                    color: ColorsApp.COLOR_SECONDARY_TEXT,
                    letterSpacing: 0.3,
                    wordSpacing: 3,
                    fontFamily: Fonts.font_Montserrat,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Pinput(
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              obscureText: true,
              obscuringCharacter: "*",
              focusNode: FocusNode(),
              controller: LoginController.txt_verification_pinno_controller,
              separatorBuilder: (index) => const SizedBox(width: 8),
              defaultPinTheme: controller.defaultPinTheme,
              focusedPinTheme: controller.defaultPinTheme.copyWith(
                decoration: controller.defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color.fromRGBO(23, 171, 144, 1)),
                ),
              ),
              submittedPinTheme: controller.defaultPinTheme.copyWith(
                decoration: controller.defaultPinTheme.decoration!.copyWith(
                  color: Color.fromRGBO(243, 246, 249, 0),
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: Color.fromRGBO(23, 171, 144, 1)),
                ),
              ),
              errorPinTheme: controller.defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: Color.fromRGBO(23, 171, 144, 1),
                  ),
                ],
              ),
              onCompleted: (pin) {
                LoginController().compareloginpin();
              },
              validator: (value) {
                if (LoginController().validation_pin == value) {
                  return null;
                } else {
                  return "Incorrect Pin Try Again";
                }
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
            ),
          )
        ],
      ),
    );
  }
}

class Mobile extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(
    //     backgroundColor: Colors.black,
    //     body:
    //      SafeArea(
    //         child:
                //  LineChartCard()
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       cardchart1_controller.Getdata(
                //           modelcardchart: ModelCardchart(
                //               cardchartData: CardchartData(
                //                   spacing: 2,
                //                   runspacing: 1,
                //                   iconCircleavatar:
                //                       IconCircleavatar(color: "#FFFFFF", radius: 15),
                //                   cardHeight: 80,
                //                   cardWidth: 180,
                //                   cardBackgrndclr:"#FFFFFF" ,
                //                   cardData: [
                //             CardData(
                //                 title: "12345",
                //                 icon: "assets/images/download.png",
                //                 iconColor: "#FFFFFF",
                //                 percentage: Percentage(
                //                     decreaseIncrease: true,
                //                     showtitlePercentage: true,
                //                     value: 50,
                //                     valueFontsize: 8),
                //                 showPercentage: true,
                //                 subtitle: "perfect",
                //                 subtitleColor: "#000000",
                //                 subtitleFontsize: 12,
                //                 titleColor: "#000000",
                //                 titleFontsize: 14),
                //                    CardData(
                //                 title: "100",
                //                 icon: "assets/images/images.png",
                //                 iconColor: "0xFFFF3EF4",
                //                 percentage: Percentage(
                //                     decreaseIncrease: true,
                //                     showtitlePercentage: true,
                //                     value: 23,
                //                     valueFontsize: 8),
                //                 showPercentage: true,
                //                 subtitle: "perfect",
                //                 subtitleColor: "#000000",
                //                 subtitleFontsize: 12,
                //                 titleColor: "#000000",
                //                 titleFontsize: 14),
                //                    CardData(
                //                 title: "45",
                //                 icon: "assets/images/bell.png",
                //                 iconColor: "#000000",
                //                 percentage: Percentage(
                //                     decreaseIncrease: true,
                //                     showtitlePercentage: true,
                //                     value: 10,
                //                     valueFontsize: 8),
                //                 showPercentage: true,
                //                 subtitle: "perfect",
                //                 subtitleColor: "#000000",
                //                 subtitleFontsize: 12,
                //                 titleColor: "#000000",
                //                 titleFontsize: 14),
                //           ])))
                // //       //  cardchart1(),
                //     ],
                //   ),
                // ),

                //   piechartcontroller.Getdata(
                //         modelpichart: ModelPieChart(
                //             widgetData: WidgetData(
                //                 title: "Office",
                //                 titleFontsize: 14.0,
                //                 subtitle: "good",
                //                 subtitleFontsize: 10.0,
                //                 percentage: "70",
                //                 percentageFontsize: 16.0,
                //                 piechartRadius: 100.0,
                //                 pichartSectionlist: [
                //   PichartSectionlist(
                //       color: "#006400",
                //       radius: 25.0,
                //       touchedRadius: 35.0,
                //       showtitle: true,
                //       value: 10,
                //       valueColor:"#FFFFFF" ,
                //       borderside: Borderside(color: "0xFFFF3EF4", width: 4.0)), PichartSectionlist(
                //       color: "FF0000",
                //       radius: 25.0,
                //       touchedRadius: 35.0,
                //       showtitle: true,
                //       value: 50,
                //       valueColor: "#FFFFFF",
                //       borderside: Borderside(color: "0xFFFF3EF4", width: 4.0)), PichartSectionlist(
                //       color: "#00008B",
                //       radius: 25.0,
                //       touchedRadius: 35.0,
                //       showtitle: true,
                //       value: 20,
                //       valueColor: "#FFFFFF",
                //       borderside: Borderside(color: "0xFFFF3EF4", width: 4.0)), PichartSectionlist(
                //       color: "#FFFF00",
                //       radius: 25.0,
                //       touchedRadius: 35.0,
                //       showtitle: true,
                //       value: 20,
                //       valueColor: "#000000",
                //       borderside: Borderside(color: "0xFFFF3EF4", width: 4.0))
                // ])))
                // graphcard2_controller.Getdata(
                //     modellinechart: ModelGraphChart(
                //         linechartdata: Linechartdata(
                //             lefttileTitle: "AVG",
                //             lefttiletitleFontsize: 14.0,
                //             gradientcolors: [
                //               Gradientcolors(color: "0xff1458E1"),
                //               Gradientcolors(color: "0xffF9443A"),
                //               Gradientcolors(color: "0xff1458E1"),
                //               Gradientcolors(color: "0xffF9443A")
                //             ],
                //             bottomtileNames: [
                //               BottomtileNames(number: 0, names: "jan"),
                //               BottomtileNames(number: 1, names: "feb"),
                //               BottomtileNames(number: 2, names: "march"),
                //               BottomtileNames(number: 3, names: "april"),
                //               BottomtileNames(number: 4, names: "may"),
                //               BottomtileNames(number: 5, names: "june"),
                //                BottomtileNames(number: 6, names: "july"),
                //                 BottomtileNames(number: 7, names: "august"),
                //                  BottomtileNames(number: 8, names: "sept"),
                //                   BottomtileNames(number: 9, names: "oct")
                //             ],
                //             bottomtilenamesProperty: BottomtilenamesProperty(
                //                 color: "#FFFFFF",
                //                 fontsize: 12,
                //                 interval: 1,
                //                 reservedsize: 24,
                //                 showtilename: true),
                //             lefttileNames: [
                //              BottomtileNames(number: 0, names: "10k"),
                //               BottomtileNames(number: 2, names: "20k"),
                //               BottomtileNames(number: 4, names: "40k"),
                //               BottomtileNames(number: 6, names: "60k"),
                //               BottomtileNames(number: 8, names: "80k"),
                //               BottomtileNames(number: 9, names: "90k"),
                //             ],
                //             lefttilenamesProperty: BottomtilenamesProperty(
                //                 color: "#FFFFFF",
                //                 fontsize: 12.0,
                //                 interval: 1,
                //                 reservedsize: 24,
                //                 showtilename: true),
                //             flgriddata: Flgriddata(
                //                 dotdata: false,
                //                 horizontallineInterval: 1,
                //                 isCurved: true,
                //                 maxX: 8,
                //                 minX: 0,
                //                 maxY: 10,
                //                 minY: 0,
                //                 showHorizontallines: true,
                //                 showVerticlelines: true,
                //                 showLines: true,
                //                 verticlelineInterval: 1,
                //                 linechartbardata: [
                //                   Linechartbardata(spot1: 0, spot2: 1),
                //                   Linechartbardata(spot1: 1, spot2: 9),
                //                   Linechartbardata(spot1: 2, spot2: 9),
                //                   Linechartbardata(spot1: 3, spot2: 2),
                //                   Linechartbardata(spot1: 3, spot2: 4),
                //                   Linechartbardata(spot1: 4, spot2: 2),
                //                   Linechartbardata(spot1: 5, spot2: 3)
                //                 ]))))

                  //  graphchart_controller.Getdata(
                  //   modellinechart: ModelGraphChart(
                  //       linechartdata: Linechartdata(
                  //           lefttileTitle: "AVG",
                  //           lefttiletitleFontsize: 14.0,
                  //           gradientcolors: [
                  //             Gradientcolors(color: "0xff1458E1"),
                  //             Gradientcolors(color: "0xffF9443A"),
                  //             Gradientcolors(color: "0xff1458E1"),
                  //             Gradientcolors(color: "0xffF9443A")
                  //           ],
                  //           bottomtileNames: [
                  //             BottomtileNames(number: 0, names: "jan"),
                  //             BottomtileNames(number: 1, names: "feb"),
                  //             BottomtileNames(number: 2, names: "march"),
                  //             BottomtileNames(number: 3, names: "april"),
                  //             BottomtileNames(number: 4, names: "may"),
                  //             BottomtileNames(number: 5, names: "june"),
                  //              BottomtileNames(number: 6, names: "july"),
                  //               BottomtileNames(number: 7, names: "august"),
                  //                BottomtileNames(number: 8, names: "sept"),
                  //                 BottomtileNames(number: 9, names: "oct")
                  //           ],
                  //           bottomtilenamesProperty: BottomtilenamesProperty(
                  //               color: "#FFFFFF",
                  //               fontsize: 12,
                  //               interval: 1,
                  //               reservedsize: 24,
                  //               showtilename: true),
                  //           lefttileNames: [
                  //            BottomtileNames(number: 0, names: "10k"),
                  //             BottomtileNames(number: 2, names: "20k"),
                  //             BottomtileNames(number: 4, names: "40k"),
                  //             BottomtileNames(number: 6, names: "60k"),
                  //             BottomtileNames(number: 8, names: "80k"),
                  //             BottomtileNames(number: 9, names: "90k"),
                  //           ],
                  //           lefttilenamesProperty: BottomtilenamesProperty(
                  //               color: "#FFFFFF",
                  //               fontsize: 12.0,
                  //               interval: 1,
                  //               reservedsize: 24,
                  //               showtilename: true),
                  //           flgriddata: Flgriddata(
                  //               dotdata: false,
                  //               horizontallineInterval: 1,
                  //               isCurved: true,
                  //               maxX: 8,
                  //               minX: 0,
                  //               maxY: 10,
                  //               minY: 0,
                  //               showHorizontallines: true,
                  //               showVerticlelines: true,
                  //               showLines: true,
                  //               verticlelineInterval: 1,
                  //               linechartbardata: [
                  //                 Linechartbardata(spot1: 0, spot2: 1),
                  //                 Linechartbardata(spot1: 1, spot2: 9),
                  //                 Linechartbardata(spot1: 2, spot2: 9),
                  //                 Linechartbardata(spot1: 3, spot2: 2),
                  //                 Linechartbardata(spot1: 3, spot2: 4),
                  //                 Linechartbardata(spot1: 4, spot2: 2),
                  //                 Linechartbardata(spot1: 5, spot2: 3)
                  //               ]))))
//                                 ));
//   }
// }

        Scaffold(
          body: Column(
                children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Text(
                "Application Pin",
                style: TextStyle(
                    color: ColorsApp.COLOR_SECONDARY_TEXT,
                    letterSpacing: 0.3,
                    wordSpacing: 1,
                    fontFamily: Fonts.font_Montserrat,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                "Enter Your Application Pin Number .",
                style: TextStyle(
                    color: ColorsApp.COLOR_SECONDARY_TEXT,
                    letterSpacing: 0.3,
                    wordSpacing: 3,
                    fontFamily: Fonts.font_Montserrat,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Pinput(
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ],
              obscureText: true,
              obscuringCharacter: "*",
              focusNode: FocusNode(),
              controller: LoginController.txt_verification_pinno_controller,
              separatorBuilder: (index) => const SizedBox(width: 8),
              defaultPinTheme: controller.defaultPinTheme,
              focusedPinTheme: controller.defaultPinTheme.copyWith(
                decoration: controller.defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color.fromRGBO(23, 171, 144, 1)),
                ),
              ),
              submittedPinTheme: controller.defaultPinTheme.copyWith(
                decoration: controller.defaultPinTheme.decoration!.copyWith(
                  color: Color.fromRGBO(243, 246, 249, 0),
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: Color.fromRGBO(23, 171, 144, 1)),
                ),
              ),
              errorPinTheme: controller.defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: Color.fromRGBO(23, 171, 144, 1),
                  ),
                ],
              ),
               onCompleted: (pin) {
                  LoginController().compareloginpin();
                },
                validator: (value) {
                  if (LoginController().validation_pin == value) {
                    return null;
                  } else {
                    return "Incorrect Pin Try Again";  
                  }
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,

              hapticFeedbackType: HapticFeedbackType.lightImpact,
            ),
          )
                ],
              ),
        );
  }
}

//   Future First_signupDialogue() async {
//     LoginController controller=Get.find();
//   await showDialog(
//         barrierDismissible: false,
//         context: Get.context!,
//         builder: (builder) {
//           return Dialog(
//             alignment: Alignment.center,
//             backgroundColor: ColorsApp.COLOR_SECONDARY,child: Container(height: 200,width: 200,color: Colors.blue,child:   Center(
//                       child: Container(
//                         height: 40,
//                         // margin: EdgeInsets.only(left: 16, right: 16),
//                         width: 200,
//                         child: TextFormField(
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 color: ColorsApp.COLOR_SECONDARY_TEXT,
//                                 fontSize: 17,
//                                 fontFamily: Fonts.font_Montserrat),
//                             textAlign: TextAlign.center,
//                             keyboardType: TextInputType.number,
//                             inputFormatters: [
//                               FilteringTextInputFormatter.allow(
//                                   RegExp('[0-9]')),
//                             ],
//                             validator: (value) {
//                               if (value!.isNotEmpty) {
//                                 return null;
//                               } else {
//                                 return "invalid";
//                               }
//                             },
//                             autofocus: true,
//                             onTap: () {
//                               controller
//                                       .txt_tokenno_controller!.selection =
//                                   TextSelection(
//                                       baseOffset: 0,
//                                       extentOffset:  controller
//                                           .txt_tokenno_controller!
//                                           .value
//                                           .text
//                                           .length);
//                             },onChanged:(value){
//                                 controller.Appregistration_getdata();
//                             } ,
//                             controller:
//                                 controller.txt_tokenno_controller,
//                             decoration: InputDecoration(
//                                 focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         width: 0.5,
//                                         color: ColorsApp.COLOR_PRIMARY)),
//                                 labelText: "Token Number".capitalize!,
//                                 labelStyle: TextStyle(
//                                     fontStyle: FontStyle.italic,
//                                     color: ColorsApp.COLOR_PRIMARY,
//                                     fontFamily: Fonts.font_Montserrat,
//                                     fontSize: 16),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: 0.5,
//                                       color: ColorsApp.COLOR_NIGHT_PRIMARY),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                   width: 0.5,
//                                   color: Colors.black,
//                                 )),
//                                 suffixIcon: Icon(LineIcons.coins))),
//                       ),
//                     ),),);});
// }
