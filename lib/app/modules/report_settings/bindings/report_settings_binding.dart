import 'package:get/get.dart';

import '../controllers/report_settings_controller.dart';

class ReportSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportSettingsController>(
      () => ReportSettingsController(),
    );
  }
}
