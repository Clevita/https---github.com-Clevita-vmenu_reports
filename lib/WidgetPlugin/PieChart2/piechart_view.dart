// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import 'package:vmenu_reports/WidgetPlugin/PieChart2/model_piechart2_model.dart';
import 'package:vmenu_reports/WidgetPlugin/PieChart2/piechart_controller.dart';

import '../HorizontalChart/horizontalchart_view.dart';

class PiechartTwoView extends GetView {
  @override
  Widget build(BuildContext context) {
    return PiechartTwoController().GetData(
        modelpiechart2: ModelPiechart2(
            piechart: Piechart(
                title: "PieChart Two",
                titleColor: "#000000",
                titleFontsize: 15,
                piechartData: [
          PiechartData(
              color: "#0000FF",
              growthPercent: 62.8,
              haveIncreased: true,
              label: "Male",
              totalPercent: 55.0),
          PiechartData(
              color: "#CBC3E3",
              growthPercent: 27.2,
              haveIncreased: false,
              label: "Female",
              totalPercent: 35.0),
          // PiechartData(
          //     color: "#FF0000",
          //     growthPercent: 10.0,
          //     haveIncreased: false,
          //     label: "Others",
          //     totalPercent: 10.0)
        ])));
  }
}

PieChart2() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CircleChart(),
      SizedBox(
        width: 100,
      ),
      HorizontalchartView()
    ],
  );
}

CircleChart() {
  return Column(
    children: [
      Container(
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(PieChartData(
                  startDegreeOffset: 250,
                  sectionsSpace: 0,
                  centerSpaceRadius: 60,
                  sections: [
                    for (var a in PiechartTwoController
                        .model_piechartmodel.value!.piechart!.piechartData!)
                      PieChartSectionData(
                        color: colorFromHex(a.color!),
                        value: a.totalPercent,
                        radius: 30,
                        title: '',
                      ),
                    // PieChartSectionData(
                    //   color: Colors.pink,
                    //   value: femalepercent,
                    //   radius: 30,
                    //   title: '',
                    // )
                  ])),
              Text(PiechartTwoController
                  .model_piechartmodel.value!.piechart!.title!)
            ],
          )),
      SizedBox(
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (var b in PiechartTwoController
              .model_piechartmodel.value!.piechart!.piechartData!)
            Column(
              children: [
                Row(
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: colorFromHex(b.color!), radius: 5),
                    const SizedBox(width: 8),
                    Text(
                      b.label!,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 20),
                    Text(
                      b.totalPercent.toString() + '%',
                    ),
                    Icon(
                      b.haveIncreased!
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      size: 20,
                      color: b.haveIncreased! ? Colors.green : Colors.red,
                    ),
                    Text(
                      b.growthPercent.toString() + '%',
                      style: b.haveIncreased!
                          ? TextStyle(color: Colors.green)
                          : TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ],
            )
        ],
      )
    ],
  );
}
