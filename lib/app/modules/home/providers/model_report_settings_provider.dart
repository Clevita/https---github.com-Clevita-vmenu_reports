import 'package:get/get.dart';

import '../../report_settings/model/model_report_settings_model.dart';

class ModelReportSettingsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return ModelReportSettings.fromJson(map);
      if (map is List)
        return map.map((item) => ModelReportSettings.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<ModelReportSettings?> getModelReportSettings(int id) async {
    final response = await get('modelreportsettings/$id');
    return response.body;
  }

  Future<Response<ModelReportSettings>> postModelReportSettings(
          ModelReportSettings modelreportsettings) async =>
      await post('modelreportsettings', modelreportsettings);
  Future<Response> deleteModelReportSettings(int id) async =>
      await delete('modelreportsettings/$id');
}
