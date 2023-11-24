import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vmenu_reports/WidgetPlugin/LineChart/linechart_controller.dart';

// const Color primaryColor = Color(0xffF9443A);
// const Color secondPrimaryColor = Color(0xffFA5F31);
// const Color darkBlack = Color(0xff0A0A0A);
// const Color lightBlack = Color(0xff121212);
// const Color darkGrey = Colors.grey;
// const Color blue = Color(0xff1458E1);
// const Color royalFuchsia = Color(0xffC72396);
// const Color promiscuousPink = Color(0xffB111F1);
// const Color darkYellow = Color(0xffCB915D);
// const Color chocolateMelange = Color(0xff311302);
// List<Color> gradientColors = [
//   royalFuchsia,
//   primaryColor,
//   royalFuchsia,
//   primaryColor,
// ];
// const Color Color1 = Color();
const Color Color2 = Color(0xff1458E1);
const Color Color3 = Color(0xffFA5F31);
const Color Color4 = Color(0xff1458E1);
List<Color> gradientColors = [
  // Color1,
  Color2,
  Color3,
  Color4,
];
var listintvalue = [];
var showAvg = false.obs;

class LineChartWidget extends GetView {
  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors;
    return Linechartwidget();
  }
}

Linechartwidget() {
  return Stack(
    children: <Widget>[
      AspectRatio(
          aspectRatio: 2.0,
          child: Obx(() => Padding(
                padding: EdgeInsets.all(20),
                child: LineChart(
                  showAvg.value ? avgData() : mainData(),
                ),
              ))
          ),
      SizedBox(
        width: 60,
        height: 34,
        child: TextButton(
          onPressed: () {
            showAvg.value = !showAvg.value;
          },
          child: Obx(() => Text(
                linechart_controller
                    .model_linechart.value!.linechartdata!.lefttileTitle
                    .toString(),
                style: TextStyle(
                  fontSize: linechart_controller.model_linechart.value!
                      .linechartdata!.lefttiletitleFontsize,
                  color: showAvg.value
                      ? Colors.white.withOpacity(0.5)
                      : Colors.white,
                ),
              )),
        ),
      ),
    ],
  );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  var style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: linechart_controller.model_linechart.value!.linechartdata!
          .bottomtilenamesProperty!.fontsize,
      color: Colors.white);
  Widget text;
  
  int intValue = value.toInt();
   print(intValue);
      listintvalue.add(intValue);
//       // if(listintvalue.length==linechart_controller.months!.length){
        if (intValue == linechart_controller.months![0]) {
  text = Text(linechart_controller.model_linechart.value!.linechartdata!.bottomtileNames![0].names.toString(), style: style);
} else if (intValue == linechart_controller.months![1]) {
  text = Text(linechart_controller.model_linechart.value!.linechartdata!.bottomtileNames![1].names.toString(), style: style);
} else if (intValue == linechart_controller.months![2]) {
  text = Text(linechart_controller.model_linechart.value!.linechartdata!.bottomtileNames![2].names.toString(), style: style);
}
else if (intValue == linechart_controller.months![3]) {
  text = Text(linechart_controller.model_linechart.value!.linechartdata!.bottomtileNames![3].names.toString(), style: style);
}
 else {
  text = Text('', style: style);
}
  

  // switch (value.toInt()) {
  //   case 0:
  //     text = Text('MAR', style: style);
  //     break;
  //   case 5:
  //     text = Text('JUN', style: style);
  //     break;
  //   case 8:
  //     text = Text('SEP', style: style);
  //     break;
  //   default:
  //     text = Text('', style: style);
  //     break;
  // }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  var style =
      TextStyle(fontWeight: FontWeight.bold, fontSize: linechart_controller.model_linechart.value!.linechartdata!.lefttilenamesProperty!.fontsize!.toDouble(), color: Colors.white);
  String text;
  int num;
  if(value.toInt()==linechart_controller.leftsidename[0]){
     text=linechart_controller.model_linechart.value!.linechartdata!.lefttileNames![0].names.toString();
  }else if(value.toInt()==linechart_controller.leftsidename[1]){
    text=linechart_controller.model_linechart.value!.linechartdata!.lefttileNames![1].names.toString();
  }
  else{
    text="";
  }
  // switch (value.toInt()) {
  //   case 1:
  //     text = '10K';
  //     break;
  //   case 3:
  //     text = '30k';
  //     break;
  //   case 5:
  //     text = '50k';
  //     break;
  //   default:
  //     return Container();
  // }

  return Text(text, style: style, textAlign: TextAlign.left);
}

LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: linechart_controller
          .model_linechart.value!.linechartdata!.flgriddata!.showLines,
      drawHorizontalLine: linechart_controller.model_linechart.value!
          .linechartdata!.flgriddata!.showHorizontallines,
      drawVerticalLine: linechart_controller
          .model_linechart.value!.linechartdata!.flgriddata!.showVerticlelines,
      horizontalInterval: linechart_controller.model_linechart.value!
          .linechartdata!.flgriddata!.horizontallineInterval!
          .toDouble(),
      verticalInterval: linechart_controller.model_linechart.value!
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
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: linechart_controller.model_linechart.value!.linechartdata!
              .bottomtilenamesProperty!.showtilename,
          reservedSize: linechart_controller.model_linechart.value!
              .linechartdata!.bottomtilenamesProperty!.reservedsize!
              .toDouble(),
          interval: linechart_controller.model_linechart.value!.linechartdata!
              .bottomtilenamesProperty!.interval!
              .toDouble(),
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: linechart_controller.model_linechart.value!.linechartdata!
              .lefttilenamesProperty!.showtilename,
          interval: linechart_controller.model_linechart.value!.linechartdata!
              .lefttilenamesProperty!.interval!
              .toDouble(),
          getTitlesWidget: leftTitleWidgets,
          reservedSize: linechart_controller.model_linechart.value!
              .linechartdata!.lefttilenamesProperty!.reservedsize!
              .toDouble(),
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: linechart_controller
        .model_linechart.value!.linechartdata!.flgriddata!.minX!
        .toDouble(),
    maxX: linechart_controller
        .model_linechart.value!.linechartdata!.flgriddata!.maxX!
        .toDouble(),
    minY: linechart_controller
        .model_linechart.value!.linechartdata!.flgriddata!.minY!
        .toDouble(),
    maxY: linechart_controller
        .model_linechart.value!.linechartdata!.flgriddata!.maxY!
        .toDouble(),
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![0].spot1!
                  .toDouble(),
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![0].spot2!
                  .toDouble()),
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![1].spot1!
                  .toDouble(),
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![1].spot2!
                  .toDouble()),
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![2].spot1!
                  .toDouble(),
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![2].spot2!
                  .toDouble()),
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![3].spot1!
                  .toDouble(),
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![3].spot2!
                  .toDouble()),
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![4].spot1!
                  .toDouble(),
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![4].spot2!
                  .toDouble())
          // FlSpot(0, 3),
          // FlSpot(2, 2),
          // FlSpot(4.9, 5),
          // FlSpot(6.8, 3.1),
          // FlSpot(8, 4),
          // FlSpot(9.5, 3),
          // FlSpot(11, 4),
        ],
        isCurved: linechart_controller
            .model_linechart.value!.linechartdata!.flgriddata!.isCurved,
        gradient: LinearGradient(
          colors:gradientColors,
        ),
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors:
                gradientColors.map((color) => color.withOpacity(0.15)).toList(),
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
      show: linechart_controller
          .model_linechart.value!.linechartdata!.flgriddata!.showLines,
      drawHorizontalLine: linechart_controller.model_linechart.value!
          .linechartdata!.flgriddata!.showHorizontallines,
      verticalInterval: linechart_controller.model_linechart.value!
          .linechartdata!.flgriddata!.verticlelineInterval!
          .toDouble(),
      horizontalInterval: linechart_controller.model_linechart.value!
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
          showTitles: linechart_controller.model_linechart.value!.linechartdata!
              .bottomtilenamesProperty!.showtilename,
          reservedSize: linechart_controller.model_linechart.value!
              .linechartdata!.bottomtilenamesProperty!.reservedsize!
              .toDouble(),
          getTitlesWidget: bottomTitleWidgets,
          interval: linechart_controller.model_linechart.value!.linechartdata!
              .bottomtilenamesProperty!.interval!
              .toDouble(),
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: linechart_controller.model_linechart.value!.linechartdata!
              .lefttilenamesProperty!.showtilename,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: linechart_controller.model_linechart.value!
              .linechartdata!.lefttilenamesProperty!.reservedsize!
              .toDouble(),
          interval: linechart_controller.model_linechart.value!.linechartdata!
              .lefttilenamesProperty!.interval!
              .toDouble(),
        ),
      ),
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
    minX: linechart_controller
        .model_linechart.value!.linechartdata!.flgriddata!.minX!
        .toDouble(),
    maxX: linechart_controller
        .model_linechart.value!.linechartdata!.flgriddata!.maxX!
        .toDouble(),
    minY: linechart_controller
        .model_linechart.value!.linechartdata!.flgriddata!.minY!
        .toDouble(),
    maxY: linechart_controller
        .model_linechart.value!.linechartdata!.flgriddata!.maxY!
        .toDouble(),
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![0].spot1!
                  .toDouble(),
              3.44),
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![1].spot1!
                  .toDouble(),
              3.44),
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![2].spot1!
                  .toDouble(),
              3.44),
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![3].spot1!
                  .toDouble(),
              3.44),
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![4].spot1!
                  .toDouble(),
              3.44),
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![5].spot1!
                  .toDouble(),
              3.44),
          FlSpot(
              linechart_controller.model_linechart.value!.linechartdata!
                  .flgriddata!.linechartbardata![6].spot1!
                  .toDouble(),
              3.44),
        ],
        isCurved: true,
        gradient: LinearGradient(
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
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
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!
                  .withOpacity(0.1),
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!
                  .withOpacity(0.1),
            ],
          ),
        ),
      ),
    ],
  );
}
