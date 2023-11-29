import 'package:get/get.dart';
import 'package:vmenu_reports/WidgetPlugin/PieChart/model_pie_chart_model.dart';
import 'package:vmenu_reports/WidgetPlugin/PieChart/piechart.view.dart';


class piechartcontroller extends GetxController{
 static var model_piechart=Rxn<ModelPieChart>();
 static var touchedIndex = 100.obs;
 static  Getdata({required ModelPieChart modelpichart}){
   model_piechart.value=modelpichart;
   print(model_piechart.toJson());
   return  Piechart_widget();
   
 }
}