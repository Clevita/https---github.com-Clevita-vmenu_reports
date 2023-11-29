import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import '../../reports/controllers/reports_controller.dart';
import '../../reports/model/model_reports_shopinfo_model.dart';
import '../../reports/provider/ReportsProvider.dart';
import '../model/model_report_itemwisetax_model.dart';
import 'package:path_provider/path_provider.dart';  



class SalesWithTaxReportController extends GetxController {
  ReportsController controller=Get.find();
  var model_reportitemwisetax = Rxn<ModelReportItemwisetax>();
  var is_loading_sfgrid = false.obs;
  Sfgrid? sfdata;
  var Slct_fromdate = DateTime.now().obs;
  var Slct_todate = DateTime.now().obs;
  TextEditingController txt_fromdate_controller = TextEditingController(
  text: DateFormat('dd-MMM-yyyy').format(DateTime.now())),
  txt_todate_controller = TextEditingController(
  text: DateFormat('dd-MMM-yyy').format(DateTime.now()));
   Rxn<StoreList> dropdown_shoplist = Rxn();
   Map? shoplist;
  GlobalKey<SfDataGridState> key = GlobalKey<SfDataGridState>();
  @override
  void onInit() {
    super.onInit();
    GetData_SalesWithTax_report();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

    void GetData_SalesWithTax_report() async {
    try {
      is_loading_sfgrid.value = false;
      DateTime from_date = DateFormat('dd-MMM-yyyy', 'en_US')
          .parse(txt_fromdate_controller.text);
      DateTime to_date =
          DateFormat('dd-MMM-yyyy', 'en_US').parse(txt_todate_controller.text);
      var responce =
          await ReportsProvider().Report_ItemWiseTax_Getdata(jsondata: {
        "shopid": 0,
        "tokenid": ReportsController().Apptoken,
        "username": "",
        "from_date": DateFormat('yyyy-MM-dd').format(from_date),
        "to_date": DateFormat('yyyy-MM-dd').format(to_date),
        "branches_dbnames": shoplist ??
            {
              "shopname":  controller.model_ownerapp_shopinfodata.value!
                  .datainfo![0].storeList![0].shopname,
              "db_name":  controller.model_ownerapp_shopinfodata.value!
                  .datainfo![0].storeList![0].shopdatabase
            },
        "based_on_daystatus": true
      });

      if (responce['code'] == 200) {
        model_reportitemwisetax.value =
            ModelReportItemwisetax.fromJson(jsonDecode(responce['message']));
        sfdata = Sfgrid(dataitems: model_reportitemwisetax.value!);
        print(model_reportitemwisetax.toJson());
        is_loading_sfgrid.value = true;
      }
    } catch (e) {
      // Get.snackbar("Error", e.toString(),
      //     backgroundColor: Colors.red, colorText: Colors.white);
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
            "${SalesWithTaxReportController().model_reportitemwisetax.value!.shopname}\n${SalesWithTaxReportController().model_reportitemwisetax.value!.shopAddress}\nFromdate:${SalesWithTaxReportController().model_reportitemwisetax.value!.fromDate}\t Todate:${SalesWithTaxReportController().model_reportitemwisetax.value!.toDate}",
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
      final Workbook workbook = SalesWithTaxReportController().key.currentState!
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

class Sfgrid extends DataGridSource {
  List<DataGridRow> dataGridRows = [];
  Sfgrid({required ModelReportItemwisetax dataitems}) {
    for (var a in dataitems.listReportdata!) {
      dataGridRows.add(DataGridRow(cells: [
        DataGridCell(
            columnName: 'SL.NO',
            value: dataitems.listReportdata!.indexOf(a) + 1),
        DataGridCell(
          columnName: 'ITEMNAME',
          value: a.itemname,
        ),
        DataGridCell(
          columnName: 'CATEGORYNAME',
          value: a.categoryname,
        ),
        DataGridCell(
          columnName: 'SECTIONNAME',
          value: a.sectionname,
        ),
        DataGridCell(
          columnName: 'BILLNO',
          value: a.billno,
        ),
        DataGridCell(
            columnName: 'QUANTITY',
            value: a.qty),
            // double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: true,
            //             isPrice: false,
            //             value: a.qty ?? 0,
            //             isNetTotal: false)) ??
            //     0),
        DataGridCell(
            columnName: 'RATE',
            value:a.rate),
            //  double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.rate ?? 0,
            //             isNetTotal: false)) ??
            //     0),
        DataGridCell(columnName: 'TAX', value: a.tax),
        DataGridCell(
            columnName: 'TAXABLE',
            value:a.taxable),
            //  double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.taxable ?? 0,
            //             isNetTotal: false)) ??
            //     0),
        //     Container(
        //   // width: Get.width * 0.61,
        //   alignment: Alignment.center,
        //   padding: EdgeInsets.all(10),
        //   child:  Text,
        //           style: TextStyle(color: ColorsApp.COLOR_SECONDARY_TEXT),),
        // )
        DataGridCell(
            columnName: 'TOTAL',
            value:a.total)
            //  double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.total ?? 0,
            //             isNetTotal: false)) ??
            //     0),
      ]));
    }
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
      padding:
          GetPlatform.isMobile ? EdgeInsets.all(10.0) : EdgeInsets.all(15.0),
      child: Text(
        textAlign: TextAlign.end,
        "",
        // RoundoffORdecimapFraction.RoundoffORdecimapFractionConvertion(
        //     isQty: false,
        //     isPrice: true,
        //     value: double.tryParse(summaryValue) ?? 0,
        //     isNetTotal: false),
        style: TextStyle(
            color: Colors.black, fontSize: GetPlatform.isMobile ? 13 : 15),
      ),
    );
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      if (e.columnName == "TOTAL" ||
          e.columnName == "TAXABLE" ||
          e.columnName == "QUANTITY" ||
          e.columnName == "RATE") {
        return Container(
          // width: Get.width * 0.61,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(10),
          child: Text(
            e.value.toString(),
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        );
      }
      return Container(
        // width: Get.width * 0.61,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text(
          e.value.toString(),
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      );
    }).toList());
  }
}

