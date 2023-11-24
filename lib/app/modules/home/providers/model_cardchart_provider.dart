import 'package:get/get.dart';

import '../../../../WidgetPlugin/Cardchart1/model_cardchart_model.dart';

class ModelCardchartProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ModelCardchart.fromJson(map);
      if (map is List)
        return map.map((item) => ModelCardchart.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<ModelCardchart?> getModelCardchart(int id) async {
    final response = await get('modelcardchart/$id');
    return response.body;
  }

  Future<Response<ModelCardchart>> postModelCardchart(
          ModelCardchart modelcardchart) async =>
      await post('modelcardchart', modelcardchart);
  Future<Response> deleteModelCardchart(int id) async =>
      await delete('modelcardchart/$id');
}
