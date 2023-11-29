import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vmenu_reports/app/modules/AppSettings/Controller/appsettings_controller.dart';
import 'package:vmenu_reports/app/modules/reports/controllers/reports_controller.dart';
import 'package:vmenu_reports/app/routes/app_pages.dart';
import '../../../../../Colours.dart';
import '../../../../../Constants.dart';
import '../../../../../Fonts.dart';
import '../../../../../main.dart';


class DrawerModule_view extends GetView {
  @override
  Widget build(BuildContext context) {
    // OwnerAppController().SearchModule();
    ReportsController controller = Get.find();
    return Drawer(
        backgroundColor: ColorsApp.COLOR_SECONDARY,
        elevation: 3,
        shadowColor: ColorsApp.COLOR_TERTIARY,
        width: Get.width * .30,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: ColorsApp.COLOR_PRIMARY,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/icon.png',
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 0,
                  child: Night_theme == true
                      ? GestureDetector(
                          onTap: () =>
                              Constants.restartApp(isnighttheme: false),
                          child: CircleAvatar(
                            backgroundColor: ColorsApp.COLOR_PRIMARY_TEXT,
                            radius: 15,
                            child: Icon(LineIcons.moon,
                                size: 16, color: ColorsApp.COLOR_PRIMARY),
                          ))
                      : GestureDetector(
                          onTap: () => Constants.restartApp(isnighttheme: true),
                          child: CircleAvatar(
                            backgroundColor: ColorsApp.COLOR_PRIMARY_TEXT,
                            radius: 15,
                            child: Icon(LineIcons.sun,
                                size: 16, color: ColorsApp.COLOR_PRIMARY),
                          ),
                        ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    // onTap: () => VersionDownload().CheckNewVertion(),
                    // onSecondaryLongPress: () => VersionUpload().UploadUi(),
                    child: RichText(
                      text: TextSpan(
                          text: 'V',
                          style: TextStyle(
                              fontFamily: Fonts.font_Montserrat,
                              color: ColorsApp.COLOR_SECONDARY_TEXT,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: Constants.App_Version.toString(),
                              style: TextStyle(
                                  fontFamily: Fonts.font_Montserrat,
                                  color: ColorsApp.COLOR_SECONDARY_TEXT,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Constants.TooltipCustom(
                      messege: 'Serverip',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            LineIcons.wiredNetwork,
                            color: ColorsApp.COLOR_SECONDARY_TEXT,
                          ),
                          AutoSizeText(
                              maxLines: 1,
                              minFontSize: 8,
                              maxFontSize: 13,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  color: ColorsApp.COLOR_SECONDARY_TEXT),
                              Constants.serverapi)
                        ],
                      ),
                    ),
                    Constants.TooltipCustom(
                      messege: 'Deviceip',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () async {
                              await  Appsettings_Controller().Getdata_report_settings();
                              await Appsettings_Controller.ClickAppsettingsettings();
                            },
                            icon: Icon(
                              LineIcons.mobilePhone,
                              color: ColorsApp.COLOR_SECONDARY_TEXT,
                            ),
                          ),
                          AutoSizeText(
                              maxLines: 1,
                              minFontSize: 8,
                              maxFontSize: 13,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  color: ColorsApp.COLOR_SECONDARY_TEXT),
                              ""
                              // controller.wifiName
                              )
                        ],
                      ),
                    )
                  ]),
            ),
            // Padding(
            //     padding: EdgeInsets.all(5),
            //     child: SizedBox(
            //       height: 50,
            //       child: TextFormField(
            //         style: TextStyle(color: ColorsApp.COLOR_SECONDARY_TEXT),

            //         onChanged: (value) {
            //           DrawerModuleController().SearchModule(keyvalue: value);
            //         },
            //         // controller: controller.txt_search,
            //         decoration: InputDecoration(
            //             focusedBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                   color: ColorsApp.COLOR_SECONDARY_TEXT,
            //                   width: 1.3),
            //               borderRadius: BorderRadius.circular(10.0),
            //             ),
            //             border: OutlineInputBorder(
            //                 borderSide: BorderSide(
            //                   color: ColorsApp.COLOR_SECONDARY_TEXT,
            //                 ),
            //                 borderRadius: BorderRadius.circular(8)),
            //             disabledBorder: OutlineInputBorder(
            //                 borderSide: BorderSide(
            //                   color: ColorsApp.COLOR_SECONDARY_TEXT,
            //                 ),
            //                 borderRadius: BorderRadius.circular(8)),
            //             enabledBorder: OutlineInputBorder(
            //                 borderSide: BorderSide(
            //                   color: ColorsApp.COLOR_SECONDARY_TEXT,
            //                 ),
            //                 borderRadius: BorderRadius.circular(8)),
            //             floatingLabelAlignment: FloatingLabelAlignment.start,
            //             labelText: " Search Module".capitalize,
            //             labelStyle: TextStyle(
            //                 color: ColorsApp.COLOR_SECONDARY_TEXT,
            //                 fontSize: 13,
            //                 fontStyle: FontStyle.italic),
            //             suffixIcon: IconButton(
            //                 onPressed: () {},
            //                 icon: Icon(
            //                   Icons.search_sharp,
            //                   color: ColorsApp.COLOR_SECONDARY_TEXT,
            //                 ))),
            //       ),
            //     )),
            // Expanded(
            //     child: Obx(() => DrawerModuleController().LoaddrawerData())),

            ListTile(
              title: Text("Sales with TaxReport",
                  style: TextStyle(
                      color: ColorsApp.COLOR_SECONDARY_TEXT,
                      fontFamily: Fonts.font_Montserrat,
                      fontSize: GetPlatform.isMobile ? 12 : 17)),
              onTap: () {
               controller. Drawer_Module_page.value=Drawer_Modules.SALES_WITH_TAX_REPORT;
                controller.mainpage.value=false;
                  Get.toNamed(Routes.SALES_WITH_TAX_REPORT);
                  controller.ControlleradvancedDrawer.hideDrawer();
                // ReportItemwiseTaxController().GetData();
                // OwnerAppController.itemwisetax_selected.value = true;
                // controller.Drawer_Module_page.value =
                //     Drawer_Modules.SALES_WITH_TAX_REPORT;
                // controller.ControlleradvancedDrawer.hideDrawer();

                // ReportItemwiseTaxController.is_loading.value = false;
              },
            ),
            ListTile(
              title: Text("Food Cost Report",
                  style: TextStyle(
                      color: ColorsApp.COLOR_SECONDARY_TEXT,
                      fontFamily: Fonts.font_Montserrat,
                      fontSize: GetPlatform.isMobile ? 12 : 17)),
              onTap: () {
                 controller. Drawer_Module_page.value=Drawer_Modules.FOODCOUNT_REPORT;
                controller.mainpage.value=false; 
                    Get.toNamed(Routes.FOODCOST_REPORT);
                  controller.ControlleradvancedDrawer.hideDrawer();

                // // FoodCostReport_Controller().GetData();
                // controller.Drawer_Module_page.value =
                //     Drawer_Modules.FOODCOUNT_REPORT;
                // // controller.foodcost_selected.value = true;
                // controller.ControlleradvancedDrawer.hideDrawer();

                // ReportItemwiseTaxController.is_loading.value = false;
              },
            ), 
            // ListTile(
            //   title: Text("Store List",
            //       style: TextStyle(
            //           color: ColorsApp.COLOR_SECONDARY_TEXT,
            //           fontFamily: Fonts.font_Montserrat,
            //           fontSize: GetPlatform.isMobile ? 12 : 17)),
            //   onTap: () {
            //     controller.mainpage.value=false;
            //     // FoodCostReport_Controller().GetData();
            //     // controller.Drawer_Module_page.value =
            //     //     Drawer_Modules.STORE_LIST;
            //         // ReportsView().Storelist_popup();
            //     // controller.foodcost_selected.value = true;
            //     controller.ControlleradvancedDrawer.hideDrawer();

            //     // ReportItemwiseTaxController.is_loading.value = false;
            //   },
            // )
          ],
        ));
  }
}
