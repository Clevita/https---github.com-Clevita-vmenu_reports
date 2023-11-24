// ignore_for_file: prefer_const_constructors
// ideal data need for piechart eg is provided below the class as comment(line:220)
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:vmenu_reports/Colours.dart';
import 'package:vmenu_reports/Fonts.dart';
import 'package:vmenu_reports/WidgetPlugin/PieChart/model_pie_chart_model.dart';
import 'package:vmenu_reports/WidgetPlugin/PieChart/piechartcontroller.dart';

class Piechart_widget extends GetView {
  @override
  Widget build(BuildContext context) {
    return piechart();
  }
}

piechart() {
  return Stack(
    alignment: Alignment.center,
    children: [
      const PieChartWidget(),
      Container(
        width:
            piechartcontroller.model_piechart.value!.widgetData!.piechartRadius!+50,
        height:
            piechartcontroller.model_piechart.value!.widgetData!.piechartRadius!+50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.0,
            color: Colors.grey.withOpacity(0.35),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              piechartcontroller.model_piechart.value!.widgetData!.title
                  .toString(),
              style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
                  color: ColorsApp.COLOR_PRIMARY_TEXT,
                  fontSize: piechartcontroller
                      .model_piechart.value!.widgetData!.titleFontsize,
                  fontFamily: Fonts.font_Montserrat),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  piechartcontroller
                      .model_piechart.value!.widgetData!.percentage
                      .toString(),
                  style: TextStyle(
                    color: ColorsApp.COLOR_PRIMARY_TEXT,
                    fontSize: piechartcontroller
                        .model_piechart.value!.widgetData!.percentageFontsize,
                    fontFamily: Fonts.font_Montserrat,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.001,
                ),
                Text(
                  '%',
                  style: Theme.of(Get.context!)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black87, fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 3.0,
                ),
                SizedBox(
                  width: Get.width * 0.004,
                ),
                Text(
                  piechartcontroller.model_piechart.value!.widgetData!.subtitle
                      .toString(),
                  style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                      fontSize: piechartcontroller
                          .model_piechart.value!.widgetData!.subtitleFontsize,
                      fontFamily: Fonts.font_Montserrat),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 1,
            centerSpaceRadius: piechartcontroller
                .model_piechart.value!.widgetData!.piechartRadius,
            sections: showingSections(
                piechartsectionlist: piechartcontroller
                    .model_piechart.value!.widgetData!.pichartSectionlist!),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      {required List<PichartSectionlist>? piechartsectionlist}) {
    return List.generate(piechartsectionlist!.length, (i) {
      final isTouched = i == touchedIndex;
      // final radius = isTouched ? 30.0 : 20.0;
      final radius = isTouched
          ? piechartsectionlist[i].touchedRadius
          : piechartsectionlist[i].radius;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: colorFromHex(piechartsectionlist[0].color!),
            value: piechartsectionlist[0].value!.toDouble(),
             titleStyle: TextStyle(color: colorFromHex(piechartsectionlist[0].valueColor!,),fontWeight: FontWeight.bold),
            radius: radius,
            showTitle: piechartsectionlist[0].showtitle!,
            borderSide: BorderSide(
                width: piechartsectionlist[0].borderside!.width!,
                color: Colors.black26),
          );
        case 1:
          return PieChartSectionData(
            color: colorFromHex(piechartsectionlist[1].color!),
            value: piechartsectionlist[1].value!.toDouble(),
            titleStyle: TextStyle(color: colorFromHex(piechartsectionlist[1].valueColor!),fontWeight: FontWeight.bold),
            radius: radius,
            showTitle: piechartsectionlist[1].showtitle!,
            borderSide: BorderSide(
                width: piechartsectionlist[1].borderside!.width!,
                color: Colors.black26),
          );
        case 2:
          return PieChartSectionData(
            color: colorFromHex(piechartsectionlist[2].color!),
            value: piechartsectionlist[2].value!.toDouble(),
             titleStyle: TextStyle(color:  colorFromHex(piechartsectionlist[2].valueColor!),fontWeight: FontWeight.bold),
            radius: radius,
            showTitle: piechartsectionlist[2].showtitle!,
            borderSide: BorderSide(
                width: piechartsectionlist[2].borderside!.width!,
                color: Colors.black26),
          );
        case 3:
          return PieChartSectionData(
            color: colorFromHex(piechartsectionlist[3].color!),
            value: piechartsectionlist[3].value!.toDouble(),
             titleStyle: TextStyle(color:  colorFromHex(piechartsectionlist[3].valueColor!),fontWeight: FontWeight.bold),
            radius: radius,
            showTitle: piechartsectionlist[3].showtitle,
            borderSide: BorderSide(
                width: piechartsectionlist[3].borderside!.width!,
                color: Colors.black26),
          );
        default:
          throw Error();
      }
    });
  }
}

//////////  the examble data needed for piechart.......
///
 //      piechartcontroller.Getdata(
        //         modelpichart: ModelPieChart(
        //             widgetData: WidgetData(
        //                 title: "Office",
        //                 titleFontsize: 14.0,
        //                 subtitle: "good",
        //                 subtitleFontsize: 10.0,
        //                 percentage: "70",
        //                 percentageFontsize: 16.0,
        //                 piechartRadius: 100.0,
        //                 pichartSectionlist: [
        //   PichartSectionlist(
        //       color: "#006400",
        //       radius: 25.0,
        //       touchedRadius: 35.0,
        //       showtitle: true,
        //       value: 10,
        //       valueColor:"#FFFFFF" ,
        //       borderside: Borderside(color: "0xFFFF3EF4", width: 4.0)), PichartSectionlist(
        //       color: "FF0000",
        //       radius: 25.0,
        //       touchedRadius: 35.0,
        //       showtitle: true,
        //       value: 50,
        //       valueColor: "#FFFFFF",
        //       borderside: Borderside(color: "0xFFFF3EF4", width: 4.0)), PichartSectionlist(
        //       color: "#00008B",
        //       radius: 25.0,
        //       touchedRadius: 35.0,
        //       showtitle: true,
        //       value: 20,
        //       valueColor: "#FFFFFF",
        //       borderside: Borderside(color: "0xFFFF3EF4", width: 4.0)), PichartSectionlist(
        //       color: "#FFFF00",
        //       radius: 25.0,
        //       touchedRadius: 35.0,
        //       showtitle: true,
        //       value: 20,
        //       valueColor: "#000000",
        //       borderside: Borderside(color: "0xFFFF3EF4", width: 4.0))
        // ])))