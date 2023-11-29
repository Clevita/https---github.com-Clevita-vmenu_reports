// ideal data need for graphchart2 eg is provided below the class 
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:vmenu_reports/WidgetPlugin/GraphChart/graphchart2_controller.dart';

class graphchart2 extends GetView {
  graphchart2({super.key});

 

  @override
  Widget build(BuildContext context) {
    return 
          AspectRatio(
            aspectRatio: 2,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                ),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles:graphcard2_controller.model_graphchart2.value!.linechartdata!.bottomtilenamesProperty!.showtilename,
                      reservedSize: graphcard2_controller.model_graphchart2.value!.linechartdata!.bottomtilenamesProperty!.reservedsize!.toDouble(),
                      interval: graphcard2_controller.model_graphchart2.value!.linechartdata!.bottomtilenamesProperty!.interval!.toDouble(),
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return  graphcard2_controller.finalbottomtiles[value.toInt()] != null
                            ? SideTitleWidget(
                                axisSide: meta.axisSide,
                                space: 2,
                                child: Text(
                                    graphcard2_controller.finalbottomtiles[value.toInt()].toString(),
                                    style: TextStyle(
                                        fontSize: graphcard2_controller.model_graphchart2.value!.linechartdata!.bottomtilenamesProperty!.fontsize,
                                        color: colorFromHex(graphcard2_controller.model_graphchart2.value!.linechartdata!.bottomtilenamesProperty!.color.toString()))),
                              )
                            : const SizedBox();
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return graphcard2_controller.finalleftnames[value.toInt()] != null
                            ? Text(
                              graphcard2_controller.finalleftnames[value.toInt()].toString(),
                                style: TextStyle(
                                    fontSize:
                                        graphcard2_controller.model_graphchart2.value!.linechartdata!.lefttilenamesProperty!.fontsize,
                                    color: colorFromHex(graphcard2_controller.model_graphchart2.value!.linechartdata!.lefttilenamesProperty!.color!)))
                            : const SizedBox();
                      },
                      showTitles: graphcard2_controller.model_graphchart2.value!.linechartdata!.bottomtilenamesProperty!.showtilename,
                      interval: graphcard2_controller.model_graphchart2.value!.linechartdata!.bottomtilenamesProperty!.interval!.toDouble(),
                      reservedSize: graphcard2_controller.model_graphchart2.value!.linechartdata!.bottomtilenamesProperty!.reservedsize!.toDouble(),
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                      isCurved:graphcard2_controller.model_graphchart2.value!.linechartdata!.flgriddata!.isCurved,
                      curveSmoothness: 0,
                      color: Theme.of(context).primaryColor,
                      barWidth: 2.5,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(0.5),
                            Colors.transparent
                          ],
                        ),
                        show: true,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                      dotData: FlDotData(show: graphcard2_controller.model_graphchart2.value!.linechartdata!.flgriddata!.dotdata),
                      spots: [
                        for(var a in graphcard2_controller.model_graphchart2.value!.linechartdata!.flgriddata!.linechartbardata! )
                        FlSpot(a.spot1!.toDouble(), a.spot2!.toDouble())
                     ])
                ],
                minX: graphcard2_controller.model_graphchart2.value!.linechartdata!.flgriddata!.minX!.toDouble(),
                maxX: graphcard2_controller.model_graphchart2.value!.linechartdata!.flgriddata!.maxX!.toDouble(),
                maxY:  graphcard2_controller.model_graphchart2.value!.linechartdata!.flgriddata!.maxY!.toDouble(),
                minY:  graphcard2_controller.model_graphchart2.value!.linechartdata!.flgriddata!.minY!.toDouble(),
              ),
              swapAnimationDuration: const Duration(milliseconds: 250),
            ),);
          
        
    
  }
}
  // graphcard2_controller.Getdata(
  //                   modellinechart: ModelGraphChart(
  //                       linechartdata: Linechartdata(
  //                           lefttileTitle: "AVG",
  //                           lefttiletitleFontsize: 14.0,
  //                           gradientcolors: [
  //                             Gradientcolors(color: "0xff1458E1"),
  //                             Gradientcolors(color: "0xffF9443A"),
  //                             Gradientcolors(color: "0xff1458E1"),
  //                             Gradientcolors(color: "0xffF9443A")
  //                           ],
  //                           bottomtileNames: [
  //                             BottomtileNames(number: 0, names: "jan"),
  //                             BottomtileNames(number: 1, names: "feb"),
  //                             BottomtileNames(number: 2, names: "march"),
  //                             BottomtileNames(number: 3, names: "april"),
  //                             BottomtileNames(number: 4, names: "may"),
  //                             BottomtileNames(number: 5, names: "june"),
  //                              BottomtileNames(number: 6, names: "july"),
  //                               BottomtileNames(number: 7, names: "august"),
  //                                BottomtileNames(number: 8, names: "sept"),
  //                                 BottomtileNames(number: 9, names: "oct")
  //                           ],
  //                           bottomtilenamesProperty: BottomtilenamesProperty(
  //                               color: "#FFFFFF",
  //                               fontsize: 12,
  //                               interval: 1,
  //                               reservedsize: 24,
  //                               showtilename: true),
  //                           lefttileNames: [
  //                            BottomtileNames(number: 0, names: "10k"),
  //                             BottomtileNames(number: 2, names: "20k"),
  //                             BottomtileNames(number: 4, names: "40k"),
  //                             BottomtileNames(number: 6, names: "60k"),
  //                             BottomtileNames(number: 8, names: "80k"),
  //                             BottomtileNames(number: 9, names: "90k"),
  //                           ],
  //                           lefttilenamesProperty: BottomtilenamesProperty(
  //                               color: "#FFFFFF",
  //                               fontsize: 12.0,
  //                               interval: 1,
  //                               reservedsize: 24,
  //                               showtilename: true),
  //                           flgriddata: Flgriddata(
  //                               dotdata: false,
  //                               horizontallineInterval: 1,
  //                               isCurved: true,
  //                               maxX: 8,
  //                               minX: 0,
  //                               maxY: 10,
  //                               minY: 0,
  //                               showHorizontallines: true,
  //                               showVerticlelines: true,
  //                               showLines: true,
  //                               verticlelineInterval: 1,
  //                               linechartbardata: [
  //                                 Linechartbardata(spot1: 0, spot2: 1),
  //                                 Linechartbardata(spot1: 1, spot2: 9),
  //                                 Linechartbardata(spot1: 2, spot2: 9),
  //                                 Linechartbardata(spot1: 3, spot2: 2),
  //                                 Linechartbardata(spot1: 3, spot2: 4),
  //                                 Linechartbardata(spot1: 4, spot2: 2),
  //                                 Linechartbardata(spot1: 5, spot2: 3)
  //                               ]))))