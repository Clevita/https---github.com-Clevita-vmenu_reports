
import 'package:get/get.dart';
import 'package:vmenu_reports/WidgetPlugin/Cardchart1/cardchart1_view.dart';
import 'package:vmenu_reports/WidgetPlugin/Cardchart1/model_cardchart_model.dart';

class cardchart1_controller extends GetxController{

   static var model_cardchart=Rxn<ModelCardchart>();
 static var  show_incrementdecrement = true.obs;
 static  Getdata({required ModelCardchart modelcardchart}){
   model_cardchart.value=modelcardchart;
   print(model_cardchart.toJson());
   return  cardchart1().build(Get.context!);
   
 }
}