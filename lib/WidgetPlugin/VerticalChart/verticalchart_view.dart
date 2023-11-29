// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, non_constant_identifier_names, unnecessary_brace_in_string_interps, use_key_in_widget_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vmenu_reports/WidgetPlugin/VerticalChart/model_barchart_model.dart';
import 'package:vmenu_reports/WidgetPlugin/VerticalChart/verticalchart_controller.dart';

class VerticalChartView extends GetView {
  @override
  Widget build(BuildContext context) {
    return VerticalChartController().GetData(
        modelbarchart: ModelBarchart(
            barData: BarData(
                title: "Vertical Bar",
                titleColor: "#FFA500",
                titleFontsize: 12.0,
                bardataList: [
          BardataList(key: 1, value: [200, 300]),
          BardataList(key: 2, value: [150, 350]),
          BardataList(key: 3, value: [180, 400]),
          BardataList(key: 4, value: [200, 400]),
          BardataList(key: 5, value: [150, 500]),
          BardataList(key: 6, value: [200, 400]),
          BardataList(key: 7, value: [300, 400]),
          BardataList(key: 8, value: [200, 400]),
          BardataList(key: 9, value: [200, 400]),
        ],
                barcontainerData: [
          BarcontainerData(title: "Annual", number: 235000),
          BarcontainerData(title: "Monthly", number: 235),
          BarcontainerData(title: "Daily", number: 23),
        ])));
  }
}

Widget VerticalBar() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
          "${VerticalChartController.model_barchart.value!.barData!.title!.toString()}"),
      SizedBox(
        height: 25,
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 191, maxWidth: 366),
        child: BarChart(
          BarChartData(
            maxY: 500,
            alignment: BarChartAlignment.center,
            barTouchData: BarTouchData(enabled: false),
            titlesData: FlTitlesData(
                show: true,
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 100,
                    getTitlesWidget: (value, __) => Text("${value}"),
                  ),
                )),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (_) => FlLine(
                // color: Colors.amber,
                strokeWidth: 0.05,
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                top: BorderSide(color: Colors.black, width: 1),
              ),
            ),
            barGroups: ChartData,
          ),
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 181, 223, 242),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text("Users"),
              SizedBox(
                width: 25,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text("Active Users")
            ],
          ),
        ],
      ),
    ],
  );
}

List<BarChartGroupData> ChartData = [
  for (var a
      in VerticalChartController.model_barchart.value!.barData!.bardataList!)
    BarChartGroupData(x: 0, barsSpace: 20, barRods: [
      BarChartRodData(
          toY: 0,
          fromY: a.value!.first,
          width: 13,
          color: Colors.blue,
          backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: a.value!.last,
              fromY: 0,
              color: const Color.fromARGB(255, 181, 223, 242)))
    ])
];


