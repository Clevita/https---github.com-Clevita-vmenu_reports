// ideal data need for graphchart1 eg is provided below the class 
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vmenu_reports/WidgetPlugin/GraphChart/graphchart_controller.dart';



class grapgchartwidget extends GetView {
  @override
  Widget build(BuildContext context) {
    return Graphchartwidget();
  }
}

Graphchartwidget() {
  return Stack(
    children: <Widget>[
      AspectRatio(
          aspectRatio: 2.0,
          child: Obx(() => Padding(
                padding: EdgeInsets.all(20),
                child: LineChart(
                 graphchart_controller.showAvg.value ? avgData() : mainData(),
                ),
              ))
          ),
      SizedBox(
        width: 60,
        height: 34,
        child: TextButton(
          onPressed: () {
            graphchart_controller.showAvg.value = !graphchart_controller.showAvg.value;
          },
          child: Obx(() => Text(
                graphchart_controller
                    .model_graphchart1.value!.linechartdata!.lefttileTitle
                    .toString(),
                style: TextStyle(
                  fontSize: graphchart_controller.model_graphchart1.value!
                      .linechartdata!.lefttiletitleFontsize,
                  color: graphchart_controller.showAvg.value
                      ? Colors.white.withOpacity(0.5)
                      : Colors.white,
                ),
              )),
        ),
      ),
    ],
  );
}

// Widget bottomTitleWidgets(double value, TitleMeta meta) {
//   var style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: graphchart_controller.model_graphchart1.value!.linechartdata!
//           .bottomtilenamesProperty!.fontsize,
//       color: Colors.white);
//   Widget text;
  
//   int intValue = value.toInt();
//    print(intValue);
//       listintvalue.add(intValue);
// //       // if(listintvalue.length==linechart_controller.months!.length){
//         if (intValue == graphchart_controller.months![0]) {
//   text = Text(graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtileNames![0].names.toString(), style: style);
// } else if (intValue == graphchart_controller.months![1]) {
//   text = Text(graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtileNames![1].names.toString(), style: style);
// } else if (intValue == graphchart_controller.months![2]) {
//   text = Text(graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtileNames![2].names.toString(), style: style);
// }
// else if (intValue == graphchart_controller.months![3]) {
//   text = Text(graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtileNames![3].names.toString(), style: style);
// }
//  else {
//   text = Text('', style: style);
// }
  

//   // switch (value.toInt()) {
//   //   case 0:
//   //     text = Text('MAR', style: style);
//   //     break;
//   //   case 5:
//   //     text = Text('JUN', style: style);
//   //     break;
//   //   case 8:
//   //     text = Text('SEP', style: style);
//   //     break;
//   //   default:
//   //     text = Text('', style: style);
//   //     break;
//   // }

//   return SideTitleWidget(
//     axisSide: meta.axisSide,
//     child: text,
//   );
// }

// Widget leftTitleWidgets(double value, TitleMeta meta) {
//   var style =
//       TextStyle(fontWeight: FontWeight.bold, fontSize: graphchart_controller.model_graphchart1.value!.linechartdata!.lefttilenamesProperty!.fontsize!.toDouble(), color: Colors.white);
//   String text;
//   int num;
//   if(value.toInt()==graphchart_controller.leftsidename[0]){
//      text=graphchart_controller.model_graphchart1.value!.linechartdata!.lefttileNames![0].names.toString();
//   }else if(value.toInt()==graphchart_controller.leftsidename[1]){
//     text=graphchart_controller.model_graphchart1.value!.linechartdata!.lefttileNames![1].names.toString();
//   }
//   else{
//     text="";
//   }
//   // switch (value.toInt()) {
//   //   case 1:
//   //     text = '10K';
//   //     break;
//   //   case 3:
//   //     text = '30k';
//   //     break;
//   //   case 5:
//   //     text = '50k';
//   //     break;
//   //   default:
//   //     return Container();
//   // }

//   return Text(text, style: style, textAlign: TextAlign.left);
// }

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: graphchart_controller
          .model_graphchart1.value!.linechartdata!.flgriddata!.showLines,
      drawHorizontalLine: graphchart_controller.model_graphchart1.value!
          .linechartdata!.flgriddata!.showHorizontallines,
      drawVerticalLine: graphchart_controller
          .model_graphchart1.value!.linechartdata!.flgriddata!.showVerticlelines,
      horizontalInterval: graphchart_controller.model_graphchart1.value!
          .linechartdata!.flgriddata!.horizontallineInterval!
          .toDouble(),
      verticalInterval: graphchart_controller.model_graphchart1.value!
          .linechartdata!.flgriddata!.verticlelineInterval!
          .toDouble(),
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: Colors.grey.withOpacity(0.3),
          strokeWidth: 2,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.grey.withOpacity(0.3),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles:AxisTitles(
                    sideTitles: SideTitles(
                      showTitles:graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.showtilename,
                      reservedSize: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.reservedsize!.toDouble(),
                      interval: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.interval!.toDouble(),
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return  graphchart_controller.finalbottomtiles[value.toInt()] != null
                            ? SideTitleWidget(
                                axisSide: meta.axisSide,
                                space: 2,
                                child: Text(
                                    graphchart_controller.finalbottomtiles[value.toInt()].toString(),
                                    style: TextStyle(
                                        fontSize: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.fontsize,
                                        color: colorFromHex(graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.color.toString()))),
                              )
                            : const SizedBox();
                      },
                    ),
                  ),
      //  AxisTitles(
      //   sideTitles: SideTitles(
      //     showTitles: graphchart_controller.model_graphchart1.value!.linechartdata!
      //         .bottomtilenamesProperty!.showtilename,
      //     reservedSize: graphchart_controller.model_graphchart1.value!
      //         .linechartdata!.bottomtilenamesProperty!.reservedsize!
      //         .toDouble(),
      //     interval: graphchart_controller.model_graphchart1.value!.linechartdata!
      //         .bottomtilenamesProperty!.interval!
      //         .toDouble(),
      //     getTitlesWidget: bottomTitleWidgets,
      //   ),
      // ),
      leftTitles: 
       AxisTitles(
                    sideTitles: SideTitles(
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return graphchart_controller.finalleftnames[value.toInt()] != null
                            ? Text(
                              graphchart_controller.finalleftnames[value.toInt()].toString(),
                                style: TextStyle(
                                    fontSize:
                                        graphchart_controller.model_graphchart1.value!.linechartdata!.lefttilenamesProperty!.fontsize,
                                    color: colorFromHex(graphchart_controller.model_graphchart1.value!.linechartdata!.lefttilenamesProperty!.color!)))
                            : const SizedBox();
                      },
                      showTitles: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.showtilename,
                      interval: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.interval!.toDouble(),
                      reservedSize: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.reservedsize!.toDouble(),
                    ),
                  ),
      // AxisTitles(
      //   sideTitles: SideTitles(
      //     showTitles: graphchart_controller.model_graphchart1.value!.linechartdata!
      //         .lefttilenamesProperty!.showtilename,
      //     interval: graphchart_controller.model_graphchart1.value!.linechartdata!
      //         .lefttilenamesProperty!.interval!
      //         .toDouble(),
      //     getTitlesWidget: leftTitleWidgets,
      //     reservedSize: graphchart_controller.model_graphchart1.value!
      //         .linechartdata!.lefttilenamesProperty!.reservedsize!
      //         .toDouble(),
      //   ),
      // ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: graphchart_controller
        .model_graphchart1.value!.linechartdata!.flgriddata!.minX!
        .toDouble(),
    maxX: graphchart_controller
        .model_graphchart1.value!.linechartdata!.flgriddata!.maxX!
        .toDouble(),
    minY: graphchart_controller
        .model_graphchart1.value!.linechartdata!.flgriddata!.minY!
        .toDouble(),
    maxY: graphchart_controller
        .model_graphchart1.value!.linechartdata!.flgriddata!.maxY!
        .toDouble(),
    lineBarsData: [
      LineChartBarData(
        spots: [
          for(var a in graphchart_controller.model_graphchart1.value!.linechartdata!
                  .flgriddata!.linechartbardata!)
                  FlSpot(a.spot1!.toDouble(), a.spot2!.toDouble())
         
        ],
        isCurved: graphchart_controller
            .model_graphchart1.value!.linechartdata!.flgriddata!.isCurved,
        gradient: LinearGradient(
          colors:graphchart_controller.gradientColors,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
               graphchart_controller.gradientColors.map((color) => color.withOpacity(0.15)).toList(),
          ),
        ),
      ),
    ],
  );
}

LineChartData avgData() {
  return LineChartData(
    lineTouchData: LineTouchData(enabled: false),
    gridData: FlGridData(
      show: graphchart_controller
          .model_graphchart1.value!.linechartdata!.flgriddata!.showLines,
      drawHorizontalLine: graphchart_controller.model_graphchart1.value!
          .linechartdata!.flgriddata!.showHorizontallines,
      verticalInterval: graphchart_controller.model_graphchart1.value!
          .linechartdata!.flgriddata!.verticlelineInterval!
          .toDouble(),
      horizontalInterval: graphchart_controller.model_graphchart1.value!
          .linechartdata!.flgriddata!.horizontallineInterval!
          .toDouble(),
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles:graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.showtilename,
                      reservedSize: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.reservedsize!.toDouble(),
                      interval: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.interval!.toDouble(),
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return  graphchart_controller.finalbottomtiles[value.toInt()] != null
                            ? SideTitleWidget(
                                axisSide: meta.axisSide,
                                space: 2,
                                child: Text(
                                    graphchart_controller.finalbottomtiles[value.toInt()].toString(),
                                    style: TextStyle(
                                        fontSize: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.fontsize,
                                        color: colorFromHex(graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.color.toString()))),
                              )
                            : const SizedBox();
                      },
                    ),
                  ),
      // AxisTitles(
      //   sideTitles: SideTitles(
      //     showTitles: graphchart_controller.model_graphchart1.value!.linechartdata!
      //         .bottomtilenamesProperty!.showtilename,
      //     reservedSize: graphchart_controller.model_graphchart1.value!
      //         .linechartdata!.bottomtilenamesProperty!.reservedsize!
      //         .toDouble(),
      //     getTitlesWidget: bottomTitleWidgets,
      //     interval: graphchart_controller.model_graphchart1.value!.linechartdata!
      //         .bottomtilenamesProperty!.interval!
      //         .toDouble(),
      //   ),
      // ),
      leftTitles:  AxisTitles(
                    sideTitles: SideTitles(
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return graphchart_controller.finalleftnames[value.toInt()] != null
                            ? Text(
                              graphchart_controller.finalleftnames[value.toInt()].toString(),
                                style: TextStyle(
                                    fontSize:
                                        graphchart_controller.model_graphchart1.value!.linechartdata!.lefttilenamesProperty!.fontsize,
                                    color: colorFromHex(graphchart_controller.model_graphchart1.value!.linechartdata!.lefttilenamesProperty!.color!)))
                            : const SizedBox();
                      },
                      showTitles: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.showtilename,
                      interval: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.interval!.toDouble(),
                      reservedSize: graphchart_controller.model_graphchart1.value!.linechartdata!.bottomtilenamesProperty!.reservedsize!.toDouble(),
                    ),
                  ),
      //  AxisTitles(
      //   sideTitles: SideTitles(
      //     showTitles: graphchart_controller.model_graphchart1.value!.linechartdata!
      //         .lefttilenamesProperty!.showtilename,
      //     getTitlesWidget: leftTitleWidgets,
      //     reservedSize: graphchart_controller.model_graphchart1.value!
      //         .linechartdata!.lefttilenamesProperty!.reservedsize!
      //         .toDouble(),
      //     interval: graphchart_controller.model_graphchart1.value!.linechartdata!
      //         .lefttilenamesProperty!.interval!
      //         .toDouble(),
      //   ),
      // ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: graphchart_controller
        .model_graphchart1.value!.linechartdata!.flgriddata!.minX!
        .toDouble(),
    maxX: graphchart_controller
        .model_graphchart1.value!.linechartdata!.flgriddata!.maxX!
        .toDouble(),
    minY: graphchart_controller
        .model_graphchart1.value!.linechartdata!.flgriddata!.minY!
        .toDouble(),
    maxY: graphchart_controller
        .model_graphchart1.value!.linechartdata!.flgriddata!.maxY!
        .toDouble(),
    lineBarsData: [
      LineChartBarData(
        spots: [

        for(var a in graphchart_controller.model_graphchart1.value!.linechartdata!
                  .flgriddata!.linechartbardata!)
                  FlSpot(a.spot1!.toDouble(), a.spot2!.toDouble())
        ],
        isCurved: true,
        gradient: LinearGradient(
          colors: [
            ColorTween(begin:  graphchart_controller.gradientColors[0], end:  graphchart_controller.gradientColors[1])
                .lerp(0.2)!,
            ColorTween(begin: graphchart_controller.gradientColors[0], end:  graphchart_controller.gradientColors[1])
                .lerp(0.2)!,
          ],
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin:  graphchart_controller.gradientColors[0], end:  graphchart_controller.gradientColors[1])
                  .lerp(0.2)!
                  .withOpacity(0.1),
              ColorTween(begin:  graphchart_controller.gradientColors[0], end:  graphchart_controller.gradientColors[1])
                  .lerp(0.2)!
                  .withOpacity(0.1),
            ],
          ),
        ),
      ),
    ],
  );
}

        //  graphchart_controller.Getdata(
        //             modellinechart: ModelGraphChart(
        //                 linechartdata: Linechartdata(
        //                     lefttileTitle: "AVG",
        //                     lefttiletitleFontsize: 14.0,
        //                     gradientcolors: [
        //                       Gradientcolors(color: "0xff1458E1"),
        //                       Gradientcolors(color: "0xffF9443A"),
        //                       Gradientcolors(color: "0xff1458E1"),
        //                       Gradientcolors(color: "0xffF9443A")
        //                     ],
        //                     bottomtileNames: [
        //                       BottomtileNames(number: 0, names: "jan"),
        //                       BottomtileNames(number: 1, names: "feb"),
        //                       BottomtileNames(number: 2, names: "march"),
        //                       BottomtileNames(number: 3, names: "april"),
        //                       BottomtileNames(number: 4, names: "may"),
        //                       BottomtileNames(number: 5, names: "june"),
        //                        BottomtileNames(number: 6, names: "july"),
        //                         BottomtileNames(number: 7, names: "august"),
        //                          BottomtileNames(number: 8, names: "sept"),
        //                           BottomtileNames(number: 9, names: "oct")
        //                     ],
        //                     bottomtilenamesProperty: BottomtilenamesProperty(
        //                         color: "#FFFFFF",
        //                         fontsize: 12,
        //                         interval: 1,
        //                         reservedsize: 24,
        //                         showtilename: true),
        //                     lefttileNames: [
        //                      BottomtileNames(number: 0, names: "10k"),
        //                       BottomtileNames(number: 2, names: "20k"),
        //                       BottomtileNames(number: 4, names: "40k"),
        //                       BottomtileNames(number: 6, names: "60k"),
        //                       BottomtileNames(number: 8, names: "80k"),
        //                       BottomtileNames(number: 9, names: "90k"),
        //                     ],
        //                     lefttilenamesProperty: BottomtilenamesProperty(
        //                         color: "#FFFFFF",
        //                         fontsize: 12.0,
        //                         interval: 1,
        //                         reservedsize: 24,
        //                         showtilename: true),
        //                     flgriddata: Flgriddata(
        //                         dotdata: false,
        //                         horizontallineInterval: 1,
        //                         isCurved: true,
        //                         maxX: 8,
        //                         minX: 0,
        //                         maxY: 10,
        //                         minY: 0,
        //                         showHorizontallines: true,
        //                         showVerticlelines: true,
        //                         showLines: true,
        //                         verticlelineInterval: 1,
        //                         linechartbardata: [
        //                           Linechartbardata(spot1: 0, spot2: 1),
        //                           Linechartbardata(spot1: 1, spot2: 9),
        //                           Linechartbardata(spot1: 2, spot2: 9),
        //                           Linechartbardata(spot1: 3, spot2: 2),
        //                           Linechartbardata(spot1: 3, spot2: 4),
        //                           Linechartbardata(spot1: 4, spot2: 2),
        //                           Linechartbardata(spot1: 5, spot2: 3)
        //                         ]))))