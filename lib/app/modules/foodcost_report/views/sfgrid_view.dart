import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../Colours.dart';
import '../../../../../Fonts.dart';

import '../controllers/foodcost_report_controller.dart';

class Sfgrid_summarized_view {
  sfgridview(FoodcostReportController controller ) {
    return Expanded(
        child: SfDataGrid(
      key:controller.key,
      showVerticalScrollbar: true,
      verticalScrollPhysics: BouncingScrollPhysics(),
      horizontalScrollPhysics: BouncingScrollPhysics(),
      gridLinesVisibility: GridLinesVisibility.both,
      headerGridLinesVisibility: GridLinesVisibility.both,
      allowPullToRefresh: true,
      rowHeight: 60,
      headerRowHeight: 80,
      columnWidthMode: ColumnWidthMode.lastColumnFill,
      source: controller.sfdata_summarized!,
      stackedHeaderRows: <StackedHeaderRow>[
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: [
                'SL.NO',
                'Opening Stock Value',
                'Purchase Value',
                'Closing Stock Value',
                'Sales',
                'Food Cost',
                'Food Cost In Percentage',
                
              ],
              child: Container(
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      ),
                  height: 40,
                  // padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      controller.model_foodstock.value!
                                      .shopname ==
                                  "" ||
                              controller
                                      .model_foodstock
                                      .value!
                                      .shopname ==
                                  null
                          ? SizedBox()
                          : Center(
                              child: Text(
                              "${controller.model_foodstock.value!.shopname}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsApp.COLOR_SECONDARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat),
                            )),
                      controller.model_foodstock.value!
                                      .shopaddress ==
                                  "" ||
                              controller
                                      .model_foodstock
                                      .value!
                                      .shopaddress ==
                                  null
                          ? SizedBox()
                          : Center(
                              child: Text(
                              "${controller.model_foodstock.value!.shopaddress}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsApp.COLOR_SECONDARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat),
                            )),
                      Center(
                          child: Text(
                        "From Date: ${controller.model_foodstock.value!.fromDate == null || controller.model_foodstock.value!.fromDate == "" ? DateFormat("dd-MMM-yyyy").format(DateTime.now()) : DateFormat('dd-MMM-yyyy').format(DateTime.parse(controller.model_foodstock.value!.fromDate!)).toString()} To Date: ${controller.model_foodstock.value!.toDate == null || controller.model_foodstock.value!.toDate == "" ? DateFormat("dd-MMM-yyyy").format(DateTime.now()) : DateFormat('dd-MMM-yyyy').format(DateTime.parse(controller.model_foodstock.value!.toDate!)).toString()}",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 10,
                            color: ColorsApp.COLOR_SECONDARY_TEXT,
                            fontFamily: Fonts.font_Montserrat),
                      )),
                    ],
                  )))

        ])
      ],
      columns: [
        GridColumn(
            columnWidthMode: ColumnWidthMode.auto,
            columnName: 'SL.NO',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Sl.No',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Opening Stock Value',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Opening Stock Value',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Purchase Value',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Purchase Value',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Closing Stock Value',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Closing Stock Value',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Sales',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Sales',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Food Cost',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Food Cost',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Food Cost In Percentage',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Food Cost In Percentage',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
    
      ],
    ));
  }
}

class Sfgrid_detailed_view {
  sfgridview(FoodcostReportController controller) {
    return Expanded(
        child: SfDataGrid(
      key: controller.key,
      showVerticalScrollbar: true,
      verticalScrollPhysics: BouncingScrollPhysics(),
      horizontalScrollPhysics: BouncingScrollPhysics(),
      gridLinesVisibility: GridLinesVisibility.both,
      headerGridLinesVisibility: GridLinesVisibility.both,
      allowPullToRefresh: true,
      rowHeight: 60,
      headerRowHeight: 80,
      columnWidthMode: ColumnWidthMode.lastColumnFill,
      source: controller.sfdata_detailed!,
     stackedHeaderRows: <StackedHeaderRow>[
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: [
                'SL.NO',
                'Date',
                'Opening Stock Value',
                'Purchase Value',
                'Closing Stock Value',
                'Sales',
                'Food Cost',
                'Food Cost In Percentage',
                
              ],
              child: Container(
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      ),
                  height: 40,
                  // padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      controller.model_foodstock.value!
                                      .shopname ==
                                  "" ||
                              controller
                                      .model_foodstock
                                      .value!
                                      .shopname ==
                                  null
                          ? SizedBox()
                          : Center(
                              child: Text(
                              "${controller.model_foodstock.value!.shopname}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsApp.COLOR_SECONDARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat),
                            )),
                      controller.model_foodstock.value!
                                      .shopaddress ==
                                  "" ||
                              controller
                                      .model_foodstock
                                      .value!
                                      .shopaddress ==
                                  null
                          ? SizedBox()
                          : Center(
                              child: Text(
                              "${controller.model_foodstock.value!.shopaddress}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsApp.COLOR_SECONDARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat),
                            )),
                      Center(
                          child: Text(
                        "From Date: ${controller.model_foodstock.value!.fromDate} To Date: ${controller.model_foodstock.value!.toDate}",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 10,
                            color: ColorsApp.COLOR_SECONDARY_TEXT,
                            fontFamily: Fonts.font_Montserrat),
                      )),
                    ],
                  )))

        ])
      ],
      columns: [
        GridColumn(
            columnWidthMode: ColumnWidthMode.auto,
            columnName: 'SL.NO',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Sl.No',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
                       GridColumn(
            columnWidthMode: ColumnWidthMode.auto,
            columnName: 'Date',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Date',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Opening Stock Value',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Opening Stock Value',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Purchase Value',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Purchase Value',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Closing Stock Value',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Closing Stock Value',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Sales',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Sales',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Food Cost',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Food Cost',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'Food Cost In Percentage',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Food Cost In Percentage',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
    
      ],
    ));
  }
}