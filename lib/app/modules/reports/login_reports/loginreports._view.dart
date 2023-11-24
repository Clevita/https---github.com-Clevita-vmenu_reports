// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/get_core.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:pinput/pinput.dart';
// import 'package:vmenu_reports/Colours.dart';
// import 'package:vmenu_reports/Fonts.dart';
// import 'package:vmenu_reports/app/modules/reports/login_reports/loginreports_controller.dart';

// class LoginPages {
//   Future First_signupDialogue() async {
//     await showDialog(
//         barrierDismissible: false,
//         context: Get.context!,
//         builder: (builder) {
//           return Dialog(
//             alignment: Alignment.center,
//             backgroundColor: ColorsApp.COLOR_SECONDARY,
//             shape: RoundedRectangleBorder(
//                 side: BorderSide(color: ColorsApp.COLOR_TERTIARY),
//                 borderRadius: BorderRadius.all(Radius.circular(8))),
//             // contentPadding: EdgeInsets.only(top: 10.0),
//             child: SafeArea(
//               child: Container(
//                 width: 340,
//                 height: 300,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 30, left: 40),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           "Sign Up!",
//                           style: TextStyle(
//                               color: ColorsApp.COLOR_SECONDARY_TEXT,
//                               fontSize: 21,
//                               letterSpacing: 1.2,
//                               fontFamily: Fonts.font_Montserrat,
//                               fontWeight: FontWeight.w700),
//                           textAlign: TextAlign.start,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Center(
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
//                               loginreports_controller
//                                       .txt_tokenno_controller.selection =
//                                   TextSelection(
//                                       baseOffset: 0,
//                                       extentOffset: loginreports_controller
//                                           .txt_tokenno_controller
//                                           .value
//                                           .text
//                                           .length);
//                             },
//                             controller:
//                                 loginreports_controller.txt_tokenno_controller,
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
//                     ),
//                     SizedBox(
//                       height: 14,
//                     ),
//                     Center(
//                       child: Container(
//                         height: 40,
//                         width: 200,
//                         child: Obx(() => TextFormField(
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   color: ColorsApp.COLOR_SECONDARY_TEXT,
//                                   fontFamily: Fonts.font_Montserrat,
//                                   fontSize: 17),
//                               textAlign: TextAlign.center,
//                               keyboardType: TextInputType.number,
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.allow(
//                                     RegExp('[0-9]')),
//                               ],
//                               validator: (value) {
//                                 if (value!.isEmpty || int.parse(value) >= 4) {
//                                   return "password must be 4 digits";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               obscureText:
//                                   loginreports_controller.passwordVisible.value,
//                               autofocus: true,
//                               onTap: () {
//                                 loginreports_controller
//                                         .txt_password_controller.selection =
//                                     TextSelection(
//                                         baseOffset: 0,
//                                         extentOffset: loginreports_controller
//                                             .txt_password_controller
//                                             .value
//                                             .text
//                                             .length);
//                               },
//                               controller: loginreports_controller
//                                   .txt_password_controller,
//                               decoration: InputDecoration(
//                                 focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         width: 0.5,
//                                         color: ColorsApp.COLOR_PRIMARY)),
//                                 labelText: "Password".capitalize!,
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
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     loginreports_controller
//                                                 .passwordVisible.value ==
//                                             true
//                                         ? Icons.visibility_off
//                                         : Icons.visibility,
//                                     size: 20,
//                                     color: Colors.black,
//                                   ),
//                                   onPressed: () {
//                                     loginreports_controller
//                                             .passwordVisible.value =
//                                         !loginreports_controller
//                                             .passwordVisible.value;
//                                     print(loginreports_controller
//                                         .passwordVisible.value);
//                                     print(!loginreports_controller
//                                         .passwordVisible.value);
//                                   },
//                                 ),
//                               ),
//                               // keyboardType: TextInputType.visiblePassword,
//                               textInputAction: TextInputAction.done,
//                               obscuringCharacter: "*",
//                             )),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Container(
//                         height: 33,
//                         width: 90,
//                         child: FloatingActionButton(
//                           backgroundColor: ColorsApp.COLOR_PRIMARY,
//                           onPressed: () {
//                             loginreports_controller.Appregistration_getdata();
//                           },
//                           child: Text("Proceed",
//                               style: TextStyle(
//                                   color: ColorsApp.COLOR_PRIMARY_TEXT,
//                                   fontFamily: Fonts.font_Montserrat,
//                                   fontSize: 14,
//                                   letterSpacing: 1)),
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   Future pinnumber_dialogue() async {
//     await showDialog(
//         barrierDismissible: false,
//         context: Get.context!,
//         builder: (builder) {
//           return Dialog(
//             alignment: Alignment.center,
//             backgroundColor: ColorsApp.COLOR_SECONDARY,
//             shape: RoundedRectangleBorder(
//                 side: BorderSide(color: ColorsApp.COLOR_TERTIARY),
//                 borderRadius: BorderRadius.all(Radius.circular(8))),
//             // contentPadding: EdgeInsets.only(top: 10.0),
//             child: SafeArea(
//               child: Container(
//                  width: 360,
//                 height: 300,
//                 // width: 500,
//                 // height: 400,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 37, left: 35),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           textWidthBasis: TextWidthBasis.longestLine,
//                           "Enter Your Pin Number Here.",
//                           style: TextStyle(
//                               color: ColorsApp.COLOR_SECONDARY_TEXT,
//                               fontSize: 14,
//                               letterSpacing: 0.3,
//                               wordSpacing: 2,
//                               fontFamily: Fonts.font_Montserrat,
//                               fontWeight: FontWeight.w500),
//                           textAlign: TextAlign.start,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     Center(
//                       child: Container(
//                           height: 40,
//                           // margin: EdgeInsets.only(left: 16, right: 16),
//                           width: 200,
//                           child: TextFormField(
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
//                               loginreports_controller
//                                       .txt_pinno_controller.selection =
//                                   TextSelection(
//                                       baseOffset: 0,
//                                       extentOffset: loginreports_controller
//                                           .txt_pinno_controller
//                                           .value
//                                           .text
//                                           .length);
//                             },
//                             controller:
//                                 loginreports_controller.txt_pinno_controller,
//                             decoration: InputDecoration(
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: 0.5,
//                                       color: ColorsApp.COLOR_PRIMARY)),
//                               labelText: "Pin Number".capitalize!,
//                               labelStyle: TextStyle(
//                                   fontStyle: FontStyle.italic,
//                                   color: ColorsApp.COLOR_PRIMARY,
//                                   fontFamily: Fonts.font_Montserrat,
//                                   fontSize: 16),
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 0.5,
//                                     color: ColorsApp.COLOR_NIGHT_PRIMARY),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Colors.black,
//                               )),
//                             ),
//                             obscureText: true,
//                             obscuringCharacter: "*",
//                             onChanged: (value) {
//                               if (value.length! > 4) {
//                                 Get.snackbar(
//                                   "WARNING!",
//                                   "Pin Must Be 4 Digits",
//                                   backgroundColor: ColorsApp.COLOR_SECONDARY,
//                                   snackPosition: SnackPosition.BOTTOM,
//                                 );
//                               }
//                             },
//                           )),
//                     ),SizedBox(height: 14,), Center(
//                       child: Container(
//                           height: 40,
//                           // margin: EdgeInsets.only(left: 16, right: 16),
//                           width: 200,
//                           child: TextFormField(
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
//                               loginreports_controller
//                                       .txt_pinno_controller.selection =
//                                   TextSelection(
//                                       baseOffset: 0,
//                                       extentOffset: loginreports_controller
//                                           .txt_pinno_controller
//                                           .value
//                                           .text
//                                           .length);
//                             },
//                             controller:
//                                 loginreports_controller.txt_pinno_controller,
//                             decoration: InputDecoration(
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       width: 0.5,
//                                       color: ColorsApp.COLOR_PRIMARY)),
//                               labelText: "Re-Enter".capitalize!,
//                               labelStyle: TextStyle(
//                                   fontStyle: FontStyle.italic,
//                                   color: ColorsApp.COLOR_PRIMARY,
//                                   fontFamily: Fonts.font_Montserrat,
//                                   fontSize: 16),
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 0.5,
//                                     color: ColorsApp.COLOR_NIGHT_PRIMARY),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Colors.black,
//                               )),
//                             ),
//                             obscureText: true,
//                             obscuringCharacter: "*",
//                             onChanged: (value) {
//                               if (value.length! > 4) {
//                                 Get.snackbar(
//                                   "WARNING!",
//                                   "Pin Must Be 4 Digits",
//                                   backgroundColor: ColorsApp.COLOR_SECONDARY,
//                                   snackPosition: SnackPosition.BOTTOM,
//                                 );
//                               }
//                             },
//                           )),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Container(
//                         height: 33,
//                         width: 90,
//                         child: FloatingActionButton(
//                           backgroundColor: ColorsApp.COLOR_PRIMARY,
//                           onPressed: () {
//                             loginreports_controller.Save_Pinnumber(
//                                 pinnumber: loginreports_controller
//                                     .txt_pinno_controller.text);
//                           },
//                           child: Text("OK",
//                               style: TextStyle(
//                                   color: ColorsApp.COLOR_PRIMARY_TEXT,
//                                   fontFamily: Fonts.font_Montserrat,
//                                   fontSize: 14,
//                                   letterSpacing: 1)),
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   Future<void> ApplicationPin_bottomsheet() async {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         color: Color.fromRGBO(30, 60, 87, 1),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(19),
//         border: Border.all(color: Color.fromRGBO(23, 171, 144, 0.4)),
//       ),
//     );
//     await showModalBottomSheet(
//         isScrollControlled: true,
//         isDismissible: false,
//         context: Get.context!,
//         builder: (BuildContext bc) {
//           return Container(
//             height: Get.height * 0.85,
//             width: Get.height * 0.85,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(30),
//                   child: Center(
//                     child: Text(
//                       "Application Pin",
//                       style: TextStyle(
//                           color: ColorsApp.COLOR_SECONDARY_TEXT,
//                           letterSpacing: 0.3,
//                           wordSpacing: 1,
//                           fontFamily: Fonts.font_Montserrat,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Center(
//                     child: Text(
//                       "Enter Your Application Pin Number .",
//                       style: TextStyle(
//                           color: ColorsApp.COLOR_SECONDARY_TEXT,
//                           letterSpacing: 0.3,
//                           wordSpacing: 3,
//                           fontFamily: Fonts.font_Montserrat,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w300),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 60,
//                 ),
//                 Center(
//                   child: Pinput(
//                     autofocus: true,
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.allow(RegExp('[0-9]')),
//                     ],
//                     obscureText: true,
//                     obscuringCharacter: "*",
//                     focusNode: FocusNode(),
//                     controller: loginreports_controller
//                         .txt_verification_pinno_controller,
//                     separatorBuilder: (index) => const SizedBox(width: 8),
//                     defaultPinTheme: defaultPinTheme,
//                     focusedPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         borderRadius: BorderRadius.circular(8),
//                         border:
//                             Border.all(color: Color.fromRGBO(23, 171, 144, 1)),
//                       ),
//                     ),
//                     submittedPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         color: Color.fromRGBO(243, 246, 249, 0),
//                         borderRadius: BorderRadius.circular(19),
//                         border:
//                             Border.all(color: Color.fromRGBO(23, 171, 144, 1)),
//                       ),
//                     ),
//                     errorPinTheme: defaultPinTheme.copyBorderWith(
//                       border: Border.all(color: Colors.redAccent),
//                     ),
//                     cursor: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(bottom: 9),
//                           width: 22,
//                           height: 1,
//                           color: Color.fromRGBO(23, 171, 144, 1),
//                         ),
//                       ],
//                     ),
//                     onCompleted: (pin) {
//                       debugPrint('onCompleted: $pin');
//                     },
//                     onChanged: (value) {
//                       debugPrint('onChanged: $value');
//                     },
//                     hapticFeedbackType: HapticFeedbackType.lightImpact,
//                   ),
//                 )
//               ],
//             ),

//             // ]),
//           );
//         });
//   }
// }
