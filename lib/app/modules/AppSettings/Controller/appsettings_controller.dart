// ignore_for_file: camel_case_types, constant_identifier_names, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:vmenu_reports/app/modules/AppSettings/View/appsettings_view.dart';
import 'package:vmenu_reports/app/modules/report_settings/model/model_report_settings_model.dart';


enum COLOR_FORMAT_REPORT_SETTINGS { PRIMARY, SECONDARY, TERITARY }
enum COLOR_TYPE_REPORT_SETTINGS { BACKGROUND, TEXT }


class Appsettings_Controller{
  static var is_loading=false.obs;
  static var model_appsettings=Rxn<ModelReportSettings>();
  static Map<String, dynamic>? modelJson; 
  static var toogle_isselected = 0.obs;
  static var is_moduletile_slct=false.obs;
  static TextEditingController txt_fromdate_controller = TextEditingController(
          text: DateFormat('dd-MMM-yyyy').format(DateTime.now()));
  static TextEditingController txt_todate_controller = TextEditingController(
          text: DateFormat('dd-MMM-yyyy').format(DateTime.now()));
  static var Slct_fromdate = DateTime.now().obs;
  static var Slct_todate = DateTime.now().obs;
    static RoundedLoadingButtonController btn_apptheme_controller =
      RoundedLoadingButtonController();
      final format = DateFormat("hh:mm a");
    static TimeOfDay? time;
    static Rxn<Currency> dropdown_Currency = Rxn();
    //model_appsettings.value!.reportSettings!.first.currency![0]
  //////
  Getdata_report_settings()async{
    try {
      is_loading.value=false;
      var responce = await File("assets/json/reports/model_report_settings.json").readAsString();
       
// { 
//   "report_settings": [
//     {
//   "reportbasedon": {
//     "type": "daywise",
//     "customtime": {
//       "nextday": true,
//       "starttime": "01:10",
//       "closetime": "23:55"
//     }
//   },
//   "currency": [
//     {
//       "name": "Indian Rupee",
//       "code": "INR",
//       "position": "L",
//       "active": true
//     },
//     {
//       "name": "US Dollar",
//       "code": "USD",
//       "position": "L",
//       "active": false
//     },
//     {
//       "name": "Australian Dollar",
//       "code": "AUD",
//       "position": "L",
//       "active": false
//     },
//     {
//       "name": "Euro",
//       "code": "EUR",
//       "position": "L",
//       "active": false
//     },
//     {
//       "name": "Bahraini Dinar",
//       "code": "BHD",
//       "position": "L",
//       "active": false
//     },
//     {
//       "name": "Afghani",
//       "code": "AFN",
//       "position": "L",
//       "active": false
//     },
//     {
//       "name": "Kuwaiti Dinar",
//       "code": "KWD",
//       "position": "L",
//       "active": false
//     },
//     {
//       "name": "Pakistan Rupee",
//       "code": "PKR",
//       "position": "L",
//       "active": false
//     },
//     {
//       "name": "Qatari Rial",
//       "code": "QAR",
//       "position": "L",
//       "active": false
//     },
//     {
//       "name": "Saudi Riyal",
//       "code": "SAR",
//       "position": "L",
//       "active": false
//     },
//     {
//       "name": "Singapore Dollar",
//       "code": "SGD",
//       "position": "L",
//       "active": false
//     },
//     {
//       "name": "UAE Dirham",
//       "code": "AED",
//       "position": "L",
//       "active": false
//     }
//   ],
//   "theme": {
//     "Selected_Theme": 1,
//     "1_COLOR_PRIMARY": "0xFFFF3EF4",
//     "1_COLOR_PRIMARY_TEXT": "0XFFFFFFFF",
//     "1_COLOR_SECONDARY": "0XFFFFFFFF",
//     "1_COLOR_SECONDARY_TEXT": "0xFF131515",
//     "1_COLOR_TERTIARY": "0xFF131515",
//     "1_COLOR_TERTIARY_TEXT": "0XFFFFFFFF",
//     "2_COLOR_PRIMARY": "0xFFFF3EF4",
//     "2_COLOR_PRIMARY_TEXT": "0XFFFFFFFF",
//     "2_COLOR_SECONDARY": "0XFFFFFFFF",
//     "2_COLOR_SECONDARY_TEXT": "0xFF131515",
//     "2_COLOR_TERTIARY": "0xFF131515",
//     "2_COLOR_TERTIARY_TEXT": "0XFFFFFFFF",
//     "3_COLOR_PRIMARY": "0xFFFF3EF4",
//     "3_COLOR_PRIMARY_TEXT": "0XFFFFFFFF",
//     "3_COLOR_SECONDARY": "0XFFFFFFFF",
//     "3_COLOR_SECONDARY_TEXT": "0xFF131515",
//     "3_COLOR_TERTIARY": "0xFF131515",
//     "3_COLOR_TERTIARY_TEXT": "0XFFFFFFFF",
//     "4_COLOR_PRIMARY": "0xFFFF3EF4",
//     "4_COLOR_PRIMARY_TEXT": "0XFFFFFFFF",
//     "4_COLOR_SECONDARY": "0XFFFFFFFF",
//     "4_COLOR_SECONDARY_TEXT": "0xFF131515",
//     "4_COLOR_TERTIARY": "0xFF131515",
//     "4_COLOR_TERTIARY_TEXT": "0XFFFFFFFF",
//     "5_COLOR_PRIMARY": "0xFFFF3EF4",
//     "5_COLOR_PRIMARY_TEXT": "0XFFFFFFFF",
//     "5_COLOR_SECONDARY": "0XFFFFFFFF",
//     "5_COLOR_SECONDARY_TEXT": "0xFF131515",
//     "5_COLOR_TERTIARY": "0xFF131515",
//     "5_COLOR_TERTIARY_TEXT": "0XFFFFFFFF"
//   },
//   "modules": [
//     {
//       "name": "sales report",
//       "active": true
//     },{
//       "name": "sales report",
//       "active": true
//     }]
  
// }]
// };
    model_appsettings.value =
        ModelReportSettings.fromJson((jsonDecode(responce)));
        // print(model_appsettings.toJson());
        modelJson = model_appsettings.toJson();
  int key=modelJson!['report_settings'][0].keys.length;
  print("Number of keys in the ModelReportSettings object: $key");
  print(model_appsettings.value!.reportSettings![0].reportbasedon);
  for(var a in modelJson!['report_settings'][0].keys){
    if(a=="reportbasedon"){
      print("reportbasedon");
    }else{
      print("object");
    }
  }
  // switch(modelJson!['report_settings'][0].keys){
  //   case("reportbasedon"):
  //   {
  //            print("object");
  //            break;
  //   }
  // }
  is_loading.value=true;
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

   Future<void> fromdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null && picked != Slct_fromdate.value) {
      // selectdob.value = picked;
      txt_fromdate_controller.text = DateFormat('dd-MMM-yyyy').format(picked);
    }
  }

  Future<void> todate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null && picked != Slct_todate.value) {
      // selectdob.value = picked;
      txt_todate_controller.text = DateFormat('dd-MMM-yyyy').format(picked);
    }
  }
   int bgcolorpicker({required F_COLOR_FORMAT, required F_COLOR_TYPE}) {
    int? selectedtheme = model_appsettings
        .value!.reportSettings![0].theme!.selectedTheme;
    switch (selectedtheme) {
      case 0:
        if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.PRIMARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORPRIMARY!
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORPRIMARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.SECONDARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORSECONDARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORSECONDARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.TERITARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORTERTIARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORTERTIARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        }
        break;
      case 1:
        if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.PRIMARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORPRIMARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORPRIMARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.SECONDARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORSECONDARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORSECONDARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.TERITARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORTERTIARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORTERTIARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        }
        break;
      case 2:
        if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.PRIMARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORPRIMARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORPRIMARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.SECONDARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORSECONDARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORSECONDARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.TERITARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORTERTIARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORTERTIARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        }
        break;
      case 3:
        if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.PRIMARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORPRIMARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORPRIMARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.SECONDARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORSECONDARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORSECONDARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.TERITARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORTERTIARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORTERTIARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        }
        break;
      case 4:
        if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.PRIMARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORPRIMARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORPRIMARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.SECONDARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORSECONDARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORSECONDARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.TERITARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORTERTIARY
                    .toString()) ??
                0XFFFFFFFF;
          } else {
            return int.tryParse(model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORTERTIARYTEXT
                    .toString()) ??
                0XFFFFFFFF;
          }
        }
    }
    return 0;
  }
    void selectedcolorpicker(
      {required F_COLOR_FORMAT, required F_COLOR_TYPE, required Color color}) {
    int? selectedtheme = model_appsettings
        .value!.reportSettings![0].theme!.selectedTheme;
    switch (selectedtheme) {
      case 0:
        if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.PRIMARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
           model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORPRIMARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORPRIMARYTEXT = color.value.toString();
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.SECONDARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORSECONDARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORSECONDARYTEXT = color.value.toString();
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.TERITARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORTERTIARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s1COLORTERTIARYTEXT = color.value.toString();
          }
        }
        break;
      case 1:
        if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.PRIMARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORPRIMARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORPRIMARYTEXT = color.value.toString();
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.SECONDARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORSECONDARY = color.value.toString();
          } else {
           model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORSECONDARYTEXT = color.value.toString();
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.TERITARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORTERTIARY = color.value.toString();
          } else {
           model_appsettings.value!.reportSettings![0]
                    .theme!.s2COLORTERTIARYTEXT = color.value.toString();
          }
        }
        break;
      case 2:
        if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.PRIMARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
           model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORPRIMARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORPRIMARYTEXT = color.value.toString();
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.SECONDARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORSECONDARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORSECONDARYTEXT = color.value.toString();
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.TERITARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORTERTIARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s3COLORTERTIARYTEXT = color.value.toString();
          }
        }
        break;
      case 3:
        if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.PRIMARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
           model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORPRIMARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORPRIMARYTEXT = color.value.toString();
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.SECONDARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORSECONDARY = color.value.toString();
          } else {
           model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORSECONDARYTEXT = color.value.toString();
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.TERITARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORTERTIARY = color.value.toString();
          } else {
           model_appsettings.value!.reportSettings![0]
                    .theme!.s4COLORTERTIARYTEXT = color.value.toString();
          }
        }
        break;
      case 4:
        if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.PRIMARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORPRIMARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORPRIMARYTEXT = color.value.toString();
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.SECONDARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORSECONDARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORSECONDARYTEXT = color.value.toString();
          }
        } else if (F_COLOR_FORMAT == COLOR_FORMAT_REPORT_SETTINGS.TERITARY) {
          if (F_COLOR_TYPE == COLOR_TYPE_REPORT_SETTINGS.BACKGROUND) {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORTERTIARY = color.value.toString();
          } else {
            model_appsettings.value!.reportSettings![0]
                    .theme!.s5COLORTERTIARYTEXT = color.value.toString();
          }
        }
    }
  }
    void App_Theme_saveData() async {
    // try {
    //   var responcedata =
    //       await DashboardProvider().update_pos_settings(jsondata: {
    //     "settings_data": model_App_theme.value!.settingsData![0].settingsdata!,
    //     "rowid": model_App_theme.value!.settingsData![0].rowid
    //   });
    //   if (responcedata['code'] != 200) {
    //     btn_apptheme_controller.reset();
    //     Constants.SnakeBarshow(
    //         title: "Api Error", tost_type: Toast_types.ERROR);
    //   } else {
    //     btn_apptheme_controller.reset();
    //     var storage = GetStorage(Constants.STORAGE_VMENU_APP_THEME);
    //     storage.erase();
    //     storage.write("color_data", ColorthemetoStorage());
    //     storage.write("night_mode", false);
    //     Constants.SnakeBarshow(
    //         title: "App Theme Settings Save Successfull",
    //         tost_type: Toast_types.SUCCESS);
    //     print(model_App_theme.toJson());
    //     print('Done');
    //   }
    // } catch (e) {
    //   Constants.SnakeBarshow(title: "Api Error", tost_type: Toast_types.ERROR);
    // }
  }

  static ClickAppsettingsettings() {
    dropdown_Currency .value=null;
   GetPlatform.isMobile?Appsettings_View().Mobile(): Appsettings_View().Desktop();
  }
}