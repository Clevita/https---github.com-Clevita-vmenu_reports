
import 'package:get/get.dart';
import 'package:vmenu_reports/WidgetPlugin/PieChart2/model_piechart2_model.dart';
import 'package:vmenu_reports/WidgetPlugin/PieChart2/piechart_view.dart';

class PiechartTwoController {
  static var model_piechartmodel = Rxn<ModelPiechart2>();

  GetData({required ModelPiechart2 modelpiechart2}) {
    model_piechartmodel.value = modelpiechart2;
    return PieChart2();
  }
}
