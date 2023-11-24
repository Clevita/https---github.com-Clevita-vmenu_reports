import 'package:get/get.dart';

import '../controllers/foodcost_report_controller.dart';

class FoodcostReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
       FoodcostReportController(),
    );
  }
}
