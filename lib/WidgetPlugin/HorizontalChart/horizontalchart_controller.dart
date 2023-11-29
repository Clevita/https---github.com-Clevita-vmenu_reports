import 'package:get/get.dart';
import 'package:vmenu_reports/WidgetPlugin/HorizontalChart/horizontalchart_view.dart';
import 'package:vmenu_reports/WidgetPlugin/HorizontalChart/model_horizontalchart_model.dart';

class HorizontalChartController {
  static var model_horizontalchart = Rxn<ModelHorizontalchart>();

  GetData({required ModelHorizontalchart modelhorizontalagechart}) {
    model_horizontalchart.value = modelhorizontalagechart;
    return BarChart();
  }
}
