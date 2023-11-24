import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vmenu_reports/app/modules/foodcost_report/views/sfgrid_view.dart';
import 'package:vmenu_reports/app/modules/reports/controllers/reports_controller.dart';

import '../../../../Colours.dart';
import '../../../../Constants.dart';
import '../../../../Fonts.dart';
import '../../reports/model/model_reports_shopinfo_model.dart';
import '../controllers/foodcost_report_controller.dart';


class FoodcostReportView extends GetResponsiveView <FoodcostReportController> {
   FoodcostReportView({Key? key}) : super(key: key);
  @override
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
class Desktop extends GetView<FoodcostReportController> {
  ReportsController reportscontroller1=Get.find();
  @override
  Widget build(BuildContext context) {
  return  
  
  
   Scaffold(
      body:  Column(
        children: [
          Constants.Appbar(),
          Expanded(child: 
      Card(
        color: ColorsApp.COLOR_SECONDARY,
        margin: EdgeInsets.all(10),
        elevation: 10,
        child:
            // Expanded(child: sfgrid_ReportItemwiseTax().sfgridview())
            Column(children: [
          Container(
            margin: EdgeInsets.only(
              top: 35,
            ),
            height: 60,
            width: Get.width,
            child: Row(children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 40,
                width: 150,
                child: TextFormField(
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
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
                        contentPadding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorsApp.COLOR_PRIMARY)),
                        labelText: "From Date".capitalize!,
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: ColorsApp.COLOR_PRIMARY,
                            fontFamily: Fonts.font_Montserrat,
                            fontSize: 14),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsApp.COLOR_NIGHT_PRIMARY),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        )),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller
                                  .fromdate(Get.context!);
                            },
                            icon: Icon(
                              LineIcons.calendarAlt,
                              color: Colors.black,
                            )))),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 40,
                width: 150,
                child: TextFormField(
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
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
                        contentPadding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorsApp.COLOR_PRIMARY)),
                        labelText: " To Date".capitalize!,
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: ColorsApp.COLOR_PRIMARY,
                            fontFamily: Fonts.font_Montserrat,
                            fontSize: 14),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsApp.COLOR_NIGHT_PRIMARY),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        )),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.todate(Get.context!);
                            },
                            icon: Icon(
                              LineIcons.calendarAlt,
                              color: Colors.black,
                            )))),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(6)),
                height: 40,
                width: 180,
                child: Obx(() =>
                    //  controller.is_loading_sfgri.value ==
                    //                     false
                    //                 ? Center(
                    //                     child: CircularProgressIndicator(
                    //                       color: ColorsApp.COLOR_PRIMARY,
                    //                       strokeWidth: 0.7,
                    //                     ),
                    //                   ):
   
                    DropdownButton<dynamic>(
                        icon: Icon(
                          LineIcons.angleDown,size: 15,
                          color: ColorsApp.COLOR_SECONDARY_TEXT,
                        ),
                        isExpanded: true,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        dropdownColor: ColorsApp.COLOR_SECONDARY,
                        style: TextStyle(
                            fontFamily: Fonts.font_Montserrat,
                            color: ColorsApp.COLOR_SECONDARY_TEXT),
                        borderRadius: BorderRadius.circular(10),
                        underline: SizedBox(),
                        hint: Text(
                            controller.slct_dropdown.value),
                        // Text('Choose Outlet',style: TextStyle(color: ColorsApp.COLOR_SECONDARY_TEXT,fontSize: 14,fontFamily: Fonts.font_Montserrat),),
                        items: controller.dropdownlist
                            .map((item) {
                          return DropdownMenuItem<dynamic>(
                            alignment: Alignment.center,
                            value: item,
                            child: Text(item.toString()),
                          );
                        }).toList(),
                        disabledHint: Text("Can't select"),
                        onChanged: (newVal) {
                          print("object$newVal");
                          controller.slct_dropdown.value =
                              newVal;
                          // print( FoodCostReport_Controller.slct_dropdown.value);
                        },
                        value:
                            controller.slct_dropdown.value)),
              ), Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(6)),
                height: 40,
                width: 180,
                child: Obx(() =>
                    //  ReportItemwiseTaxController.is_loading_sfgri.value ==
                    //                     false
                    //                 ? Center(
                    //                     child: CircularProgressIndicator(
                    //                       color: ColorsApp.COLOR_PRIMARY,
                    //                       strokeWidth: 0.7,
                    //                     ),
                    //                   ):
   
                    DropdownButton<StoreList>(
                        icon: Icon(
                          LineIcons.store,size: 18,
                          color: ColorsApp.COLOR_SECONDARY_TEXT,
                        ),
                        isExpanded: true,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(2),
                        dropdownColor: ColorsApp.COLOR_SECONDARY,
                        style: TextStyle(
                            fontFamily: Fonts.font_Montserrat,
                            color: ColorsApp.COLOR_SECONDARY_TEXT),
                        borderRadius: BorderRadius.circular(10),
                        underline: SizedBox(),
                        hint: Text(
                           "${reportscontroller1.model_ownerapp_shopinfodata.value!.datainfo![0].storeList![0].shopname}"),
                        // Text('Choose Outlet',style: TextStyle(color: ColorsApp.COLOR_SECONDARY_TEXT,fontSize: 14,fontFamily: Fonts.font_Montserrat),),
                        items: reportscontroller1.model_ownerapp_shopinfodata
                            .value!.datainfo![0].storeList!
                            .map((item) {
                          return DropdownMenuItem<StoreList>(
                            alignment: Alignment.center,
                            value: item,
                            child: Text(item.shopname.toString()),
                          );
                        }).toList(),
                        disabledHint: Text("Can't select"),
                        onChanged: (newVal) {
                          controller.dropdown_shoplist.value =
                              newVal;
                          controller.shoplist = {
                            "shopname": newVal!.shopname,
                            "db_name": newVal.shopdatabase
                          };
                          print(controller.shoplist);
                        },
                        value:
                            controller.dropdown_shoplist.value)),
              ),
              IconButton(
                  onPressed: () {
                    controller.GetData();
                  },
                  iconSize: 100,
                  color: ColorsApp.COLOR_PRIMARY,
                  icon: Container(
                      height: 30,
                      width: 150,
                      color: ColorsApp.COLOR_PRIMARY,
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
                          color: ColorsApp.COLOR_PRIMARY,
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
                            color: ColorsApp.COLOR_PRIMARY,
                          )))
                ],
              ))
            ]),
          ),
          Obx(() => 
          controller.model_foodstock.value==null? SizedBox():
          
          controller.is_loading_sfgrid.value == false
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ColorsApp.COLOR_PRIMARY,
                      strokeWidth: 0.7,
                    ),
                  ),
                )
              :
              Obx(() =>controller.Sfgrid_page.value==SFGRIDS.summary?  Sfgrid_summarized_view().sfgridview(controller):Sfgrid_detailed_view().sfgridview(controller))
      )]),
      )),])
   )
   ;


  }}

  class Mobile extends GetView<FoodcostReportController> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }}