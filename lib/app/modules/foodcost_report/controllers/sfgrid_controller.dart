import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../roundoffAndDecimalFraction.dart';
import '../model/model_foodcostreport_model.dart';

class Sfgrid_summarized extends DataGridSource {
  List<DataGridRow> dataGridRows = [];
  Sfgrid_summarized({required ModelFoodcostreport dataitems}) {
    for (var a in dataitems.listData!) {
      dataGridRows.add(DataGridRow(cells: [
        DataGridCell(
            columnName: 'SL.NO', value: dataitems.listData!.indexOf(a) + 1),
        DataGridCell(
            columnName: 'Opening Stock Value',
            value: a.openingstockvalue
            // double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.openingstockvalue ?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),
        DataGridCell(
            columnName: 'Purchase Value',
            value:a.purchasevalue
            //  double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.purchasevalue ?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),
        DataGridCell(
            columnName: 'Closing Stock Value',
            value:a.closingstockvalue 
            // double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.closingstockvalue ?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),
        DataGridCell(
            columnName: 'Sales',
            value: a.sales
            // double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.sales ?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),
        DataGridCell(
            columnName: 'Food Cost',
            value:a.foodcost
            //  double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.foodcostinpercentage?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),
        DataGridCell(
            columnName: 'Food Cost In Percentage',
            value:a.foodcostinpercentage
            // '${
            //   double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.foodcost! ?? 0,
            //             isNetTotal: false)) ??
            //     0
            //     } %'
                 ),
      ]));
    }
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  @override
  // Widget? buildTableSummaryCellWidget(
  //     GridTableSummaryRow summaryRow,
  //     GridSummaryColumn? summaryColumn,
  //     RowColumnIndex rowColumnIndex,
  //     String summaryValue) {
  //   return Container(
  //     padding:
  //         GetPlatform.isMobile ? EdgeInsets.all(10.0) : EdgeInsets.all(15.0),
  //     child: Text(
  //       textAlign: TextAlign.end,
  //       RoundoffORdecimapFraction.RoundoffORdecimapFractionConvertion(
  //           isQty: false,
  //           isPrice: true,
  //           value: double.tryParse(summaryValue) ?? 0,
  //           isNetTotal: false),
  //       style: TextStyle(
  //           color: Colors.black, fontSize: GetPlatform.isMobile ? 13 : 15),
  //     ),
  //   );
  // }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      if (e.columnName == "Food Cost" ||
          e.columnName == "Food Cost In Percentage" ||
          e.columnName == "SL.NO") {
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
      }
      
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
    }).toList());
  }
}

class Sfgrid_detailed extends DataGridSource {
  List<DataGridRow> dataGridRows = [];
  Sfgrid_detailed({required ModelFoodcostreport dataitems}) {
    for (var a in dataitems.listData!) {
      dataGridRows.add(DataGridRow(cells: [
        DataGridCell(
            columnName: 'SL.NO', value: dataitems.listData!.indexOf(a) + 1),
        DataGridCell(
          columnName: 'Date',
          value: a.date,
        ),
        DataGridCell(
            columnName: 'Opening Stock Value',
            value:a.openingstockvalue
            //  double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.openingstockvalue ?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),
         DataGridCell(
            columnName: 'Purchase Value',
            value: a.purchasevalue
            // double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.purchasevalue ?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),
         DataGridCell(
            columnName: 'Closing Stock Value',
            value:a.closingstockvalue
            //  double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.closingstockvalue ?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),

         DataGridCell(
            columnName: 'Sales',
            value:a.sales
            //  double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.sales ?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),
         DataGridCell(
            columnName: 'Food Cost',
            value:a.foodcost
            //  double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.foodcostinpercentage ?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),
          DataGridCell(
            columnName: 'Food Cost In Percentage',
            value:a.foodcostinpercentage
            //  double.tryParse(RoundoffORdecimapFraction
            //         .RoundoffORdecimapFractionConvertion(
            //             isQty: false,
            //             isPrice: true,
            //             value: a.foodcost ?? 0,
            //             isNetTotal: false)) ??
            //     0
                ),
      ]));
    }
  }

  @override
  List<DataGridRow> get rows => dataGridRows;
  @override
  // Widget? buildTableSummaryCellWidget(
  //     GridTableSummaryRow summaryRow,
  //     GridSummaryColumn? summaryColumn,
  //     RowColumnIndex rowColumnIndex,
  //     String summaryValue) {
  //   return Container(
  //     padding:
  //         GetPlatform.isMobile ? EdgeInsets.all(10.0) : EdgeInsets.all(15.0),
  //     child: Text(
  //       textAlign: TextAlign.end,
  //       RoundoffORdecimapFraction.RoundoffORdecimapFractionConvertion(
  //           isQty: false,
  //           isPrice: true,
  //           value: double.tryParse(summaryValue) ?? 0,
  //           isNetTotal: false),
  //       style: TextStyle(
  //           color: Colors.black, fontSize: GetPlatform.isMobile ? 13 : 15),
  //     ),
  //   );
  // }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      if (e.columnName == "SL.NO" ||
          e.columnName == "Food Cost" ||
          e.columnName == "Food Cost In Percentage") {
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
      } else if (e.columnName == "Date") {
        var abc = DateTime.parse(e.value);
        return Container(
          // width: Get.width * 0.61,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child:
              // Text(e.value.toString(),
              Text(
            DateFormat('dd-MMM-yyyy').format(abc).toString(),
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        );
      }
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
    }).toList());
  }
}
