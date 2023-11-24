import 'package:get/get.dart';

import '../../../../WidgetPlugin/PieChart/model_pie_chart_model.dart';

class ModelPieChartProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ModelPieChart.fromJson(map);
      if (map is List)
        return map.map((item) => ModelPieChart.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<ModelPieChart?> getModelPieChart(int id) async {
    final response = await get('modelpiechart/$id');
    return response.body;
  }

  Future<Response<ModelPieChart>> postModelPieChart(
          ModelPieChart modelpiechart) async =>
      await post('modelpiechart', modelpiechart);
  Future<Response> deleteModelPieChart(int id) async =>
      await delete('modelpiechart/$id');
}
