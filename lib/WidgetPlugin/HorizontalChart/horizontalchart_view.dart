

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vmenu_reports/WidgetPlugin/HorizontalChart/horizontalchart_controller.dart';
import 'package:vmenu_reports/WidgetPlugin/HorizontalChart/model_horizontalchart_model.dart';

class HorizontalchartView extends GetView {
  @override
  Widget build(BuildContext context) {
    return HorizontalChartController().GetData(
        modelhorizontalagechart: ModelHorizontalchart(
            horizontalChart:
                HorizontalChart(title: "Age Bar Chart", femaleData: [
      MaleData(age: "65+", value: 5.5),
      MaleData(age: "45-56", value: 6.2),
      MaleData(age: "35-44", value: 4.5),
      MaleData(age: "25-34", value: 6.5),
      MaleData(age: "15-24", value: 8.5),
    ], maleData: [
      MaleData(age: "65+", value: 4.5),
      MaleData(age: "45-56", value: 5.3),
      MaleData(age: "35-44", value: 6.0),
      MaleData(age: "25-34", value: 5.0),
      MaleData(age: "15-24", value: 10.0),
    ])));
  }
}

BarChart() {
  return Container(
      child: SfCartesianChart(
    margin: EdgeInsets.zero,
    plotAreaBorderWidth: 0,
    title: ChartTitle(text: "Age"),
    primaryXAxis: CategoryAxis(
      axisLabelFormatter: (AxisLabelRenderDetails details) {
        return ChartAxisLabel(details.text, TextStyle(fontSize: 12));
      },
      axisLine: const AxisLine(width: 0),
      majorTickLines: const MajorTickLines(size: 0),
      majorGridLines: const MajorGridLines(width: 0),
      isVisible: true,
    ),
    primaryYAxis: NumericAxis(
      axisLabelFormatter: (AxisLabelRenderDetails details) {
        return ChartAxisLabel(
          '${details.text}%',
          TextStyle(fontSize: 12),
        );
      },
      axisLine: const AxisLine(width: 0),
      majorTickLines: const MajorTickLines(size: 0, width: 0),
      majorGridLines: const MajorGridLines(
        width: 0.5,
      ),
      minorTickLines: const MinorTickLines(size: 0, width: 0),
      minorGridLines: const MinorGridLines(width: 0),
      maximum: 15,
    ),
    series: [
      createBarSeries(HorizontalChartController
          .model_horizontalchart.value!.horizontalChart!.femaleData!),
      createBarSeries(HorizontalChartController
          .model_horizontalchart.value!.horizontalChart!.maleData!)
    ],
  ));
}

BarSeries<MaleData, String> createBarSeries(
  List<MaleData> dataSource,
) {
  return BarSeries<MaleData, String>(
    spacing: 0.3,
    width: 0.8,
    trackBorderWidth: 0,
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(4),
      bottomRight: Radius.circular(4),
    ),
    enableTooltip: false,
    dataSource: dataSource,
    xValueMapper: (MaleData data, _) => data.age,
    yValueMapper: (MaleData data, _) => data.value,
  );
}
