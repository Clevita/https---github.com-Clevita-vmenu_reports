import 'package:get/get.dart';
import 'package:vmenu_reports/WidgetPlugin/VerticalChart/model_barchart_model.dart';
import 'package:vmenu_reports/WidgetPlugin/VerticalChart/verticalchart_view.dart';

class VerticalChartController {
  static var model_barchart = Rxn<ModelBarchart>();

  static Map<int, List<double>> activeUsersData = <int, List<double>>{
    1: [200, 310],
    2: [305, 450],
    3: [270, 390],
    4: [210, 310],
    5: [100, 160],
    6: [300, 450],
    7: [210, 310],
    8: [150, 210],
    9: [210, 310],
    10: [210, 308],
  };

  GetData({required ModelBarchart modelbarchart}) {
    model_barchart.value = modelbarchart;
    return VerticalBar();
  }
}
