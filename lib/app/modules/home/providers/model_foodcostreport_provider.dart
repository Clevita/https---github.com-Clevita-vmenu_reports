import 'package:get/get.dart';

import '../../foodcost_report/model/model_foodcostreport_model.dart';

class ModelFoodcostreportProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ModelFoodcostreport.fromJson(map);
      if (map is List)
        return map.map((item) => ModelFoodcostreport.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<ModelFoodcostreport?> getModelFoodcostreport(int id) async {
    final response = await get('modelfoodcostreport/$id');
    return response.body;
  }

  Future<Response<ModelFoodcostreport>> postModelFoodcostreport(
          ModelFoodcostreport modelfoodcostreport) async =>
      await post('modelfoodcostreport', modelfoodcostreport);
  Future<Response> deleteModelFoodcostreport(int id) async =>
      await delete('modelfoodcostreport/$id');
}
