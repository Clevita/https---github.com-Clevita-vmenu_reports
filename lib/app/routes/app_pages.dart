import 'package:get/get.dart';

import '../modules/SalesWithTax_report/bindings/sales_with_tax_report_binding.dart';
import '../modules/SalesWithTax_report/views/sales_with_tax_report_view.dart';
import '../modules/foodcost_report/bindings/foodcost_report_binding.dart';
import '../modules/foodcost_report/views/foodcost_report_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/report_settings/bindings/report_settings_binding.dart';
import '../modules/report_settings/views/report_settings_view.dart';
import '../modules/reports/bindings/reports_binding.dart';
import '../modules/reports/views/reports_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REPORTS,
      page: () => ReportsView(),
      binding: ReportsBinding(),
    ),
    GetPage(
      name: _Paths.SALES_WITH_TAX_REPORT,
      page: () => SalesWithTaxReportView(),
      binding: SalesWithTaxReportBinding(),
    ),
    GetPage(
      name: _Paths.FOODCOST_REPORT,
      page: () => FoodcostReportView(),
      binding: FoodcostReportBinding(),
    ),
    GetPage(
      name: _Paths.REPORT_SETTINGS,
      page: () => ReportSettingsView(),
      binding: ReportSettingsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
