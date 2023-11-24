import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'Colours.dart';
import 'Fonts.dart';
import 'app/modules/reports/controllers/reports_controller.dart';
import 'app/routes/app_pages.dart';
import 'main.dart';

enum Databsesync { N, U, C }

enum Toast_types { SUCCESS, ERROR, INFO, WARNING }

class Constants {
  static final double App_Version = 1.3;
  static final double Master_image_height = 150;
  static final double Master_image_width = 150;
  static final double Master_image_uploadSize = 3; //3 MB
  static final bool APP_DEVLOPMENT_MODE = false;

  // static String serverapi = "http://192.168.1.60:9020";
  static String serverapi = "http://192.168.1.98:6090";
  // static String serverapi = "http://192.168.1.98:9030";
  //static String serverapi = "http://cloud.vimptech.com:9020";
  // static String serverapi = "http://192.168.1.60:9030";
  static final String DigitalmenuUrl = "https://digitalmenu.vimptech.com";
  static final String CloudDocumentUploadUrl = "http://cloud.vimptech.com:7887";

  //  static final String server_portno = "9030";
  static final String server_portno = "6090";
  // static final String DigitalmenuUrl = "https://vimptech.com";
  static final int Login_password_length = 4;
  static final double appbar_desktop_height = 80;
  static final double appbar_mobile_height = 93;
  // static var Upload_Document_Server_Path = "".obs;

  static final Map<String, String> ApiHeader = {
    // "Access-Control-Allow-Origin": "*",
    // "Access-Control-Allow-Credentials": "true",
    // "Access-Control-Allow-Methods": "GET,PUT,PATCH,POST,DELETE",
    // "Access-Control-Allow-Headers":3
    // "Origin, X-Requested-With, Content-Type, Accept",
    "Content-Type": "application/json",
    "Authorization": "vimpapi"
  };
  static bool App_setings_read_status = false;
  static final int Http_timeout = 15;
  static int Privilaged_login_emp_id = 0;
  static final int toast_error_closetime = 15;
  static final int toast_success_closetime = 5;
  static final int toast_info_closetime = 5;
  //static final modelname employeemodel;
  static int device_rowid = 0;
  static String device_id = "";

  // static var Model_logined_userPrivileges = Rxn<ModelUserwiseprivilage>();
  static void restartApp({bool? isnighttheme}) {
    // SetTheme(isnighttheme: isnighttheme);
    // if (Model_logined_userPrivileges.value != null) {
    //   user_Privillege_Controller().loginedUserPrivilage(
    //       empId: Model_logined_userPrivileges.value!.empId!,
    //       empAcid: Model_logined_userPrivileges.value!.empAcid!,
    //       counterName: Model_logined_userPrivileges.value!.counterName ?? '',
    //       counterOpeingbalance:
    //           Model_logined_userPrivileges.value!.counterOpeingbalance ?? 0.0,
    //       counterid: Model_logined_userPrivileges.value!.counterid ?? 0,
    //       empName: Model_logined_userPrivileges.value!.empName ?? '');
    // }

    Get.offAllNamed(Routes.REPORTS);
  }

  static void restartApp_SETTINGS_UPDATE({bool? isnighttheme}) {
    // SetTheme(isnighttheme: isnighttheme);
    App_setings_read_status = false;
    Get.offAllNamed(Routes.REPORTS);
  }

  // static void RefreshPosDashboard() {
  //   try {
  //     ReportsController controller = Get.find();
  //     Get.closeAllSnackbars();
  //     Get.back(closeOverlays: true);

  //     if (controller.scaffoldkey_enddrawer.currentState!.isEndDrawerOpen) {
  //       controller.scaffoldkey_enddrawer.currentState!.closeEndDrawer();
  //     }
  //     try {
  //       controller.timer_refresh!.cancel();
  //     } catch (e) {
  //       print(e);
  //     }

  //     controller.onInit();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // static void RealoadPosDashboardPage() {
  //   PosdashboardController controller = Get.find();
  //   controller.onInit();
  // }

  static String removeDecimalZeroFormat(double value) {
    return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 2);
  }

  static Appbar() {
    ReportsController controller = Get.find();
    return Container(
      height: Constants.appbar_desktop_height,
      color: ColorsApp.COLOR_PRIMARY,
      child: Row(children: [
        Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(8),
                        child:controller.mainpage.value==true? IconButton(
                            onPressed: () {
                              controller.Click_moduleDrawer(controller);
                            },
                            icon: Icon(
                              LineIcons.bars,
                              color: ColorsApp.COLOR_PRIMARY_TEXT,
                            )):IconButton(
                            onPressed: () {
                              controller.mainpage.value=true;
                              Get.back();
                            },
                            icon: Icon(
                              LineIcons.angleLeft,
                              color: ColorsApp.COLOR_PRIMARY_TEXT,
                            ))),
                    Container(
                      width: 120,
                      child: AutoSizeText(
                          "${controller.model_ownerapp_shopinfodata.value!.datainfo![0].shopname ?? 0}",
                          style: TextStyle(
                              color: ColorsApp.COLOR_PRIMARY_TEXT,
                              fontSize: 14,
                              fontFamily: Fonts.font_Montserrat),
                          maxLines: 1,
                          minFontSize: 8),
                    )
                  ],
                ))),Obx(() => 
        controller.model_datepickerlist.value == null ||
                controller.model_datepickerlist.value!.datepickerlist!.isEmpty
            ? CircularProgressIndicator()
            : ToggleSwitch(
                minWidth: GetPlatform.isMobile?60:90,
                fontSize: 11,
                minHeight: 30.0,
                initialLabelIndex: controller.date_isselected.value,
                cornerRadius: 20.0,
                inactiveBgColor: ColorsApp.COLOR_PRIMARY,
                activeBgColor: [ColorsApp.COLOR_PRIMARY_TEXT],
                activeFgColor: ColorsApp.COLOR_PRIMARY,
                inactiveFgColor: ColorsApp.COLOR_PRIMARY_TEXT,
                customHeights: [30, 30, 30, 30, 60],
                customWidths:GetPlatform.isMobile? [42, 33, 43, 40, 50]: [120, 70, 100, 100, 160],
                customTextStyles:GetPlatform.isMobile?const [
        TextStyle(
          fontSize: 4,
        ),
        TextStyle(fontSize: 4),
        TextStyle(fontSize: 4),
        TextStyle(fontSize: 4),
        TextStyle(fontSize: 4)
      ]: const [
                  TextStyle(fontSize: 12),
                  TextStyle(fontSize: 12),
                  TextStyle(fontSize: 12),
                  TextStyle(fontSize: 12),
                  TextStyle(
                    fontSize: 10,
                  )
                ],
                labels: controller.model_datepickerlist.value!.datepickerlist!
                    .map(
                      (e) => e.index == 4
                          ? '${e.text}\n ${e.from_date == null || e.from_date == "" ? DateFormat("yyy-MMM-dd").format(DateTime.now()) : DateFormat('yyy-MMM-dd').format(DateTime.parse(e.from_date!)).toString()}${e.to_date == null || e.to_date == "" ? DateFormat("yyy-MMM-dd").format(DateTime.now()) : DateFormat(' yyy-MMM-dd').format(DateTime.parse(e.to_date!)).toString()}'
                          : e.text!,
                    )
                    .toList(),
                borderWidth: 1.0,
                borderColor: [ColorsApp.COLOR_PRIMARY_TEXT],
                onToggle: (index) async {
                  controller.date_isselected.value = index!;
                  var is_select = controller
                      .model_datepickerlist.value!.datepickerlist!
                      .where((element) => element.is_selected = false);
                  print(is_select);
                  controller.datepicker_assign(index: index);
                })),
      ]),
    );
  }

  static void SnakeBarshow(
      {SnackPosition? snackPosition,
      EdgeInsets? margin,
      double? maxWidth,
      Color? colorText,
      Color? backgroundColor,
      required String title,
      String? subtitle,
      Toast_types? tost_type,
      Duration? duration}) {
    Color background = Colors.blue;
    Color text_color = Colors.white;
    if (colorText != null) {
      text_color = colorText;
    }
    if (tost_type != null) {
      if (backgroundColor != null) {
        background = backgroundColor;
      } else {
        switch (tost_type) {
          case Toast_types.WARNING:
            background = Colors.yellow;
            text_color = Colors.black;
            break;
          case Toast_types.INFO:
            background = Colors.blue;
            text_color = Colors.white;
            break;
          case Toast_types.SUCCESS:
            background = Colors.green;
            text_color = Colors.white;
            break;
          case Toast_types.ERROR:
            background = Colors.red;
            text_color = Colors.white;
            break;
          default:
            background = Colors.blue;
            text_color = Colors.white;
        }
      }
    }
    Get.closeAllSnackbars();
    Get.snackbar(
      duration: duration ?? Duration(seconds: 3),
      icon: Icon(LineIcons.info, color: ColorsApp.COLOR_SECONDARY),
      margin: margin ?? EdgeInsets.only(bottom: 50),
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      maxWidth: maxWidth ??
          (GetPlatform.isMobile ? (Get.width * .80) : (Get.width * .40)),
      colorText: text_color,
      backgroundColor: background,
      title,
      subtitle ?? '',
    );
  }

  static Widget TooltipCustom(
      {required String messege, required Widget child}) {
    return Tooltip(
        triggerMode: TooltipTriggerMode.tap,
        child: child,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: ColorsApp.COLOR_TERTIARY,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        message: messege,
        textStyle: TextStyle(
            fontFamily: Fonts.font_Montserrat,
            color: ColorsApp.COLOR_SECONDARY));
  }

  static void CloseOverlays() {
    try {
      Get.closeAllSnackbars();

      Get.back(closeOverlays: true);
    } catch (e) {}
  }

  static void Privilage_clearSecondUser() {
    // for (var element
    //     in Model_logined_userPrivileges.value!.userwiseprivilage!) {
    //   element.secondUserAcid = 0;
    //   element.secondUserId = 0;
    //   element.secondUserLoginSts = false;
    //   element.secondUserName = "";
    // }
    // Model_logined_userPrivileges.refresh();
  }

  static String VMENU_REPORTS = "VMENU_REPORTS";

}
