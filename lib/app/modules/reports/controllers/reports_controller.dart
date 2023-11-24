import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:vmenu_reports/Constants.dart';
import 'package:vmenu_reports/app/modules/login/controllers/login_controller.dart';
import 'package:vmenu_reports/app/modules/login/views/login_view.dart';
import 'package:vmenu_reports/app/modules/reports/login_reports/loginreports._view.dart';
import 'package:vmenu_reports/app/modules/reports/model/model_reports_shopinfo_model.dart';
import 'package:vmenu_reports/app/modules/reports/provider/ReportsProvider.dart';
import 'package:vmenu_reports/app/modules/reports/views/reports_view.dart';
import 'package:vmenu_reports/app/routes/app_pages.dart';

import '../model/model_reports_datepickerlist_model.dart';

enum ENDRAWER_NAVIGATION { REPORT_SETTINGS, FILTER_DATA }

enum Drawer_Modules { SALES_WITH_TAX_REPORT, FOODCOUNT_REPORT, STORE_LIST }

class ReportsController extends GetxController {
  int Apptoken = 555666;
  String Password = "6754";
  String Username = "";
  int? userid;
  final ControlleradvancedDrawer = AdvancedDrawerController();
  var is_loading = false.obs;
  var mainpage = true.obs;
  var date_isselected = 0.obs;
  var shoplst_selected = false.obs;
  var Drawer_Module_page = Rxn<Enum>();
  var model_ownerapp_shopinfodata = Rxn<ModelReportsShopinfo>();
  var model_datepickerlist = Rxn<ModelReportsDatepickerlist>();
  RoundedLoadingButtonController btn_controller =
      RoundedLoadingButtonController();
  @override
  void onInit() async {
    mainpage = true.obs;
    getdata(apptoken: Apptoken, password: Password);
    datepickerlist_getdata();

    super.onInit();
  }

  @override
  void onReady() async {
    await _checklogin();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getdata({required int apptoken, required String password}) async {
    is_loading.value = false;
    try {
      var responce = await ReportsProvider().Ownerapp_getshopinfo(
          jsondata: {"apptoken": apptoken, "password": password});
      if (responce['code'] == 200) {
        model_ownerapp_shopinfodata.value =
            ModelReportsShopinfo.fromJson(jsonDecode(responce['message']));
        is_loading.value = true;
        // print(model_ownerappdata.value!.toJson());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void datepickerlist_getdata() async {
    var responce = {
      "datepickerlist": [
        {
          "index": 0,
          "text": "Yesturday",
          "is_selected": true,
          "from_date": "",
          "to_date": ""
        },
        {
          "index": 1,
          "text": "Today",
          "is_selected": false,
          "from_date": "",
          "to_date": ""
        },
        {
          "index": 2,
          "text": "Last 7 Days",
          "is_selected": false,
          "from_date": "",
          "to_date": ""
        },
        {
          "index": 3,
          "text": "Last 30 Days",
          "is_selected": false,
          "from_date": "",
          "to_date": ""
        },
        {
          "index": 4,
          "text": "Custome Time",
          "is_selected": false,
          "from_date": "",
          "to_date": ""
        }
      ]
    };
    //  await File("assets/json/Ownerapp/model_ownerapp_datepickerlist.json"
    // assets/json/Ownerapp/model_ownerapp_datepickerlist.json"
    //      )
    //  .readAsString();
    model_datepickerlist.value =
        ModelReportsDatepickerlist.fromJson((responce));
  }

  void datepicker_assign({index}) {
    if (index == 4) {
      selectFromDate(index: index);
    }
    for (var a in model_datepickerlist.value!.datepickerlist!) {
      a.from_date = '';
      a.to_date = '';
    }
    // print(selectedfromDate.value);
    model_datepickerlist.value!.datepickerlist![index].is_selected = true;
    model_datepickerlist.value!.datepickerlist![index].from_date = index == 0
        ? DateTime.now().toString()
        : index == 1
            ? DateTime.now().subtract(Duration(days: 1)).toString()
            : index == 2
                ? DateTime.now().subtract(Duration(days: 7)).toString()
                : DateTime.now().subtract(Duration(days: 30)).toString();
    model_datepickerlist.value!.datepickerlist![index].to_date =
        DateTime.now().toString();
    print(model_datepickerlist.toJson());
    is_loading.value = true;
    model_datepickerlist.refresh();
  }

  selectFromDate({int? index}) async {
    DateTimeRange dateRange = DateTimeRange(
      start: DateTime.now().subtract(Duration(days: 1)),
      end: DateTime.now().add(Duration(days: 1)),
    );
    DateTimeRange? newDateRange = await showDateRangePicker(
      currentDate: DateTime.now(),
      context: Get.context!,
      anchorPoint: Offset(100, 200),
      initialDateRange: dateRange,
      firstDate: DateTime(2019),
      lastDate: DateTime(2050),
    );
    dateRange = newDateRange ?? dateRange;
    model_datepickerlist.value!.datepickerlist![index!].from_date =
        dateRange.start.toString();
    model_datepickerlist.value!.datepickerlist![index].to_date =
        dateRange.end.toString();
    print(model_datepickerlist.toJson());
    model_datepickerlist.refresh();
  }

  void Click_moduleDrawer(ReportsController controller) {
    //controller.scaffoldkey_enddrawer.currentState!.openDrawer();
    controller.ControlleradvancedDrawer.showDrawer();

    //  scaffoldkey.currentState!.openEndDrawer();
  }

  _checklogin() async {
    var Storage = GetStorage(Constants.VMENU_REPORTS);
    var Encryptedpin = Storage.read("loginpin") ?? "";
    if (Encryptedpin == null || Encryptedpin == "") {
 LoginView(). First_signupDialogue();
    } else {
      Get.toNamed(Routes.LOGIN);

    }
  }
}

