import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../Colours.dart';
import '../../../../Constants.dart';
import '../../../../Fonts.dart';
import '../../reports/controllers/reports_controller.dart';
import '../../reports/model/model_reports_shopinfo_model.dart';
import '../controllers/sales_with_tax_report_controller.dart';

class SalesWithTaxReportView extends GetResponsiveView<SalesWithTaxReportController> {
  SalesWithTaxReportView({Key? key}) : super(key: key);
  @override
   Widget builder() {
    if (screen.isDesktop) {
      return Desktop();
    } else if (screen.isPhone) {
      print('mobile');
      return Mobile();
    } else if (screen.isTablet) {
      print('tablet');
      return Desktop();
    } else {
      return Desktop();
    }
  }
}
class Desktop extends GetView<SalesWithTaxReportController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Column(
        children: [ 
            Container(height: Constants.appbar_desktop_height,width: Get.width,color: ColorsApp.COLOR_PRIMARY,child: appbarwidgets_desktop(),),
          Expanded(
            child: Card(
              color: ColorsApp.COLOR_SECONDARY,
              margin: const EdgeInsets.all(10),
              elevation: 10,
              child:
                  Column(children: [
              
                Obx(() => 
                controller.model_reportitemwisetax.value!=null? 
                controller.is_loading_sfgrid.value == false
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorsApp.COLOR_PRIMARY,
                            strokeWidth: 0.7,
                          ),
                        ),
                      )
                    // ignore: prefer_const_constructors
                    : sfgrid_ReportItemwiseTax().sfgridview(controller):SizedBox())
              ]),
            ),
          ),
        ],
      ),
    );
    
  
  }
  
 Widget appbarwidgets_desktop() {
    ReportsController reportsController=Get.find();
    return Row( children: [
      IconButton(onPressed: (){
        reportsController.mainpage.value=true;
        Get.back();
      }, icon: Icon(LineIcons.angleLeft,size: 30,color: ColorsApp.COLOR_PRIMARY_TEXT,)),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      width: 150,
                      child: TextFormField(
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: ColorsApp.COLOR_PRIMARY_TEXT,
                              fontFamily: Fonts.font_Montserrat),
                          textAlign: TextAlign.center,
                          onTap: () {
                            controller
                                    .txt_fromdate_controller.selection =
                                TextSelection(
                                    baseOffset: 0,
                                    extentOffset: controller
                                        .txt_fromdate_controller.value.text.length);
                          },
                          autofocus: true,
                          controller:
                              controller.txt_fromdate_controller,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9- ]')),
                          ],
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorsApp.COLOR_NIGHT_PRIMARY_TEXT.withOpacity(0.40))),
                              labelText: "From Date".capitalize!,
                              labelStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: ColorsApp.COLOR_PRIMARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat,
                                  fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color:ColorsApp.COLOR_NIGHT_PRIMARY_TEXT.withOpacity(0.40)),
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                                color: ColorsApp.COLOR_NIGHT_PRIMARY_TEXT.withOpacity(0.40),
                              )),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller
                                        .fromdate(Get.context!);
                                  },
                                  icon:  Icon(
                                    LineIcons.calendarAlt,
                                    color: ColorsApp.COLOR_NIGHT_PRIMARY_TEXT.withOpacity(0.80),
                                  )))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      width: 150,
                      child: TextFormField(
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: ColorsApp.COLOR_PRIMARY_TEXT,
                              fontFamily: Fonts.font_Montserrat),
                          textAlign: TextAlign.center,
                          onTap: () {
                            controller
                                    .txt_todate_controller.selection =
                                TextSelection(
                                    baseOffset: 0,
                                    extentOffset: controller
                                        .txt_todate_controller.value.text.length);
                          },
                          autofocus: true,
                          controller: controller.txt_todate_controller,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9- ]')),
                          ],
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorsApp.COLOR_PRIMARY)),
                              labelText: " To Date".capitalize!,
                              labelStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: ColorsApp.COLOR_PRIMARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat,
                                  fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorsApp.COLOR_NIGHT_PRIMARY_TEXT.withOpacity(0.40)),
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                                color: ColorsApp.COLOR_NIGHT_PRIMARY_TEXT.withOpacity(0.40),
                              )),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.todate(Get.context!);
                                  },
                                  icon:  Icon(
                                    LineIcons.calendarAlt,
                                    color: ColorsApp.COLOR_NIGHT_PRIMARY_TEXT.withOpacity(0.80),
                                  )))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(border: Border.all(color: ColorsApp.COLOR_NIGHT_PRIMARY_TEXT.withOpacity(0.40))),
                      height: 40,
                    width: 180,
                      child: Obx(() =>
                          reportsController.model_ownerapp_shopinfodata.value ==
                                              null
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                color: ColorsApp.COLOR_PRIMARY,
                                                strokeWidth: 0.7,
                                              ),
                                            ):
              
                          DropdownButton<StoreList>(
                              icon: Icon(
                                LineIcons.hotel,
                                color: ColorsApp.COLOR_NIGHT_PRIMARY_TEXT.withOpacity(0.40),
                              ),
                              isExpanded: true,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(2),
                              dropdownColor: ColorsApp.COLOR_PRIMARY,
                              style: TextStyle(
                                  fontFamily: Fonts.font_Montserrat,
                                  color: ColorsApp.COLOR_PRIMARY_TEXT),
                              borderRadius: BorderRadius.circular(10),
                              underline: const SizedBox(),
                              hint: Text(
                                  "${reportsController.model_ownerapp_shopinfodata.value!.datainfo![0].storeList![0].shopname}",style: TextStyle(color: ColorsApp.COLOR_PRIMARY_TEXT),),
                              // Text('Choose Outlet',style: TextStyle(color: ColorsApp.COLOR_SECONDARY_TEXT,fontSize: 14,fontFamily: Fonts.font_Montserrat),),
                              items:reportsController.model_ownerapp_shopinfodata
                                  .value!.datainfo![0].storeList!
                                  .map((item) {
                                return DropdownMenuItem<StoreList>(
                                  alignment: Alignment.center,
                                  value: item,
                                  child: Text(item.shopname.toString()),
                                );
                              }).toList(),
                              disabledHint: const Text("Can't select"),
                              onChanged: (newVal) {
                                controller.dropdown_shoplist.value =
                                    newVal;
                                controller.shoplist = {
                                  "shopname": newVal!.shopname,
                                  "db_name": newVal.shopdatabase
                                };
                                // print(saleswithtax_Controller.shoplist);
                              },
                              value:
                                  controller.dropdown_shoplist.value)),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.GetData_SalesWithTax_report();
                        },
                        iconSize: 100,
                        color: ColorsApp.COLOR_PRIMARY,
                        icon: Container(decoration: BoxDecoration(border: Border.all(color: ColorsApp.COLOR_NIGHT_PRIMARY_TEXT.withOpacity(0.40)),color: ColorsApp.COLOR_PRIMARY),
                            height: 30,
                            width: 150,
                            // color: ColorsApp.COLOR_PRIMARY,
                            child: Center(
                                child: Text(
                              "SEARCH",
                              style: TextStyle(
                                  color: ColorsApp.COLOR_PRIMARY_TEXT,
                                  fontSize: 14,
                                  fontFamily: Fonts.font_Montserrat),
                            )))),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Constants.TooltipCustom(
                          messege: "PDF",
                          child: IconButton(
                              onPressed: () {
                                controller.exportDataGridToPdf();
                              },
                              icon: Icon(
                                LineIcons.pdfFileAlt,
                                color: ColorsApp.COLOR_PRIMARY_TEXT,
                                size: 30,
                              )),
                        ),
                        Constants.TooltipCustom(
                            messege: "excell",
                            child: IconButton(
                                onPressed: () {
                                  controller.exportDataGridToExcel();
                                },
                                icon: Icon(
                                  LineIcons.excelFileAlt,
                                  size: 30,
                                  color: ColorsApp.COLOR_PRIMARY_TEXT,
                                )))
                      ],
                    ))
                  ]);
  }
  
  
  }


  class Mobile extends GetView<SalesWithTaxReportController> {
  @override
  Widget build(BuildContext context) {
     return 
    Scaffold(
      body: Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child:
            // Expanded(child: sfgrid_ReportItemwiseTax().sfgridview())
            Column(children: [
              Container(height: Constants.appbar_mobile_height,width: Get.width, color: ColorsApp.COLOR_PRIMARY,child:appbarwidgets_mobile() ,),
          Container(
              alignment: Alignment.center,
              height: 80,
              width: Get.width,
              child: Column(
                children: [
                  Row(children: [
                    Container(
                      margin: const EdgeInsets.only(left: 1, right: 1),
                      height: 25,
                      width: 98,
                      child: TextFormField(
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: Fonts.font_Montserrat),
                          // textAlign: TextAlign.center,
                          onTap: () {
                            controller
                                    .txt_fromdate_controller.selection =
                                TextSelection(
                                    baseOffset: 0,
                                    extentOffset: controller
                                        .txt_fromdate_controller
                                        .value
                                        .text
                                        .length);
                          },
                          autofocus: true,
                          controller:
                              controller.txt_fromdate_controller,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9- ]')),
                          ],
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorsApp.COLOR_PRIMARY)),
                              labelText: "From Date".capitalize!,
                              labelStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: ColorsApp.COLOR_PRIMARY,
                                  fontFamily: Fonts.font_Montserrat,
                                  fontSize: 8),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorsApp.COLOR_NIGHT_PRIMARY),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              )),
                              suffixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: InkWell(
                                    onTap: () {
                                      controller
                                          .fromdate(Get.context!);
                                    },
                                    child: const Icon(
                                      size: 12,
                                      LineIcons.calendarAlt,
                                      color: Colors.black,
                                    ),
                                  ))
    
                              //  IconButton(
                              //     onPressed: () {
                              //       saleswithtax_Controller().fromdate(Get.context!);
                              //     },padding: EdgeInsets.only(left: 15),
                              //     icon: Icon(size: 12,
                              //       LineIcons.calendarAlt,
                              //       color: Colors.black,
                              //     ))
                              )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 1, right: 1),
                      height: 25,
                      width: 98,
                      child: TextFormField(
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: Fonts.font_Montserrat),
                          // textAlign: TextAlign.center,
                          onTap: () {
                            controller
                                    .txt_todate_controller.selection =
                                TextSelection(
                                    baseOffset: 0,
                                    extentOffset: controller
                                        .txt_todate_controller.value.text.length);
                          },
                          autofocus: true,
                          controller:
                              controller.txt_todate_controller,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z0-9- ]')),
                          ],
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: ColorsApp.COLOR_PRIMARY)),
                              labelText: " To Date".capitalize!,
                              labelStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: ColorsApp.COLOR_PRIMARY,
                                  fontFamily: Fonts.font_Montserrat,
                                  fontSize: 8),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorsApp.COLOR_NIGHT_PRIMARY),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              )),
                              suffixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: InkWell(
                                    onTap: () {
                                      controller
                                          .todate(Get.context!);
                                    },
                                    child: const Icon(
                                      size: 12,
                                      LineIcons.calendarAlt,
                                      color: Colors.black,
                                    ),
                                  ))
                              //  IconButton(
                              //     onPressed: () {
                              //       saleswithtax_Controller().todate(Get.context!);
                              //     },padding: EdgeInsets.only(left: 15),
                              //     icon: Icon(size: 12,
                              //       LineIcons.calendarAlt,
                              //       color: Colors.black,
                              //     ))
                              )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 1, right: 1),
                      decoration: BoxDecoration(border: Border.all()),
                      height: 25,
                      width: 80,
                      child: Obx(() => DropdownButton<StoreList>(
                          icon: Icon(
                            size: 12,
                            LineIcons.hotel,
                            color: ColorsApp.COLOR_SECONDARY_TEXT,
                          ),
                          isExpanded: true,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(2),
                          dropdownColor: ColorsApp.COLOR_SECONDARY,
                          style: TextStyle(
                              fontSize: 8,
                              fontFamily: Fonts.font_Montserrat,
                              color: ColorsApp.COLOR_SECONDARY_TEXT),
                          borderRadius: BorderRadius.circular(10),
                          underline: const SizedBox(),
                          hint: Text(
                              "${controller.dropdown_shoplist}"),
                          // Text('Choose Outlet',style: TextStyle(color: ColorsApp.COLOR_SECONDARY_TEXT,fontSize: 14,fontFamily: Fonts.font_Montserrat),),
                          items: ReportsController().model_ownerapp_shopinfodata
                              .value!.datainfo![0].storeList!
                              .map((item) {
                            return DropdownMenuItem<StoreList>(
                              alignment: Alignment.center,
                              value: item,
                              child: Text(item.shopname.toString()),
                            );
                          }).toList(),
                          disabledHint: const Text("Can't select"),
                          onChanged: (newVal) {
                            controller.dropdown_shoplist.value =
                                newVal;
                            controller.shoplist = {
                              "shopname": newVal!.shopname,
                              "db_name": newVal.shopdatabase
                            };
                            print(controller.shoplist);
                          },
                          value: controller
                              .dropdown_shoplist.value)),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.GetData_SalesWithTax_report();
                        },
                        iconSize: 40,
                        color: ColorsApp.COLOR_PRIMARY,
                        icon: Container(
                            padding: const EdgeInsets.all(3),
                            height: 20,
                            width: 80,
                            color: ColorsApp.COLOR_PRIMARY,
                            child: Center(
                                child: Text(
                              "SEARCH",
                              style: TextStyle(
                                  color: ColorsApp.COLOR_PRIMARY_TEXT,
                                  fontSize: 8,
                                  fontFamily: Fonts.font_Montserrat),
                            )))),
                    // Expanded(
                    //     child: Row(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //   Constants.TooltipCustom(messege: "PDF",child:IconButton(
                    //         onPressed: () {
                    //           saleswithtax_Controller().exportDataGridToPdf();
                    //         },
                    //         icon: Icon(
                    //           LineIcons.pdfFileAlt,
                    //           color: ColorsApp.COLOR_PRIMARY,
                    //           size: 30,
                    //         )), ) ,
                    //    Constants.TooltipCustom(messege: "excell",child:IconButton(
                    //         onPressed: () {
                    //            saleswithtax_Controller().exportDataGridToExcel();
                    //         },
                    //         icon: Icon(
                    //           LineIcons.excelFileAlt,
                    //           size: 30,
                    //           color: ColorsApp.COLOR_PRIMARY,
                    //         )) )
                    //   ],
                    // ))
                  ]),
                  Expanded(
                      child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Constants.TooltipCustom(
                        messege: "PDF",
                        child: IconButton(
                            onPressed: () {
                              controller.exportDataGridToPdf();
                            },
                            icon: Icon(
                              LineIcons.pdfFileAlt,
                              color: ColorsApp.COLOR_PRIMARY,
                              size: 15,
                            )),
                      ),
                      Constants.TooltipCustom(
                          messege: "excell",
                          child: IconButton(
                              onPressed: () {
                                controller
                                    .exportDataGridToExcel();
                              },
                              icon: Icon(
                                LineIcons.excelFileAlt,
                                size: 15,
                                color: ColorsApp.COLOR_PRIMARY,
                              )))
                    ],
                  ))
                ],
              )),
          Obx(() => controller.is_loading_sfgrid.value == true
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ColorsApp.COLOR_PRIMARY,
                      strokeWidth: 0.7,
                    ),
                  ),
                )
              : sfgrid_ReportItemwiseTax_mobile().sfgridview(controller))
        ]),
      ),
    );
  }
  
  appbarwidgets_mobile() {


  }}

  class sfgrid_ReportItemwiseTax {
  sfgridview(SalesWithTaxReportController controller ) {
    return Expanded(
        child: SfDataGrid(
      key: controller.key,
      showVerticalScrollbar: true,
      verticalScrollPhysics: const BouncingScrollPhysics(),
      horizontalScrollPhysics: const BouncingScrollPhysics(),
      gridLinesVisibility: GridLinesVisibility.both,
      headerGridLinesVisibility: GridLinesVisibility.both,
      allowPullToRefresh: true,
      rowHeight: 60,
      headerRowHeight: 80,
      columnWidthMode: ColumnWidthMode.lastColumnFill,
      source: controller.sfdata!,
      tableSummaryRows: [
        GridTableSummaryRow(
            showSummaryInRow: false,
            columns: [
              const GridSummaryColumn(
                  name: 'TAXABLE',
                  columnName: 'TAXABLE',
                  summaryType: GridSummaryType.sum),
              const GridSummaryColumn(
                  name: 'TOTAL',
                  columnName: 'TOTAL',
                  summaryType: GridSummaryType.sum),
            ],
            position: GridTableSummaryRowPosition.bottom)
      ],

      stackedHeaderRows: <StackedHeaderRow>[
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: [
                'SL.NO',
                'ITEMNAME',
                'CATEGORYNAME',
                'SECTIONNAME',
                'BILLNO',
                'QUANTITY',
                'RATE',
                'TAX',
                'TAXABLE',
                'TOTAL'
              ],
              child: Container(
                  decoration: const BoxDecoration(
                      // border: Border.all(),
                      ),
                  height: 40,
                  // padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      controller.model_reportitemwisetax.value!
                                      .shopname ==
                                  "" ||
                              controller
                                      .model_reportitemwisetax
                                      .value!
                                      .shopname ==
                                  null
                          ? const SizedBox()
                          : Center(
                              child: Text(
                              "${controller.model_reportitemwisetax.value!.shopname}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsApp.COLOR_SECONDARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat),
                            )),
                      controller.model_reportitemwisetax.value!
                                      .shopAddress ==
                                  "" ||
                              controller
                                      .model_reportitemwisetax
                                      .value!
                                      .shopAddress ==
                                  null
                          ? const SizedBox()
                          : Center(
                              child: Text(
                              "${controller.model_reportitemwisetax.value!.shopAddress}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsApp.COLOR_SECONDARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat),
                            )),
                      Center(
                          child: Text(
                        "From Date: ${controller.model_reportitemwisetax.value!.fromDate} To Date: ${controller.model_reportitemwisetax.value!.toDate}",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 10,
                            color: ColorsApp.COLOR_SECONDARY_TEXT,
                            fontFamily: Fonts.font_Montserrat),
                      )),
                    ],
                  )))

          // saleswithtax_Controller.model_reportitemwisetax.value!
          //                 .shopMobileno ==
          //             "" ||
          //         saleswithtax_Controller.model_reportitemwisetax
          //                 .value!.shopMobileno ==
          //             null
          //     ? SizedBox()
          //     : Container(
          //         margin: EdgeInsets.all(5),
          //         width: 150,
          //         // decoration: BoxDecoration(border: Border.all()),
          //         child: Center(
          //             child: AutoSizeText(
          //           "Mobile No: ${saleswithtax_Controller.model_reportitemwisetax.value!.shopMobileno}",
          //           maxFontSize: 12,
          //           minFontSize: 7,
          //           maxLines: 1,
          //           style: TextStyle(
          //               color: ColorsApp.COLOR_SECONDARY_TEXT,
          //               fontFamily: Fonts.font_Montserrat),
          //         ))),
          // saleswithtax_Controller
          //                 .model_reportitemwisetax.value!.shopGst ==
          //             "" ||
          //         saleswithtax_Controller
          //                 .model_reportitemwisetax.value!.shopGst ==
          //             null
          //     ? SizedBox()
          //     : Container(
          //         margin: EdgeInsets.all(5),
          //         width: 110,
          //         // decoration: BoxDecoration(border: Border.all()),
          //         child: Center(
          //             child: AutoSizeText(
          //           "Gst: ${saleswithtax_Controller.model_reportitemwisetax.value!.shopGst}",
          //           maxFontSize: 14,
          //           minFontSize: 7,
          //           maxLines: 1,
          //           style: TextStyle(
          //               color: ColorsApp.COLOR_SECONDARY_TEXT,
          //               fontFamily: Fonts.font_Montserrat),
          //         ))),
        ])
      ],
      // footer: Container(
      //     child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     Padding(
      //         padding:
      //             EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 36),
      //         child: Text(
      //           "Taxable:${RoundoffORdecimapFraction.RoundoffORdecimapFractionConvertion(isQty: false, isPrice: true, value: saleswithtax_Controller.model_reportitemwisetax.value!.totalTaxable ?? 0, isNetTotal: false)}",
      //           style: TextStyle(
      //               color: ColorsApp.COLOR_SECONDARY_TEXT,
      //               fontFamily: Fonts.font_Montserrat,
      //               fontSize: 14),
      //         )),
      //     Padding(
      //         padding:
      //             EdgeInsets.only(bottom: 10, top: 10, left: 40, right: 25),
      //         child: Text(
      //           "Total:${RoundoffORdecimapFraction.RoundoffORdecimapFractionConvertion(isQty: false, isPrice: true, value: saleswithtax_Controller.model_reportitemwisetax.value!.nettotal ?? 0, isNetTotal: false)}",
      //           style: TextStyle(
      //               color: ColorsApp.COLOR_SECONDARY_TEXT,
      //               fontFamily: Fonts.font_Montserrat,
      //               fontSize: 14),
      //         ))
      //   ],
      // )),
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
            columnName: 'ITEMNAME',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Item Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'CATEGORYNAME',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Category Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'SECTIONNAME',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Section Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'BILLNO',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Bill No.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'QUANTITY',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Quantity',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'RATE',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Rate',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'TAX',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Tax',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnWidthMode: ColumnWidthMode.fill,
            columnName: 'TAXABLE',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Taxable',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
        GridColumn(
            columnName: 'TOTAL',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Total',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    overflow: TextOverflow.visible))),
      ],
    ));
  }
}

// ignore: camel_case_types
class sfgrid_ReportItemwiseTax_mobile {
  sfgridview(SalesWithTaxReportController controller ) {
    return Expanded(
        child: SfDataGrid(
      key: controller.key,
      showVerticalScrollbar: true,
      verticalScrollPhysics: const BouncingScrollPhysics(),
      horizontalScrollPhysics: const BouncingScrollPhysics(),
      allowPullToRefresh: true,
      rowHeight: 40,
      headerRowHeight: 60,
      stackedHeaderRows: <StackedHeaderRow>[
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: [
                'SL.NO',
                'ITEMNAME',
                'CATEGORYNAME',
                'SECTIONNAME',
                'BILLNO',
                'QUANTITY',
                'RATE',
                'TAX',
                'TAXABLE',
                'TOTAL'
              ],
              child: Container(
                  decoration: const BoxDecoration(
                      // border: Border.all(),
                      ),
                  height: 40,
                  // padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      controller.model_reportitemwisetax.value!
                                      .shopname ==
                                  "" ||
                              controller
                                      .model_reportitemwisetax
                                      .value!
                                      .shopname ==
                                  null
                          ? const SizedBox()
                          : Center(
                              child: Text(
                              "${controller.model_reportitemwisetax.value!.shopname}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsApp.COLOR_SECONDARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat),
                            )),
                      controller.model_reportitemwisetax.value!
                                      .shopAddress ==
                                  "" ||
                              controller
                                      .model_reportitemwisetax
                                      .value!
                                      .shopAddress ==
                                  null
                          ? const SizedBox()
                          : Center(
                              child: Text(
                              "${controller.model_reportitemwisetax.value!.shopAddress}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsApp.COLOR_SECONDARY_TEXT,
                                  fontFamily: Fonts.font_Montserrat),
                            )),
                      Center(
                          child: Text(
                        "From Date: ${controller.model_reportitemwisetax.value!.fromDate} To Date: ${controller.model_reportitemwisetax.value!.toDate}",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 10,
                            color: ColorsApp.COLOR_SECONDARY_TEXT,
                            fontFamily: Fonts.font_Montserrat),
                      )),
                    ],
                  )))

          // saleswithtax_Controller.model_reportitemwisetax.value!
          //                 .shopMobileno ==
          //             "" ||
          //         saleswithtax_Controller.model_reportitemwisetax
          //                 .value!.shopMobileno ==
          //             null
          //     ? SizedBox()
          //     : Container(
          //         margin: EdgeInsets.all(5),
          //         width: 150,
          //         // decoration: BoxDecoration(border: Border.all()),
          //         child: Center(
          //             child: AutoSizeText(
          //           "Mobile No: ${saleswithtax_Controller.model_reportitemwisetax.value!.shopMobileno}",
          //           maxFontSize: 12,
          //           minFontSize: 7,
          //           maxLines: 1,
          //           style: TextStyle(
          //               color: ColorsApp.COLOR_SECONDARY_TEXT,
          //               fontFamily: Fonts.font_Montserrat),
          //         ))),
          // saleswithtax_Controller
          //                 .model_reportitemwisetax.value!.shopGst ==
          //             "" ||
          //         saleswithtax_Controller
          //                 .model_reportitemwisetax.value!.shopGst ==
          //             null
          //     ? SizedBox()
          //     : Container(
          //         margin: EdgeInsets.all(5),
          //         width: 110,
          //         // decoration: BoxDecoration(border: Border.all()),
          //         child: Center(
          //             child: AutoSizeText(
          //           "Gst: ${saleswithtax_Controller.model_reportitemwisetax.value!.shopGst}",
          //           maxFontSize: 14,
          //           minFontSize: 7,
          //           maxLines: 1,
          //           style: TextStyle(
          //               color: ColorsApp.COLOR_SECONDARY_TEXT,
          //               fontFamily: Fonts.font_Montserrat),
          //         ))),
        ])
      ],
      // columnWidthMode: ColumnWidthMode.lastColumnFill,
      source: controller.sfdata!,
      tableSummaryRows: [
        GridTableSummaryRow(
            showSummaryInRow: false,
            columns: [
              const GridSummaryColumn(
                  name: 'TAXABLE',
                  columnName: 'TAXABLE',
                  summaryType: GridSummaryType.sum),
              const GridSummaryColumn(
                  name: 'TOTAL',
                  columnName: 'TOTAL',
                  summaryType: GridSummaryType.sum),
            ],
            position: GridTableSummaryRowPosition.bottom)
      ],

      columns: [
        GridColumn(
            width: 50,
            // minimumWidth: 10,
            // maximumWidth: 10,
            // columnWidthMode: ColumnWidthMode.auto,
            columnName: 'SL.NO',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Sl.No',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.visible))),
        GridColumn(
            width: 130,
            // columnWidthMode: ColumnWidthMode.fill,
            columnName: 'ITEMNAME',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Item Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.visible))),
        GridColumn(
            width: 130,
            // columnWidthMode: ColumnWidthMode.fill,
            columnName: 'CATEGORYNAME',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Category Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.visible))),
        GridColumn(
            width: 130,
            // columnWidthMode: ColumnWidthMode.fill,
            columnName: 'SECTIONNAME',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Section Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.visible))),
        GridColumn(
            width: 130,
            // columnWidthMode: ColumnWidthMode.fill,
            columnName: 'BILLNO',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Bill No.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.visible))),
        GridColumn(
            width: 130,
            // columnWidthMode: ColumnWidthMode.fill,
            columnName: 'QUANTITY',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Quantity',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.visible))),
        GridColumn(
            width: 130,
            // columnWidthMode: ColumnWidthMode.fill,
            columnName: 'RATE',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Rate',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.visible))),
                      GridColumn(
            width: 130,
            // columnWidthMode: ColumnWidthMode.fill,
            columnName: 'TAX',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Tax',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.visible))),
      
        GridColumn(
            width: 130,
            // columnWidthMode: ColumnWidthMode.fill,
            columnName: 'TAXABLE',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Taxable',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.visible))),
        GridColumn(
            width: 100,
            columnName: 'TOTAL',
            label: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: const Text('Total',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    overflow: TextOverflow.visible))),
      ],
    ));
  }
}