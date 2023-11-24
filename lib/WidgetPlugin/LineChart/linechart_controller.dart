import 'package:get/get.dart';
import 'package:vmenu_reports/WidgetPlugin/LineChart/linechart_view.dart';
import 'package:vmenu_reports/WidgetPlugin/LineChart/model_linechart_model.dart';

class linechart_controller extends GetxController{
   static var model_linechart=Rxn<ModelLinechart>();
static List<int>? months;
static var leftsidename=[];
static  Getdata({required ModelLinechart modellinechart}){
  String text;
  int num;
   model_linechart.value=modellinechart;
   print(model_linechart.toJson());
 months = getMonthNumbers(model_linechart.value!);

for(var i in linechart_controller.model_linechart.value!.linechartdata!.lefttileNames!){
 String input = i.names!;
  int result = int.parse(input.replaceAll(RegExp(r'[^\d]'), '')) ~/ 10;
  print(result); 
  leftsidename.add(result);
}
   return  LineChartWidget().build(Get.context!);
   
 }
 static List<int> getMonthNumbers(ModelLinechart modellinechart) {
  List<int> monthNumbers = [];
  for (var item in modellinechart.linechartdata!.bottomtileNames!) {
    String monthName = item.names?? "";
    // monthname.add(item.names!);
    String firstThreeLetters = monthName.substring(0, 3).toLowerCase();
    int monthNumber = monthToNumber(firstThreeLetters);
    monthNumbers.add(monthNumber);
  }
  return monthNumbers;
}
static int monthToNumber(String monthName) {
  Map<String, int> monthMapping = {
    "jan": 1,
    "feb": 2,
    "mar": 3,
    "apr": 4,
    "may": 5,
    "jun": 6,
    "jul": 7,
    "aug": 8,
    "sep": 9,
    "oct": 10,
    "nov": 11,
    "dec": 12
  };
  return monthMapping[monthName.toLowerCase()] ?? -1; // Return -1 for invalid month
}
}