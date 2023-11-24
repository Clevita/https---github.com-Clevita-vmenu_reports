import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:vmenu_reports/app/modules/foodcost_report/controllers/sfgrid_controller.dart';
import 'package:vmenu_reports/app/modules/reports/controllers/reports_controller.dart';
import '../../reports/model/model_reports_shopinfo_model.dart';
import '../../reports/provider/ReportsProvider.dart';
import '../model/model_foodcostreport_model.dart';

enum SFGRIDS { summary, detailed }

class FoodcostReportController extends GetxController {
  ReportsController reportcontroller1=Get.find();
  var is_loading_sfgrid = false.obs;
  var Slct_fromdate = DateTime.now().obs;
  var Slct_todate = DateTime.now().obs;
  TextEditingController txt_fromdate_controller = TextEditingController(
  text: DateFormat('dd-MMM-yyyy').format(DateTime.now())),
  txt_todate_controller = TextEditingController(
  text: DateFormat('dd-MMM-yyyy').format(DateTime.now()));
  var dropdownlist = ['summary', 'detailed'];
  var model_foodstock = Rxn<ModelFoodcostreport>();
  var slct_dropdown = 'summary'.obs;
  GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();
  Sfgrid_summarized? sfdata_summarized;
  Sfgrid_detailed? sfdata_detailed;
  var Sfgrid_page = Rxn<Enum>();
  Rxn<StoreList> dropdown_shoplist = Rxn();
 Map? shoplist;
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

   void GetData() async {
    is_loading_sfgrid.value = false;
      DateTime from_date = DateFormat('dd-MMM-yyyy', 'en_US')
          .parse(txt_fromdate_controller.text);
            DateTime to_date = DateFormat('dd-MMM-yyyy', 'en_US')
          .parse(txt_todate_controller.text);
    try {
      var responce =
          await ReportsProvider().Foodstockreport_Getdata(jsondata: {
        "shopid": 0,
        "tokenid": reportcontroller1.Apptoken,
        "username": "",
        "report_type": slct_dropdown.value,
        "from_date": DateFormat('yyyy-MM-dd').format(from_date).toString(),
        "to_date":DateFormat('yyyy-MM-dd').format(to_date).toString(),
        "branches_dbnames": shoplist ??
            {
              "shopname": reportcontroller1.model_ownerapp_shopinfodata.value!
                  .datainfo![0].storeList![0].shopname,
              "db_name": reportcontroller1.model_ownerapp_shopinfodata.value!
                  .datainfo![0].storeList![0].shopdatabase
            },
        "based_on_daystatus": true
      });
      model_foodstock.value =
          ModelFoodcostreport.fromJson(jsonDecode(responce['message']));
      if (slct_dropdown.value == "summary") {
        sfdata_summarized =
            Sfgrid_summarized(dataitems: model_foodstock.value!);
        is_loading_sfgrid.value = true;
        Sfgrid_page.value = SFGRIDS.summary;
      } else {
        sfdata_detailed = Sfgrid_detailed(dataitems: model_foodstock.value!);
        is_loading_sfgrid.value = true;
        Sfgrid_page.value = SFGRIDS.detailed;
      }
      print(model_foodstock.value!.toJson());
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

   Future<void> fromdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null && picked != Slct_fromdate.value) {
      // selectdob.value = picked;
      txt_fromdate_controller.text = DateFormat('dd-MMM-yyyy').format(picked);
    }
  }

  Future<void> todate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null && picked != Slct_todate.value) {
      // selectdob.value = picked;
      txt_todate_controller.text = DateFormat('dd-MMM-yyyy').format(picked);
    }
  }

    Future<void> exportDataGridToPdf() async {
    try {
      final PdfDocument document =
         key.currentState!.exportToPdfDocument(
        fitAllColumnsInOnePage: true,
        exportTableSummaries: true,
        canRepeatHeaders: true,
        exportStackedHeaders: true,
        headerFooterExport:
            (DataGridPdfHeaderFooterExportDetails headerFooterExport) {
          final double width = headerFooterExport.pdfPage.getClientSize().width;
          final PdfPageTemplateElement header =
              PdfPageTemplateElement(Rect.fromLTWH(0, 0, width, 65));
          // header.graphics.drawString("data     data", PdfStandardFont(PdfFontFamily.helvetica, 13, style: PdfFontStyle.bold,),bounds: const Rect.fromLTWH(300, 100, 200, 0),);

          header.graphics.drawString(
            format: PdfStringFormat(alignment: PdfTextAlignment.center),
            "${model_foodstock.value!.shopname}\n${model_foodstock.value!.shopaddress}\nFromdate:${model_foodstock.value!.fromDate == null || model_foodstock.value!.fromDate == "" ? DateFormat("dd-MMM-yyyy").format(DateTime.now()) : DateFormat('dd-MMM-yyyy').format(DateTime.parse(model_foodstock.value!.fromDate!)).toString()}\t Todate:${model_foodstock.value!.toDate == null || model_foodstock.value!.toDate == "" ? DateFormat("dd-MMM-yyyy").format(DateTime.now()) : DateFormat('dd-MMM-yyyy').format(DateTime.parse(model_foodstock.value!.toDate!)).toString()}",
            
            PdfStandardFont(
              PdfFontFamily.helvetica,
              10,
              style: PdfFontStyle.regular,
            ),
            bounds: const Rect.fromLTWH(0, 25, 600, 60),
          );
          headerFooterExport.pdfDocumentTemplate.top = header;
        },
      );
      // headerFooterExport:(details) {
      //  DataGridCellPdfExportDetails(1, pdfCell, cellValue, columnName);
      // }, );
      final List<int> bytes = await document.save();
      File('DataGrid.pdf').writeAsBytes(bytes);
      document.dispose();
      late Directory? directory;
      if (GetPlatform.isMobile) {
        directory = await getExternalStorageDirectory();
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      final path = directory!.path;
      File file = File('$path/ReportItemWiseTax_pdf.pdf');
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open('$path/ReportItemWiseTax_pdf.pdf');
    } catch (e) {
      Get.snackbar("Already Open", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> exportDataGridToExcel() async {
    try {
      final Workbook workbook = key.currentState!
          .exportToExcelWorkbook(
              exportTableSummaries: true, exportStackedHeaders: false);
      final List<int> bytes = workbook.saveAsStream();
      File('DataGrid.xlsx').writeAsBytes(bytes);
      workbook.dispose();
      late Directory? directory;
      if (GetPlatform.isMobile) {
        directory = await getExternalStorageDirectory();
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      final path = directory!.path;
      File file = File('$path/ReportItemWiseTax_excel.xlsx');
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open('$path/ReportItemWiseTax_excel.xlsx');
    } catch (e) {
      Get.snackbar("Already Open", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
