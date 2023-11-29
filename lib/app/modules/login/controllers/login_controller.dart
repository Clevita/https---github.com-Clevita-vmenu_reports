import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pinput/pinput.dart';
import 'package:vmenu_reports/Colours.dart';
import 'package:vmenu_reports/Constants.dart';
import 'package:vmenu_reports/app/modules/login/views/login_view.dart';
import 'package:vmenu_reports/app/modules/reports/provider/ReportsProvider.dart';
import 'package:vmenu_reports/app/routes/app_pages.dart';

class LoginController extends GetxController {
 static TextEditingController txt_tokenno_controller = TextEditingController(),
   txt_password_controller =
      TextEditingController(),
txt_pinno_controller = TextEditingController(),
  txt_pinno2_controller = TextEditingController(),
  txt_verification_pinno_controller = TextEditingController();
 static var passwordVisible = true.obs;
  var validation_pin;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
   final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Color.fromRGBO(23, 171, 144, 0.4)),
      ),
    );

   void Save_Pinnumber({required pinnumber}) async{
    if (pinnumber.length > 4||pinnumber=="") {
      Constants.SnakeBarshow(title: "WARNING!",subtitle: "Pin Must Be 4 Digits",tost_type:Toast_types.ERROR);
    } else {
      var responce=await ReportsProvider().Encrypt_loginpin(jsondata:{"data":txt_pinno2_controller.text.toString()});
      var loginpin_value=responce['message']['encripted_data'];
      var Storage = GetStorage(Constants.VMENU_REPORTS);
    var Encryptedpin = Storage.write("loginpin",loginpin_value);
      Get.back();
    }
  }

  

  void Appregistration_getdata() async{
     if (txt_tokenno_controller.text != "" ||
        txt_password_controller.text != "") {
      var responce = await ReportsProvider().Registration_Check(jsondata: {
        "apptoken":int.tryParse(txt_tokenno_controller.text) ,
        "password": txt_password_controller.text.toString()
      });
      if (responce['code'] == 200) {
        Get.back();
       LoginView(). pinnumber_dialogue();
      }
    }
  }

   void compareloginpin() async{
    try {
      var Storage = GetStorage(Constants.VMENU_REPORTS);
      var loginpin=Storage.read("loginpin");
 var responce=await ReportsProvider().Decrypt_loginpin(jsondata:{"data":loginpin.toString()});
       validation_pin=responce['message']['decripted_data'];
   if(validation_pin==txt_verification_pinno_controller.text){
        Get.toNamed(Routes.REPORTS);
   }
   else{
    Constants.SnakeBarshow(title: "Warning",subtitle: "Mismatched Pin Number. Try Again",tost_type: Toast_types.ERROR);
   } 
  Get.toNamed(Routes.REPORTS);
    } catch (e) {
     Constants.SnakeBarshow(title: "Warning",subtitle: "Mismatched Pin Number. Try Again",tost_type: Toast_types.ERROR);
    }
      
      // Get.back();
  }

    pinvalidator({String? value}){

  
    }
}
