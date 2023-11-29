import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../Colours.dart';
import '../../../../Constants.dart';
import '../../../../Fonts.dart';
import '../controllers/reports_controller.dart';
import '../drawermodules.dart';


class ReportsView extends GetResponsiveView<ReportsController> {
  ReportsView({Key? key}) : super(key: key);
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

  Storelist_popup() {
    return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              // side: BorderSide(color: Colors.black87),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          contentPadding: EdgeInsets.only(top: 0),
          content: Stack(children: <Widget>[
            Container(
                // decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                height: 480,
                width: 550,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  // border: Border.all(),
                                  color: ColorsApp.COLOR_SECONDARY,
                                ),
                                padding: EdgeInsets.all(30),
                                child: ListView.builder(
                                  itemCount: controller
                                      .model_ownerapp_shopinfodata
                                      .value!
                                      .datainfo![0]
                                      .storeList!
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 8,
                                      child: ListTile(
                                        leading: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "${Constants.serverapi}/${controller.model_ownerapp_shopinfodata.value!.datainfo![0].storeList![index].shoplogo}",
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                            errorWidget:
                                                ((context, url, error) => Icon(
                                                      LineIcons.shoppingBag,
                                                      color: ColorsApp
                                                          .COLOR_SECONDARY_TEXT,
                                                    )),
                                          ),
                                        ),
                                        title: Text(
                                          "${controller.model_ownerapp_shopinfodata.value!.datainfo![0].storeList![index].shopname}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: Fonts.font_Montserrat,
                                              fontSize: 14),
                                        ),
                                        trailing: Obx(() => Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: ColorsApp
                                                          .COLOR_PRIMARY),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: controller
                                                              .model_ownerapp_shopinfodata
                                                              .value!
                                                              .datainfo![0]
                                                              .storeList![index]
                                                              .isSelected ==
                                                          true
                                                      ? ColorsApp.COLOR_PRIMARY
                                                      : ColorsApp
                                                          .COLOR_PRIMARY_TEXT),
                                              height: 25,
                                              width: 25,
                                              child: Center(
                                                  child: controller
                                                              .model_ownerapp_shopinfodata
                                                              .value!
                                                              .datainfo![0]
                                                              .storeList![index]
                                                              .isSelected ==
                                                          true
                                                      ? Icon(
                                                          LineIcons.check,
                                                          color: ColorsApp
                                                              .COLOR_PRIMARY_TEXT,
                                                          size: 17,
                                                        )
                                                      : null),
                                            )),
                                        // onLongPress: () {
                                        //    OwnerAppController.tileSelection(
                                        //   index: index);
                                        // },
                                        onTap: () {
                                          // revenueleakage_controller
                                          //     .tileSelection(index: index);
                                              
                                          // revenueleakage_controller.tileSelection(
                                          //     index: index);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ))),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: RoundedLoadingButton(
                              width: 120,
                              color: ColorsApp.COLOR_PRIMARY,
                              height: 30,
                              controller: controller.btn_controller,
                              onPressed: () async {
                                // revenueleakage_controller()
                                //     .shoplistselectdata_save();
                                controller.btn_controller.reset();
                                 controller.Drawer_Module_page.value =
                    Drawer_Modules.STORE_LIST;
                                Get.back();
                                
                              },
                              child: Text(
                                'DONE',
                                style: TextStyle(fontSize: 14),
                              ))),
                    ])),
            Positioned(
                top: 5,
                right: 3,
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorsApp.COLOR_PRIMARY),
                    child: Center(
                        child: IconButton(
                      icon: Icon(Icons.close,
                          color: ColorsApp.COLOR_PRIMARY_TEXT),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ))))
          ]),
        );
      },
    );
  }
}

class Desktop extends GetView<ReportsController> {
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdropColor: ColorsApp.COLOR_SECONDARY,
        openRatio: GetPlatform.isMobile ? .70 : .30,
        backdrop: Container(
          width: Get.width * .30,
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorsApp.COLOR_PRIMARY,
                ColorsApp.COLOR_PRIMARY.withOpacity(0.2)
              ],
            ),
          ),
        ),
        controller: controller.ControlleradvancedDrawer,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer:
        // SizedBox(),
         DrawerModule_view(),
        //  DrawerModuleView(),
        // Obx(() =>
        // Constants.Model_logined_userPrivileges.value != null
        //     ? DrawerModuleView()
        //     :
        //      SizedBox()),
        child: Scaffold(
            body: Obx(
          () => controller.is_loading.value == false
              ? Center(
                  child: CircularProgressIndicator(
                      color: ColorsApp.COLOR_PRIMARY, strokeWidth: 0.7),
                )
              : Column(
                  children: [
                    Constants.Appbar_dashboard(),
                    // Container(
                    //   height: Constants.appbar_desktop_height,
                    //   color: ColorsApp.COLOR_PRIMARY,
                    //   child: Row(children: [
                    //     Expanded(
                    //         child: Align(
                    //             alignment: Alignment.centerLeft,
                    //             child: Row(
                    //               children: [
                    //                 Padding(
                    //                     padding: EdgeInsets.all(8),
                    //                     child: IconButton(
                    //                         onPressed: () {
                    //                           controller.Click_moduleDrawer(
                    //                               controller);
                    //                         },
                    //                         icon: Icon(
                    //                           LineIcons.bars,
                    //                           color:
                    //                               ColorsApp.COLOR_PRIMARY_TEXT,
                    //                         ))),
                    //                 Container(
                    //                   width: 120,
                    //                   child: AutoSizeText(
                    //                       "${controller.model_ownerapp_shopinfodata.value!.datainfo![0].shopname ?? 0}",
                    //                       style: TextStyle(
                    //                           color:
                    //                               ColorsApp.COLOR_PRIMARY_TEXT,
                    //                           fontSize: 14,
                    //                           fontFamily:
                    //                               Fonts.font_Montserrat),
                    //                       maxLines: 1,
                    //                       minFontSize: 8),
                    //                 )
                    //               ],
                    //             ))),
                    //     controller.model_datepickerlist.value == null ||
                    //             controller.model_datepickerlist.value!
                    //                 .datepickerlist!.isEmpty
                    //         ? CircularProgressIndicator()
                    //         : actions_appbar_desktop(controller),
                  
                    //   ]),
                    // ),
                    // controller.Drawer_Module_page.value ==
                    //         Drawer_Modules.SALES_WITH_TAX_REPORT
                    //     ? saleswithtax_view()
                    //     : controller.Drawer_Module_page.value ==
                    //             Drawer_Modules.FOODCOUNT_REPORT
                    //         ? FoodCostReport_view()
                    //         : controller.Drawer_Module_page.value ==
                    //                 Drawer_Modules.STORE_LIST
                    //             ? revenueleakage_view()
                    //             : CircularProgressIndicator(
                    //                 color: ColorsApp.COLOR_PRIMARY,
                    //                 strokeWidth: 0.7,
                                  // )
                  ],
                ),
        )));
  }
}

class Mobile extends GetView<ReportsController> {
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdropColor: ColorsApp.COLOR_SECONDARY,
        openRatio: GetPlatform.isMobile ? .70 : .30,
        backdrop: Container(
          width: Get.width * .30,
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorsApp.COLOR_PRIMARY,
                ColorsApp.COLOR_PRIMARY.withOpacity(0.2)
              ],
            ),
          ),
        ),
        controller: controller.ControlleradvancedDrawer,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: 
        // SizedBox(),
        DrawerModule_view(),
        //  DrawerModuleView(),
        // Obx(() =>
        // Constants.Model_logined_userPrivileges.value != null
        //     ? DrawerModuleView()
        //     :
        //      SizedBox()),
        child: Scaffold(
            body: Obx(() => controller.is_loading.value == false
                ? Center(
                    child: CircularProgressIndicator(
                      color: ColorsApp.COLOR_PRIMARY,
                      strokeWidth: 0.7,
                    ),
                  )
                : Column(
                    children: [
                      Constants.Appbar_dashboard(),
                      // controller.OnClick_tile.value == false
                      //     ? SizedBox()
                      //     : Align(
                      //         alignment: Alignment.centerLeft,
                      //         child: Tooltip(
                      //             message: "Back to prevoius page",
                      //             child: IconButton(
                      //                 onPressed: () {
                      //                   OwnerAppController
                      //                               .OnClick_sfgridrow.value ==
                      //                           false
                      //                       ? OwnerAppController
                      //                           .OnClick_tile.value = false
                      //                       : OwnerAppController
                      //                           .OnClick_sfgridrow
                      //                           .value = false;
                      //                 },
                      //                 icon: Icon(Icons.exit_to_app_outlined)))),

                      // Obx(() => OwnerAppController
                      //             .model_ownerapp_revenueleakagedata.value ==
                      //         null
                      //     ? Container()
                      //     : OwnerAppController.OnClick_tile.value == false
                      //         ? ownerapp_revenueleakage()
                      //         : OwnerAppController.OnClick_sfgridrow.value ==
                      //                 false
                      //             ? revenueleakage_tiledata_first()
                      //             : revenueleakage_tiledata_second_mobile()),
                      // OwnerAppController.itemwisetax_selected.value == false
                      //     ? SizedBox()
                      //     :
                      // ReportItemwiseTaxController.is_loading.value ==
                      //         false
                      //     ? Center(
                      //         child: CircularProgressIndicator(
                      //           color: ColorsApp.COLOR_PRIMARY,
                      //           strokeWidth: 0.7,
                      //         ),
                      //       )
                      // :
                      // Obx(() => controller.Drawer_Module_page.value ==
                      //         Drawer_Modules.SALES_WITH_TAX_REPORT
                      //     ? saleswithtax_view()
                      //     : controller.Drawer_Module_page.value ==
                      //             Drawer_Modules.FOODCOUNT_REPORT
                      //         ? FoodCostReport_view()
                      //         : CircularProgressIndicator(
                      //             color: ColorsApp.COLOR_PRIMARY,
                      //             strokeWidth: 0.7,
                      //           ))
                      // )
                    ],
                  ))));
  }
}

actions_appbar_desktop(ReportsController controller) {
  return 
  ToggleSwitch(
      minWidth: 90,
      fontSize: 11,
      minHeight: 30.0,
      initialLabelIndex: controller.date_isselected.value,
      cornerRadius: 20.0,
      inactiveBgColor: ColorsApp.COLOR_PRIMARY,
      activeBgColor: [ColorsApp.COLOR_PRIMARY_TEXT],
      activeFgColor: ColorsApp.COLOR_PRIMARY,
      inactiveFgColor: ColorsApp.COLOR_PRIMARY_TEXT,
      customHeights: [30, 30, 30, 30, 60],
      customWidths: [120, 70, 100, 100, 160],
      customTextStyles: const [
        TextStyle(fontSize: 12),
        TextStyle(fontSize: 12),
        TextStyle(fontSize: 12),
        TextStyle(fontSize: 12),
        TextStyle(
          fontSize: 10,
        )
      ],
      labels: controller.model_datepickerlist.value!.datepickerlist!
          .map(
            (e) => e.index == 4
                ? '${e.text}\n ${e.from_date == null || e.from_date == "" ? DateFormat("yyy-MMM-dd").format(DateTime.now()) : DateFormat('yyy-MMM-dd').format(DateTime.parse(e.from_date!)).toString()}${e.to_date == null || e.to_date == "" ? DateFormat("yyy-MMM-dd").format(DateTime.now()) : DateFormat(' yyy-MMM-dd').format(DateTime.parse(e.to_date!)).toString()}'
                : e.text!,
          )
          .toList(),
      borderWidth: 1.0,
      borderColor: [ColorsApp.COLOR_PRIMARY_TEXT],
      onToggle: (index) async {
        controller.date_isselected.value = index!;
        var is_select = controller.model_datepickerlist.value!.datepickerlist!
            .where((element) => element.is_selected = false);
        print(is_select);
        controller.datepicker_assign(index: index);
      });
}

actions_appbar_mobile(ReportsController controller) {
  return ToggleSwitch(
      minWidth: 60,
      fontSize: 11,
      minHeight: 30.0,
      initialLabelIndex: controller.date_isselected.value,
      cornerRadius: 20.0,
      inactiveBgColor: ColorsApp.COLOR_PRIMARY,
      activeBgColor: [ColorsApp.COLOR_PRIMARY_TEXT],
      activeFgColor: ColorsApp.COLOR_PRIMARY,
      inactiveFgColor: ColorsApp.COLOR_PRIMARY_TEXT,
      customWidths: [42, 33, 43, 40, 50],
      customTextStyles: const [
        TextStyle(
          fontSize: 4,
        ),
        TextStyle(fontSize: 4),
        TextStyle(fontSize: 4),
        TextStyle(fontSize: 4),
        TextStyle(fontSize: 4)
      ],
      labels: controller.model_datepickerlist.value!.datepickerlist!
          .map(
            (e) => e.index == 4
                ? '${e.text}\n ${e.from_date == null || e.from_date == "" ? DateFormat("yyy-MMM-dd").format(DateTime.now()) : DateFormat('yyy-MMM-dd - ').format(DateTime.parse(e.from_date!)).toString()}${e.to_date == null || e.to_date == "" ? DateFormat("yyy-MMM-dd").format(DateTime.now()) : DateFormat('yyy-MMM-dd').format(DateTime.parse(e.to_date!)).toString()}'
                : e.text!,
          )
          .toList(),
      borderWidth: 0.8,
      borderColor: [ColorsApp.COLOR_PRIMARY_TEXT],
      onToggle: (index) async {
        controller.date_isselected.value = index!;
        var is_select = controller.model_datepickerlist.value!.datepickerlist!
            .where((element) => element.is_selected = false);
        print(is_select);
        controller.datepicker_assign(index: index);
      });
}
