import 'package:get/get.dart';

import '../controllers/sales_with_tax_report_controller.dart';

class SalesWithTaxReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
       SalesWithTaxReportController(),
    );
  }
}
