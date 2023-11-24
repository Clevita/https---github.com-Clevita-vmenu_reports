// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vmenu_reports/Colours.dart';
// import 'package:vmenu_reports/app/modules/reports/login_reports/loginreports._view.dart';

// import '../provider/ReportsProvider.dart';

// class loginreports_controller {
//   static TextEditingController txt_tokenno_controller = TextEditingController();
//   static TextEditingController txt_password_controller =
//       TextEditingController();
//   static TextEditingController txt_pinno_controller = TextEditingController();
//   static TextEditingController txt_verification_pinno_controller = TextEditingController();
//   static var passwordVisible = true.obs;

//   static void Appregistration_getdata() async {
//     if (txt_tokenno_controller.text != "" ||
//         txt_password_controller.text != "") {
//       var responce = await ReportsProvider().Registration_Check(jsondata: {
//         "tokenno": txt_tokenno_controller.text,
//         "paswword": txt_password_controller.text
//       });
//       if (responce['code'] == 200) {
//         Get.back();
//         LoginPages().pinnumber_dialogue();
//       }
//     }
//   }

//   static void Save_Pinnumber({required pinnumber}) {
//     if (pinnumber.length > 4||pinnumber=="") {
//       Get.snackbar(
//         "WARNING!",
//         "Pin Must Be 4 Digits",
//         backgroundColor: ColorsApp.COLOR_SECONDARY,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } else {
//       LoginPages().ApplicationPin_bottomsheet();
//     }
//   }
// }
