import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:vmenu_reports/WidgetPlugin/GraphChart/graphchart2_view.dart';
import 'package:vmenu_reports/WidgetPlugin/GraphChart/graphchart_view.dart';
import 'package:vmenu_reports/WidgetPlugin/GraphChart/model_graph_chart_model.dart';



class graphchart_controller extends GetxController {
  static var model_graphchart1 = Rxn<ModelGraphChart>();
  // static List<int>? months;
  // static var leftsidename = [];
 static var showAvg = false.obs;
    static var finalbottomtiles={};
    static var finalleftnames={};
   static List<Color> gradientColors = [];
  static Getdata({required ModelGraphChart modellinechart}) {
    // String text;
    // int num;
    model_graphchart1.value = modellinechart;
    print(model_graphchart1.toJson());
    // months = getMonthNumbersanddays(model_graphchart1.value!);

    // for (var i in graphchart_controller
    //     .model_graphchart1.value!.linechartdata!.lefttileNames!) {
    //   String input = i.names!;
    //   int result = int.parse(input.replaceAll(RegExp(r'[^\d]'), '')) ~/ 10;
    //   print(result);
    //   leftsidename.add(result);
    // }
    for(var a in model_graphchart1.value!.linechartdata!.gradientcolors!){
   gradientColors.add(Color(int.parse(a.color!)));
    }
print(gradientColors);
       for (var i in graphchart_controller
        .model_graphchart1.value!.linechartdata!.bottomtileNames!) {
      finalbottomtiles[i.number] = i.names;
    }
    print(finalbottomtiles);
     for (var i in graphchart_controller
        .model_graphchart1.value!.linechartdata!.lefttileNames!) {
      finalleftnames[i.number] = i.names;
    }
    print(finalleftnames);

    return grapgchartwidget();
  }

  // static List<int> getMonthNumbersanddays(ModelGraphChart modellinechart) {
  //   List<int> monthNumbers = [];
  //   int daynumber;
  //   for (var item in modellinechart.linechartdata!.bottomtileNames!) {
  //     String monthName = item.names ?? "";
  //     // monthname.add(item.names!);
  //     String firstThreeLetters = monthName.substring(0, 3).toLowerCase();
  //     int monthNumber = monthToNumber(firstThreeLetters);
  //     if (monthNumber == -1) {
  //       String firstThreeLetters = monthName.substring(0, 3).toLowerCase();
  //       daynumber = daytonumber(firstThreeLetters);
  //       monthNumbers.add(daynumber);
  //     } else {
  //       monthNumbers.add(monthNumber);
  //     }
  //   }
  //   return monthNumbers;
  // }

  // static int monthToNumber(String monthName) {
  //   Map<String, int> monthMapping = {
  //     "jan": 1,
  //     "feb": 2,
  //     "mar": 3,
  //     "apr": 4,
  //     "may": 5,
  //     "jun": 6,
  //     "jul": 7,
  //     "aug": 8,
  //     "sep": 9,
  //     "oct": 10,
  //     "nov": 11,
  //     "dec": 12
  //   };
  //   return monthMapping[monthName.toLowerCase()] ??
  //       -1; // Return -1 for invalid month
  // }

  // static int daytonumber(String dayname) {
  //   Map<String, int> dayMapping = {
  //     "sun": 1,
  //     "mon": 2,
  //     "tue": 3,
  //     "wed": 4,
  //     "thu": 5,
  //     "fri": 6,
  //     "sat": 7,
  //   };
  //   return dayMapping[dayname.toLowerCase()] ??
  //       -1; // Return -1 for invalid month
  // }
}




