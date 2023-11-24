import 'package:get/get.dart';

import '../../../../WidgetPlugin/LineChart/model_linechart_model.dart';

class ModelLinechartProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ModelLinechart.fromJson(map);
      if (map is List)
        return map.map((item) => ModelLinechart.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<ModelLinechart?> getModelLinechart(int id) async {
    final response = await get('modellinechart/$id');
    return response.body;
  }

  Future<Response<ModelLinechart>> postModelLinechart(
          ModelLinechart modellinechart) async =>
      await post('modellinechart', modellinechart);
  Future<Response> deleteModelLinechart(int id) async =>
      await delete('modellinechart/$id');
}
