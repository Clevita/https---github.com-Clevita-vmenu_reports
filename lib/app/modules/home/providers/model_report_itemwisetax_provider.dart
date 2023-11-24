import 'package:get/get.dart';

import '../../SalesWithTax_report/model/model_report_itemwisetax_model.dart';

class ModelReportItemwisetaxProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>)
        return ModelReportItemwisetax.fromJson(map);
      if (map is List)
        return map
            .map((item) => ModelReportItemwisetax.fromJson(item))
            .toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<ModelReportItemwisetax?> getModelReportItemwisetax(int id) async {
    final response = await get('modelreportitemwisetax/$id');
    return response.body;
  }

  Future<Response<ModelReportItemwisetax>> postModelReportItemwisetax(
          ModelReportItemwisetax modelreportitemwisetax) async =>
      await post('modelreportitemwisetax', modelreportitemwisetax);
  Future<Response> deleteModelReportItemwisetax(int id) async =>
      await delete('modelreportitemwisetax/$id');
}
