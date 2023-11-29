// ignore_for_file: non_constant_identifier_names
import 'package:get/get.dart';
import 'package:vmenu_reports/WidgetPlugin/BubbleChart/bubblechart_view.dart';
import 'package:vmenu_reports/WidgetPlugin/BubbleChart/model_bubblechart_model.dart';

class BubbleChartController {
  static var model_bubblechart = Rxn<ModelBubblechart>();

  GetData({required var modelBubblechart}) {
    model_bubblechart.value = modelBubblechart;
    return Circles();
  }
}
