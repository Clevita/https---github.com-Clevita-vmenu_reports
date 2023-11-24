// ignore_for_file: unrelated_type_equality_checks
import 'package:auto_size_text/auto_size_text.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_horizontal_divider/flutter_horizontal_divider.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vmenu_reports/Fonts.dart';
import 'package:vmenu_reports/app/modules/report_settings/model/model_report_settings_model.dart';
import '../../../../../Colours.dart';
import '../Controller/appsettings_controller.dart';



class Appsettings_View extends GetResponsiveView {
  Appsettings_View({super.key});

  @override
  Widget builder() {
    if (screen.isDesktop) {
      return Desktop();
    } else if (screen.isPhone) {
      return Mobile();
    } else if (screen.isTablet) {
      return Desktop();
    } else {
      return Desktop();
    }
  }


// class Desktop extends GetView<Appsettings_Controller> {
//   @override
//   Widget build(BuildContext context) {
     // ignore: non_constant_identifier_names
     Desktop(){
    return
    showModalBottomSheet(isDismissible: false,
    isScrollControlled: true,
        context: Get.context!,
        builder: (BuildContext bc) {
    return
    
     Container(
      width: Get.width * 0.95,
      height:Get.height * 0.9 ,
      decoration: BoxDecoration(color: ColorsApp.COLOR_SECONDARY),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "SETTINGS",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: ColorsApp.COLOR_SECONDARY_TEXT,
                      fontFamily: Fonts.font_Montserrat,
                      fontSize: 19),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
                // color: Colors.amber,
                // decoration: BoxDecoration(border: Border.all()),
                padding: const EdgeInsets.all(10),
                height: Get.height*0.78,
                width: Get.width * 0.35,
                child: Obx(() =>
                    Appsettings_Controller.is_loading.value == false
                        ? Center(
                            child: CircularProgressIndicator(
                                color: ColorsApp.COLOR_PRIMARY,
                                strokeWidth: 0.7))
                        : ListView.builder(
                            itemCount: Appsettings_Controller
                                .modelJson!['report_settings'][0].keys.length+1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Card(
                                  elevation: 10,
                                  child: Container(
                                      margin: const EdgeInsets.all(10),
                                      // color: ColorsApp.COLOR_SECONDARY,
                                      child: Column(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Report Based On",
                                                style: TextStyle(
                                                    color: ColorsApp
                                                        .COLOR_SECONDARY_TEXT,
                                                    fontFamily:
                                                        Fonts.font_Montserrat,
                                                    fontSize: 16),
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: ToggleSwitch(
                                                minWidth: 98.0,
                                                minHeight: 30.0,
                                                // initialLabelIndex: 2,
                                                initialLabelIndex:
                                                    Appsettings_Controller
                                                                .model_appsettings
                                                                .value!
                                                                .reportSettings!
                                                                .first
                                                                .reportbasedon!
                                                                .type ==
                                                            "daywise"
                                                        ? 0
                                                        : 1,
                                                // Appsettings_Controller
                                                //     .toogle_isselected.value,
                                                cornerRadius: 20.0,
                                                // activeFgColor: ColorsApp.COLOR_SECONDARY,
                                                inactiveBgColor: ColorsApp
                                                    .COLOR_PRIMARY_TEXT,
                                                inactiveFgColor: ColorsApp
                                                    .COLOR_PRIMARY_TEXT,
                                                totalSwitches: 2,

                                                labels: const [
                                                  "daywise",
                                                  "Customtime"
                                                ],
                                                borderWidth: 1.2,
                                                borderColor: [
                                                  ColorsApp.COLOR_PRIMARY
                                                ],
                                                activeBgColor: [
                                                  ColorsApp.COLOR_PRIMARY
                                                ],
                                                customTextStyles: const [
                                                  TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                  TextStyle(fontSize: 12)
                                                ],
                                                onToggle: (index) {
                                                  Appsettings_Controller
                                                      .toogle_isselected
                                                      .value = index!;
                                                  Appsettings_Controller
                                                          .model_appsettings
                                                          .value!
                                                          .reportSettings!
                                                          .first
                                                          .reportbasedon!
                                                          .type =
                                                      index == 0
                                                          ? "daywise"
                                                          : "Customtime";
                                                  Appsettings_Controller
                                                      .model_appsettings
                                                      .refresh();
                                                  print(Appsettings_Controller
                                                      .model_appsettings.value!
                                                      .toJson());
                                                },
                                              )),
                                          Obx(
                                              () =>
                                                  Appsettings_Controller
                                                              .model_appsettings
                                                              .value!
                                                              .reportSettings!
                                                              .first
                                                              .reportbasedon!
                                                              .type ==
                                                          "daywise"
                                                      ? Container(
                                                          margin:
                                                              const EdgeInsets.all(
                                                                  10),
                                                          height: 70,
                                                          width: 500,
                                                          // color: Colors.amber,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black12)),
                                                          child: Row(children: [
                                                            Center(
                                                              child: Container(
                                                                  width: 100,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .black12),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4)),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                            border:
                                                                                Border.all(),
                                                                            borderRadius: BorderRadius.circular(5)),
                                                                        height:
                                                                            25,
                                                                        width:
                                                                            25,
                                                                        child: const Center(
                                                                            child: Icon(
                                                                          LineIcons
                                                                              .check,
                                                                          size:
                                                                              18,
                                                                        )),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(10),
                                                                        child:
                                                                            Text(
                                                                          "Next Day",
                                                                          style: TextStyle(
                                                                              color: ColorsApp.COLOR_SECONDARY_TEXT,
                                                                              fontFamily: Fonts.font_Montserrat,
                                                                              fontSize: 13),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )),
                                                            ),
                                                            Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            1),
                                                                height: 40,
                                                                width: 150,
                                                                child:Container(
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DateTimeField(
              resetIcon:Icon(Icons.edit,color: ColorsApp.COLOR_SECONDARY_TEXT,size:15,),
              initialValue: DateTime.now(),
              format:Appsettings_Controller().format,
              decoration: const InputDecoration(labelText: "Choose Time"),
              onShowPicker: (context, currentValue) async {
                Appsettings_Controller.time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: false),
                      child: child!,
                    );
                  },
                );
                return DateTimeField.convert(Appsettings_Controller.time);
              },
            ),
          ),
        ),
                                                               
                                                                        ),
                                                            Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            1),
                                                                height: 40,
                                                                width: 150,
                                                                child: TextFormField(
                                                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: Fonts.font_Montserrat),
                                                                    // textAlign: TextAlign.center,
                                                                    onTap: () {
                                                                      Appsettings_Controller.txt_todate_controller.selection = TextSelection(
                                                                          baseOffset:
                                                                              0,
                                                                          extentOffset: Appsettings_Controller
                                                                              .txt_todate_controller
                                                                              .value
                                                                              .text
                                                                              .length);
                                                                    },
                                                                    autofocus: true,
                                                                    controller: Appsettings_Controller.txt_todate_controller,
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp('[a-zA-Z0-9- ]')),
                                                                    ],
                                                                    decoration: InputDecoration(
                                                                        contentPadding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                                                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsApp.COLOR_PRIMARY)),
                                                                        labelText: "End Date".capitalize!,
                                                                        labelStyle: TextStyle(fontStyle: FontStyle.italic, color: ColorsApp.COLOR_PRIMARY, fontFamily: Fonts.font_Montserrat, fontSize: 12),
                                                                        border: OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: ColorsApp.COLOR_NIGHT_PRIMARY),
                                                                        ),
                                                                        enabledBorder: const OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                        suffixIcon: Padding(
                                                                            padding: const EdgeInsets.only(left: 15),
                                                                            child: InkWell(
                                                                              onTap: () {
                                                                                Appsettings_Controller().todate(Get.context!);
                                                                              },
                                                                              child: const Icon(
                                                                                size: 16,
                                                                                LineIcons.calendarAlt,
                                                                                color: Colors.black,
                                                                              ),
                                                                            ))

                                                                        //  IconButton(
                                                                        //     onPressed: () {
                                                                        //       ReportItemwiseTaxController().fromdate(Get.context!);
                                                                        //     },padding: EdgeInsets.only(left: 15),
                                                                        //     icon: Icon(size: 12,
                                                                        //       LineIcons.calendarAlt,
                                                                        //       color: Colors.black,
                                                                        //     ))
                                                                        )))
                                                          ]),
                                                        )
                                                      : const SizedBox())
                                        ],
                                      )),
                                );
                              } else if (index == 1) {
                                return Card(
                                  elevation: 10,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    // height: 60,
                                    // width: 50,
                                    // color: ColorsApp.COLOR_SECONDARY,
                                    child: Row(children: [
                                      Text(
                                        "Currency",
                                        style: TextStyle(
                                            color:
                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                            fontFamily: Fonts.font_Montserrat,
                                            fontSize: 16),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        height: 40,
                                        width: 180,
                                        child: Obx(() => DropdownButton<
                                                Currency>(
                                            icon: Icon(
                                              LineIcons.angleDown,
                                              size: 15,
                                              color: ColorsApp
                                                  .COLOR_SECONDARY_TEXT,
                                            ),
                                            // isExpanded: true,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(2),
                                            dropdownColor:
                                                ColorsApp.COLOR_SECONDARY,
                                            style: TextStyle(
                                                fontFamily:
                                                    Fonts.font_Montserrat,
                                                color: ColorsApp
                                                    .COLOR_SECONDARY_TEXT),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            underline: const SizedBox(),
                                            hint: Text(
                                                "${Appsettings_Controller.model_appsettings.value!.reportSettings!.first.currency![0].name}"),
                                            // // Text('Choose Outlet',style: TextStyle(color: ColorsApp.COLOR_SECONDARY_TEXT,fontSize: 14,fontFamily: Fonts.font_Montserrat),),
                                            items: Appsettings_Controller
                                                .model_appsettings
                                                .value!
                                                .reportSettings!
                                                .first
                                                .currency!
                                                .map((item) {
                                              return DropdownMenuItem<Currency>(
                                                alignment: Alignment.center,
                                                value: item,
                                                child:
                                                    Text(item.name.toString()),
                                              );
                                            }).toList(),
                                            disabledHint: const Text("Can't select"),
                                            onChanged: (newVal) {
                                              Appsettings_Controller
                                                  .dropdown_Currency
                                                  .value = newVal;
                                              // Appsettings_Controller.model_appsettings.value!.reportSettings!.first.currency
                                            },
                                            value:
                                            
                                            Appsettings_Controller.dropdown_Currency.value ==
                                                                  '' ||
                                                             Appsettings_Controller.dropdown_Currency.value ==
                                                                  0
                                                          ?  Appsettings_Controller
                                                              .model_appsettings.value!.reportSettings!.first.currency![0]
                                                          : Appsettings_Controller
                                                              .dropdown_Currency
                                                              .value
                                             )),
                                      ),
                                    ]),
                                  ),
                                );
                              } else if (index == 2) {
                                return Card(
                                  elevation: 10,
                                  child: Container(
                                      // height: ,
                                      width: 50,
                                      // color: Colors.blue,
                                      child:
                                          // Column(children: [
                                          //   Text("data"),
                                          Obx(
                                        () => Appsettings_Controller
                                                    .model_appsettings.value ==
                                                null
                                            ? const SizedBox()
                                            : Container(
                                                padding: const EdgeInsets.all(10),
                                                width: 300,
                                                // decoration: BoxDecoration(
                                                //     border: Border.all(
                                                //         color: ColorsApp
                                                //             .COLOR_SECONDARY_TEXT)),
                                                child: Column(children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "AppTheme",
                                                        // '${Settings_generalSettings_controller.model_App_theme.value!.settingsData![0].settingsName}',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: ColorsApp
                                                              .COLOR_SECONDARY_TEXT,
                                                          fontFamily: Fonts
                                                              .font_Montserrat,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * .01,
                                                  ),
                                                  ToggleSwitch(
                                                      minWidth: 54.0,
                                                      minHeight: 30.0,
                                                      initialLabelIndex:
                                                          Appsettings_Controller
                                                              .model_appsettings
                                                              .value!
                                                              .reportSettings![
                                                                  0]
                                                              .theme!
                                                              .selectedTheme,
                                                      cornerRadius: 20.0,
                                                      totalSwitches: 5,
                                                      fontSize: 8,
                                                      labels: const [
                                                        'Theme\n 1',
                                                        'Theme\n 2',
                                                        'Theme\n 3',
                                                        'Theme\n 4',
                                                        'Theme\n 5'
                                                      ],
                                                      borderWidth: 2.0,
                                                      activeFgColor: ColorsApp
                                                          .COLOR_PRIMARY_TEXT,
                                                      inactiveBgColor: ColorsApp
                                                          .COLOR_SECONDARY_TEXT,
                                                      inactiveFgColor: ColorsApp
                                                          .COLOR_SECONDARY,
                                                      borderColor: [
                                                        ColorsApp
                                                            .COLOR_SECONDARY_TEXT
                                                      ],
                                                      activeBgColor: [
                                                        ColorsApp.COLOR_PRIMARY
                                                      ],
                                                      onToggle: (index) {
                                                        print(index);
                                                        // Settings_generalSettings_controller
                                                        //     .apptheme_toggle(index);
                                                      }),
                                                  const SizedBox(height: 5),
                                                  Container(
                                                    // color: Colors.amber,
                                                    width: 300,
                                                    height: 75,
                                                    child: Stack(children: [
                                                      Positioned(
                                                          top: 10,
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(15,
                                                                    15, 40, 0),
                                                            width: 275,
                                                            height: 60,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    // border: Border(),
                                                                    ),
                                                            child: Obx(
                                                              () => Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Background',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  ),
                                                                  VerticalDivider(
                                                                      width: 2,
                                                                      color: ColorsApp
                                                                          .COLOR_SECONDARY_TEXT),
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Text',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          top: 3,
                                                          child: Container(
                                                              width: 275,
                                                              child: HorizontalDivider(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT))),
                                                      Positioned(
                                                          left: 5,
                                                          child: Container(
                                                              color: ColorsApp
                                                                  .COLOR_SECONDARY,
                                                              child: Text(
                                                                'Primary',
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT,
                                                                  fontFamily: Fonts
                                                                      .font_Montserrat,
                                                                ),
                                                              )))
                                                    ]),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Container(
                                                    width: 300,
                                                    height: 75,
                                                    child: Stack(children: [
                                                      Positioned(
                                                          top: 10,
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(15,
                                                                    15, 40, 0),
                                                            width: 275,
                                                            height: 60,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    // border: Border.all(),
                                                                    ),
                                                            child: Obx(
                                                              () => Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Background',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  ),
                                                                  VerticalDivider(
                                                                      width: 2,
                                                                      color: ColorsApp
                                                                          .COLOR_SECONDARY_TEXT),
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Text',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          top: 3,
                                                          child: Container(
                                                              width: 275,
                                                              child: HorizontalDivider(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT))),
                                                      Positioned(
                                                          left: 5,
                                                          child: Container(
                                                              color: ColorsApp
                                                                  .COLOR_SECONDARY,
                                                              child: Text(
                                                                'Secondary',
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT,
                                                                  fontFamily: Fonts
                                                                      .font_Montserrat,
                                                                ),
                                                              )))
                                                    ]),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Container(
                                                    width: 300,
                                                    height: 75,
                                                    child: Stack(children: [
                                                      Positioned(
                                                          top: 10,
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(15,
                                                                    15, 40, 0),
                                                            width: 275,
                                                            height: 60,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    // border: Border.all(),
                                                                    ),
                                                            child: Obx(
                                                              () => Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Background',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  ),
                                                                  VerticalDivider(
                                                                      width: 2,
                                                                      color: ColorsApp
                                                                          .COLOR_SECONDARY_TEXT),
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Text',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          top: 3,
                                                          child: Container(
                                                              width: 275,
                                                              child: HorizontalDivider(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT))),
                                                      Positioned(
                                                          left: 5,
                                                          child: Container(
                                                              color: ColorsApp
                                                                  .COLOR_SECONDARY,
                                                              child: Text(
                                                                'Tertiary',
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT,
                                                                  fontFamily: Fonts
                                                                      .font_Montserrat,
                                                                ),
                                                              )))
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  RoundedLoadingButton(
                                                      width: 100,
                                                      height: 40,
                                                      color: ColorsApp
                                                          .COLOR_PRIMARY,
                                                      controller:
                                                          Appsettings_Controller
                                                              .btn_apptheme_controller,
                                                      onPressed: () {
                                                        Appsettings_Controller()
                                                            .App_Theme_saveData();
                                                      },
                                                      child: Text(
                                                        'SAVE',
                                                        style: TextStyle(
                                                            fontFamily: Fonts
                                                                .font_Montserrat,
                                                            color: ColorsApp
                                                                .COLOR_PRIMARY_TEXT),
                                                      ))
                                                ])),
                                      )
                                      // ]),
                                      ),
                                );
                              } else if (index == 3) {
                                return Container(
                                  child: Stack(
                                    children: [
                                      Card(
                                          elevation: 10,
                                          child: Padding(
                                              padding: const EdgeInsets.all(25),
                                              child: Container(
                                                height: Get.height*0.3,
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black12)),
                                                child: Obx(() => Wrap(
                                                      children: [
                                                        for (var a
                                                            in Appsettings_Controller
                                                                .model_appsettings
                                                                .value!
                                                                .reportSettings![
                                                                    0]
                                                                .modules!)
                                                          GestureDetector(
                                                            onTap: () {
                                                              Appsettings_Controller
                                                                      .is_moduletile_slct
                                                                      .value =
                                                                  !Appsettings_Controller
                                                                      .is_moduletile_slct
                                                                      .value;
                                                              a.active =
                                                                  Appsettings_Controller
                                                                      .is_moduletile_slct
                                                                      .value;
                                                              Appsettings_Controller
                                                                  .model_appsettings
                                                                  .refresh();
                                                            },
                                                            child: Container(
                                                                width: 180,
                                                                height: 40,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            25),
                                                                child: Card(
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        margin:
                                                                            const EdgeInsets.all(3),
                                                                        width:
                                                                            130,
                                                                        child: AutoSizeText(
                                                                            "${a.name.toString().capitalize}",
                                                                            minFontSize:
                                                                                8,
                                                                            maxLines:
                                                                                2,
                                                                            maxFontSize:
                                                                                12,
                                                                            style:
                                                                                TextStyle(color: ColorsApp.COLOR_SECONDARY_TEXT, fontFamily: Fonts.font_Montserrat)),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(5),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              15,
                                                                          width:
                                                                              15,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(30),
                                                                              border: Border.all(),
                                                                              color: a.active == true ? ColorsApp.COLOR_PRIMARY : ColorsApp.COLOR_SECONDARY),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  // width: 100,
                                                                )),
                                                          )
                                                      ],
                                                    )),
                                              ))),
                                      Positioned(
                                          top: 5,
                                          left: 40,
                                          child: Container(
                                            // color: Colors.white,
                                            padding: const EdgeInsets.all(12),
                                            child: Text(
                                              "Modules",
                                              style: TextStyle(
                                                  color: ColorsApp
                                                      .COLOR_SECONDARY_TEXT,
                                                  fontFamily:
                                                      Fonts.font_Montserrat,
                                                  fontSize: 16),
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              }
                              else if(index==4){
                                return  Padding(
                          padding: const EdgeInsets.all(5),
                          child: RoundedLoadingButton(
                              width: 120,
                              color: ColorsApp.COLOR_PRIMARY,
                              height: 30,
                              controller: Appsettings_Controller.btn_apptheme_controller,
                              // controller: controller.btn_controller,
                              onPressed: () async {
                    
                              },
                              child: Text(
                                'ADD',
                                style: TextStyle(fontSize: 14,color: ColorsApp.COLOR_SECONDARY),
                              )));
                              }
                            },
                          )))
          ],
        ),
        // Positioned(child: child),
        Positioned(
            top: 2,
            right: 2,
            child: IconButton(
              icon: Icon(Icons.close, color: ColorsApp.COLOR_SECONDARY_TEXT),
              onPressed: () {
                Get.back();
              },
            )),
            // Positioned(bottom: 1,left: 10,  child:  Padding(
            //               padding: EdgeInsets.all(5),
            //               child: RoundedLoadingButton(
            //                   width: 120,
            //                   color: ColorsApp.COLOR_PRIMARY,
            //                   height: 30,
            //                   controller:Appsettings_Controller.btn_apptheme_controller,
            //                   // controller: controller.btn_controller,
            //                   onPressed: () async {
            //                     // controller.save(datalist: datalist);
            //                     // Bank_controller.btn_controller.reset();
            //                   },
            //                   child: Text(
            //                     'ADD',
            //                     style: TextStyle(fontSize: 14),
            //                   ))))
      ]),
    );
  });
}

// class Mobile extends GetView<filterDataController> {
//   @override
//   Widget build(BuildContext context) {
  Mobile(){
      showModalBottomSheet(isDismissible: false,
        context: Get.context!,
        builder: (BuildContext bc) {
    return Container(
      width: Get.width * 0.95,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "SETTINGS",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: ColorsApp.COLOR_SECONDARY_TEXT,
                      fontFamily: Fonts.font_Montserrat,
                      fontSize: 19),
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
                // color: Colors.amber,
                // decoration: BoxDecoration(border: Border.all()),
                padding: const EdgeInsets.all(10),
                height: Get.height - 100,
                width: Get.width * 0.35,
                child: Obx(() =>
                    Appsettings_Controller.is_loading.value == false
                        ? Center(
                            child: CircularProgressIndicator(
                                color: ColorsApp.COLOR_PRIMARY,
                                strokeWidth: 0.7))
                        : ListView.builder(
                            itemCount: Appsettings_Controller
                                .modelJson!['report_settings'][0].keys.length,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Card(
                                  elevation: 10,
                                  child: Container(
                                      margin: const EdgeInsets.all(10),
                                      color: ColorsApp.COLOR_SECONDARY,
                                      child: Column(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Report Based On",
                                                style: TextStyle(
                                                    color: ColorsApp
                                                        .COLOR_SECONDARY_TEXT,
                                                    fontFamily:
                                                        Fonts.font_Montserrat,
                                                    fontSize: 16),
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: ToggleSwitch(
                                                minWidth: 98.0,
                                                minHeight: 30.0,
                                                // initialLabelIndex: 2,
                                                initialLabelIndex:
                                                    Appsettings_Controller
                                                                .model_appsettings
                                                                .value!
                                                                .reportSettings!
                                                                .first
                                                                .reportbasedon!
                                                                .type ==
                                                            "daywise"
                                                        ? 0
                                                        : 1,
                                                // Appsettings_Controller
                                                //     .toogle_isselected.value,
                                                cornerRadius: 20.0,
                                                // activeFgColor: ColorsApp.COLOR_SECONDARY,
                                                inactiveBgColor: ColorsApp
                                                    .COLOR_PRIMARY_TEXT,
                                                inactiveFgColor: ColorsApp
                                                    .COLOR_PRIMARY_TEXT,
                                                totalSwitches: 2,

                                                labels: const [
                                                  "daywise",
                                                  "Customtime"
                                                ],
                                                borderWidth: 1.2,
                                                borderColor: [
                                                  ColorsApp.COLOR_PRIMARY
                                                ],
                                                activeBgColor: [
                                                  ColorsApp.COLOR_PRIMARY
                                                ],
                                                customTextStyles: const [
                                                  TextStyle(
                                                    fontSize: 11,
                                                  ),
                                                  TextStyle(fontSize: 12)
                                                ],
                                                onToggle: (index) {
                                                  Appsettings_Controller
                                                      .toogle_isselected
                                                      .value = index!;
                                                  Appsettings_Controller
                                                          .model_appsettings
                                                          .value!
                                                          .reportSettings!
                                                          .first
                                                          .reportbasedon!
                                                          .type =
                                                      index == 0
                                                          ? "daywise"
                                                          : "Customtime";
                                                  Appsettings_Controller
                                                      .model_appsettings
                                                      .refresh();
                                                  print(Appsettings_Controller
                                                      .model_appsettings.value!
                                                      .toJson());

                                                  // Appsettings_Controller.toogelswitch();
                                                  // print(Bank_controller
                                                  //     .selectedtoggleIndex);

                                                  // print( Bank_controller.selectedtoggleIndex.value);
                                                  // Bank_controller.onToggle(
                                                  //     data: data, index: index);
                                                },
                                              )),
                                          Obx(
                                              () =>
                                                  Appsettings_Controller
                                                              .model_appsettings
                                                              .value!
                                                              .reportSettings!
                                                              .first
                                                              .reportbasedon!
                                                              .type ==
                                                          "daywise"
                                                      ? Container(
                                                          margin:
                                                              const EdgeInsets.all(
                                                                  10),
                                                          height: 70,
                                                          width: 500,
                                                          // color: Colors.amber,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black12)),
                                                          child: Row(children: [
                                                            Center(
                                                              child: Container(
                                                                  width: 100,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .black12),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4)),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                            border:
                                                                                Border.all(),
                                                                            borderRadius: BorderRadius.circular(5)),
                                                                        height:
                                                                            25,
                                                                        width:
                                                                            25,
                                                                        child: const Center(
                                                                            child: Icon(
                                                                          LineIcons
                                                                              .check,
                                                                          size:
                                                                              18,
                                                                        )),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(10),
                                                                        child:
                                                                            Text(
                                                                          "Next Day",
                                                                          style: TextStyle(
                                                                              color: ColorsApp.COLOR_SECONDARY_TEXT,
                                                                              fontFamily: Fonts.font_Montserrat,
                                                                              fontSize: 13),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )),
                                                            ),
                                                            Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            1),
                                                                height: 40,
                                                                width: 150,
                                                                child: TextFormField(
                                                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: Fonts.font_Montserrat),
                                                                    // textAlign: TextAlign.center,
                                                                    onTap: () {
                                                                      Appsettings_Controller.txt_fromdate_controller.selection = TextSelection(
                                                                          baseOffset:
                                                                              0,
                                                                          extentOffset: Appsettings_Controller
                                                                              .txt_fromdate_controller
                                                                              .value
                                                                              .text
                                                                              .length);
                                                                    },
                                                                    autofocus: true,
                                                                    controller: Appsettings_Controller.txt_fromdate_controller,
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp('[a-zA-Z0-9- ]')),
                                                                    ],
                                                                    decoration: InputDecoration(
                                                                        contentPadding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                                                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsApp.COLOR_PRIMARY)),
                                                                        labelText: "Start Date".capitalize!,
                                                                        labelStyle: TextStyle(fontStyle: FontStyle.italic, color: ColorsApp.COLOR_PRIMARY, fontFamily: Fonts.font_Montserrat, fontSize: 12),
                                                                        border: OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: ColorsApp.COLOR_NIGHT_PRIMARY),
                                                                        ),
                                                                        enabledBorder: const OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                        suffixIcon: Padding(
                                                                            padding: const EdgeInsets.only(left: 15),
                                                                            child: InkWell(
                                                                              onTap: () {
                                                                                Appsettings_Controller().fromdate(Get.context!);
                                                                              },
                                                                              child: const Icon(
                                                                                size: 16,
                                                                                LineIcons.calendarAlt,
                                                                                color: Colors.black,
                                                                              ),
                                                                            ))

                                                                        //  IconButton(
                                                                        //     onPressed: () {
                                                                        //       ReportItemwiseTaxController().fromdate(Get.context!);
                                                                        //     },padding: EdgeInsets.only(left: 15),
                                                                        //     icon: Icon(size: 12,
                                                                        //       LineIcons.calendarAlt,
                                                                        //       color: Colors.black,
                                                                        //     ))
                                                                        ))),
                                                            Container(
                                                                margin: const EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            1),
                                                                height: 40,
                                                                width: 150,
                                                                child: TextFormField(
                                                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: Fonts.font_Montserrat),
                                                                    // textAlign: TextAlign.center,
                                                                    onTap: () {
                                                                      Appsettings_Controller.txt_todate_controller.selection = TextSelection(
                                                                          baseOffset:
                                                                              0,
                                                                          extentOffset: Appsettings_Controller
                                                                              .txt_todate_controller
                                                                              .value
                                                                              .text
                                                                              .length);
                                                                    },
                                                                    autofocus: true,
                                                                    controller: Appsettings_Controller.txt_todate_controller,
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp('[a-zA-Z0-9- ]')),
                                                                    ],
                                                                    decoration: InputDecoration(
                                                                        contentPadding: const EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
                                                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsApp.COLOR_PRIMARY)),
                                                                        labelText: "End Date".capitalize!,
                                                                        labelStyle: TextStyle(fontStyle: FontStyle.italic, color: ColorsApp.COLOR_PRIMARY, fontFamily: Fonts.font_Montserrat, fontSize: 12),
                                                                        border: OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: ColorsApp.COLOR_NIGHT_PRIMARY),
                                                                        ),
                                                                        enabledBorder: const OutlineInputBorder(
                                                                            borderSide: BorderSide(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                        suffixIcon: Padding(
                                                                            padding: const EdgeInsets.only(left: 15),
                                                                            child: InkWell(
                                                                              onTap: () {
                                                                                Appsettings_Controller().todate(Get.context!);
                                                                              },
                                                                              child: const Icon(
                                                                                size: 16,
                                                                                LineIcons.calendarAlt,
                                                                                color: Colors.black,
                                                                              ),
                                                                            ))

                                                                        //  IconButton(
                                                                        //     onPressed: () {
                                                                        //       ReportItemwiseTaxController().fromdate(Get.context!);
                                                                        //     },padding: EdgeInsets.only(left: 15),
                                                                        //     icon: Icon(size: 12,
                                                                        //       LineIcons.calendarAlt,
                                                                        //       color: Colors.black,
                                                                        //     ))
                                                                        )))
                                                          ]),
                                                        )
                                                      : const SizedBox())
                                        ],
                                      )),
                                );
                              } else if (index == 1) {
                                return Card(
                                  elevation: 10,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 60,
                                    width: 50,
                                    color: ColorsApp.COLOR_SECONDARY,
                                    child: Row(children: [
                                      Text(
                                        "Currency",
                                        style: TextStyle(
                                            color:
                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                            fontFamily: Fonts.font_Montserrat,
                                            fontSize: 16),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        height: 40,
                                        width: 180,
                                        child: Obx(() => DropdownButton<
                                                Currency>(
                                            icon: Icon(
                                              LineIcons.angleDown,
                                              size: 15,
                                              color: ColorsApp
                                                  .COLOR_SECONDARY_TEXT,
                                            ),
                                            // isExpanded: true,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(2),
                                            dropdownColor:
                                                ColorsApp.COLOR_SECONDARY,
                                            style: TextStyle(
                                                fontFamily:
                                                    Fonts.font_Montserrat,
                                                color: ColorsApp
                                                    .COLOR_SECONDARY_TEXT),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            underline: const SizedBox(),
                                            hint: Text(
                                                "${Appsettings_Controller.dropdown_Currency}"),
                                            // Text('Choose Outlet',style: TextStyle(color: ColorsApp.COLOR_SECONDARY_TEXT,fontSize: 14,fontFamily: Fonts.font_Montserrat),),
                                            items: Appsettings_Controller
                                                .model_appsettings
                                                .value!
                                                .reportSettings!
                                                .first
                                                .currency!
                                                .map((item) {
                                              return DropdownMenuItem<Currency>(
                                                alignment: Alignment.center,
                                                value: item,
                                                child:
                                                    Text(item.name.toString()),
                                              );
                                            }).toList(),
                                            disabledHint: const Text("Can't select"),
                                            onChanged: (newVal) {
                                              Appsettings_Controller
                                                  .dropdown_Currency
                                                  .value = newVal;
                                              // Appsettings_Controller.model_appsettings.value!.reportSettings!.first.currency
                                            },
                                            value: Appsettings_Controller
                                                .dropdown_Currency.value)),
                                      ),
                                    ]),
                                  ),
                                );
                              } else if (index == 2) {
                                return Card(
                                  elevation: 10,
                                  child: Container(
                                      // height: ,
                                      width: 50,
                                      // color: Colors.blue,
                                      child:
                                          // Column(children: [
                                          //   Text("data"),
                                          Obx(
                                        () => Appsettings_Controller
                                                    .model_appsettings.value ==
                                                null
                                            ? const SizedBox()
                                            : Container(
                                                padding: const EdgeInsets.all(10),
                                                width: 300,
                                                // decoration: BoxDecoration(
                                                //     border: Border.all(
                                                //         color: ColorsApp
                                                //             .COLOR_SECONDARY_TEXT)),
                                                child: Column(children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "AppTheme",
                                                        // '${Settings_generalSettings_controller.model_App_theme.value!.settingsData![0].settingsName}',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: ColorsApp
                                                              .COLOR_SECONDARY_TEXT,
                                                          fontFamily: Fonts
                                                              .font_Montserrat,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * .01,
                                                  ),
                                                  ToggleSwitch(
                                                      minWidth: 54.0,
                                                      minHeight: 30.0,
                                                      initialLabelIndex:
                                                          Appsettings_Controller
                                                              .model_appsettings
                                                              .value!
                                                              .reportSettings![
                                                                  0]
                                                              .theme!
                                                              .selectedTheme,
                                                      cornerRadius: 20.0,
                                                      totalSwitches: 5,
                                                      fontSize: 8,
                                                      labels: const [
                                                        'Theme\n 1',
                                                        'Theme\n 2',
                                                        'Theme\n 3',
                                                        'Theme\n 4',
                                                        'Theme\n 5'
                                                      ],
                                                      borderWidth: 2.0,
                                                      activeFgColor: ColorsApp
                                                          .COLOR_PRIMARY_TEXT,
                                                      inactiveBgColor: ColorsApp
                                                          .COLOR_SECONDARY_TEXT,
                                                      inactiveFgColor: ColorsApp
                                                          .COLOR_SECONDARY,
                                                      borderColor: [
                                                        ColorsApp
                                                            .COLOR_SECONDARY_TEXT
                                                      ],
                                                      activeBgColor: [
                                                        ColorsApp.COLOR_PRIMARY
                                                      ],
                                                      onToggle: (index) {
                                                        print(index);
                                                        // Settings_generalSettings_controller
                                                        //     .apptheme_toggle(index);
                                                      }),
                                                  const SizedBox(height: 5),
                                                  Container(
                                                    // color: Colors.amber,
                                                    width: 300,
                                                    height: 75,
                                                    child: Stack(children: [
                                                      Positioned(
                                                          top: 10,
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(15,
                                                                    15, 40, 0),
                                                            width: 275,
                                                            height: 60,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    // border: Border(),
                                                                    ),
                                                            child: Obx(
                                                              () => Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Background',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  ),
                                                                  VerticalDivider(
                                                                      width: 2,
                                                                      color: ColorsApp
                                                                          .COLOR_SECONDARY_TEXT),
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Text',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.PRIMARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          top: 3,
                                                          child: Container(
                                                              width: 275,
                                                              child: HorizontalDivider(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT))),
                                                      Positioned(
                                                          left: 5,
                                                          child: Container(
                                                              color: ColorsApp
                                                                  .COLOR_SECONDARY,
                                                              child: Text(
                                                                'Primary',
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT,
                                                                  fontFamily: Fonts
                                                                      .font_Montserrat,
                                                                ),
                                                              )))
                                                    ]),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Container(
                                                    width: 300,
                                                    height: 75,
                                                    child: Stack(children: [
                                                      Positioned(
                                                          top: 10,
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(15,
                                                                    15, 40, 0),
                                                            width: 275,
                                                            height: 60,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    // border: Border.all(),
                                                                    ),
                                                            child: Obx(
                                                              () => Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Background',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  ),
                                                                  VerticalDivider(
                                                                      width: 2,
                                                                      color: ColorsApp
                                                                          .COLOR_SECONDARY_TEXT),
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Text',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.SECONDARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          top: 3,
                                                          child: Container(
                                                              width: 275,
                                                              child: HorizontalDivider(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT))),
                                                      Positioned(
                                                          left: 5,
                                                          child: Container(
                                                              color: ColorsApp
                                                                  .COLOR_SECONDARY,
                                                              child: Text(
                                                                'Secondary',
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT,
                                                                  fontFamily: Fonts
                                                                      .font_Montserrat,
                                                                ),
                                                              )))
                                                    ]),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Container(
                                                    width: 300,
                                                    height: 75,
                                                    child: Stack(children: [
                                                      Positioned(
                                                          top: 10,
                                                          child: Container(
                                                            padding: const EdgeInsets
                                                                .fromLTRB(15,
                                                                    15, 40, 0),
                                                            width: 275,
                                                            height: 60,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    // border: Border.all(),
                                                                    ),
                                                            child: Obx(
                                                              () => Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Background',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.BACKGROUND)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  ),
                                                                  VerticalDivider(
                                                                      width: 2,
                                                                      color: ColorsApp
                                                                          .COLOR_SECONDARY_TEXT),
                                                                  Column(
                                                                    children: [
                                                                      Text(
                                                                          'Text',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                ColorsApp.COLOR_SECONDARY_TEXT,
                                                                            fontFamily:
                                                                                Fonts.font_Montserrat,
                                                                          )),
                                                                      Appsettings_Controller.model_appsettings.value ==
                                                                              null
                                                                          ? const CircularProgressIndicator()
                                                                          : GestureDetector(
                                                                              onTap: () {
                                                                                showDialog(
                                                                                    context: Get.context!,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text('Pick a color!'),
                                                                                        content: SingleChildScrollView(
                                                                                          child: MaterialPicker(
                                                                                            pickerColor: Color(
                                                                                              Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT),
                                                                                            ),
                                                                                            onColorChanged: (color) {
                                                                                              Appsettings_Controller().selectedcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT, color: color);
                                                                                              print(color.toString());
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        actions: <Widget>[
                                                                                          ElevatedButton(
                                                                                            child: const Text('Got it'),
                                                                                            onPressed: () {
                                                                                              Get.back(closeOverlays: true);
                                                                                              Appsettings_Controller.model_appsettings.refresh();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                width: 35,
                                                                                height: 20,
                                                                                decoration: BoxDecoration(color: Color(Appsettings_Controller().bgcolorpicker(F_COLOR_FORMAT: COLOR_FORMAT_REPORT_SETTINGS.TERITARY, F_COLOR_TYPE: COLOR_TYPE_REPORT_SETTINGS.TEXT)), borderRadius: BorderRadius.circular(5)),
                                                                              ),
                                                                            )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          top: 3,
                                                          child: Container(
                                                              width: 275,
                                                              child: HorizontalDivider(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT))),
                                                      Positioned(
                                                          left: 5,
                                                          child: Container(
                                                              color: ColorsApp
                                                                  .COLOR_SECONDARY,
                                                              child: Text(
                                                                'Tertiary',
                                                                style:
                                                                    TextStyle(
                                                                  color: ColorsApp
                                                                      .COLOR_SECONDARY_TEXT,
                                                                  fontFamily: Fonts
                                                                      .font_Montserrat,
                                                                ),
                                                              )))
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  RoundedLoadingButton(
                                                      width: 100,
                                                      height: 40,
                                                      color: ColorsApp
                                                          .COLOR_PRIMARY,
                                                      controller:
                                                          Appsettings_Controller
                                                              .btn_apptheme_controller,
                                                      onPressed: () {
                                                        Appsettings_Controller()
                                                            .App_Theme_saveData();
                                                      },
                                                      child: Text(
                                                        'SAVE',
                                                        style: TextStyle(
                                                            fontFamily: Fonts
                                                                .font_Montserrat,
                                                            color: ColorsApp
                                                                .COLOR_PRIMARY_TEXT),
                                                      ))
                                                ])),
                                      )
                                      // ]),
                                      ),
                                );
                              } else if (index == 3) {
                                return Container(
                                  child: Stack(
                                    children: [
                                      Card(
                                          elevation: 10,
                                          child: Padding(
                                              padding: const EdgeInsets.all(25),
                                              child: Container(
                                                height: 300,
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black12)),
                                                child: Obx(() => Wrap(
                                                      children: [
                                                        for (var a
                                                            in Appsettings_Controller
                                                                .model_appsettings
                                                                .value!
                                                                .reportSettings![
                                                                    0]
                                                                .modules!)
                                                          GestureDetector(
                                                            onTap: () {
                                                              Appsettings_Controller
                                                                      .is_moduletile_slct
                                                                      .value =
                                                                  !Appsettings_Controller
                                                                      .is_moduletile_slct
                                                                      .value;
                                                              a.active =
                                                                  Appsettings_Controller
                                                                      .is_moduletile_slct
                                                                      .value;
                                                              Appsettings_Controller
                                                                  .model_appsettings
                                                                  .refresh();
                                                            },
                                                            child: Container(
                                                                width: 180,
                                                                height: 40,
                                                                margin:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            25),
                                                                child: Card(
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        margin:
                                                                            const EdgeInsets.all(3),
                                                                        width:
                                                                            130,
                                                                        child: AutoSizeText(
                                                                            "${a.name.toString().capitalize}",
                                                                            minFontSize:
                                                                                8,
                                                                            maxLines:
                                                                                2,
                                                                            maxFontSize:
                                                                                12,
                                                                            style:
                                                                                TextStyle(color: ColorsApp.COLOR_SECONDARY_TEXT, fontFamily: Fonts.font_Montserrat)),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(5),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              15,
                                                                          width:
                                                                              15,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(30),
                                                                              border: Border.all(),
                                                                              color: a.active == true ? ColorsApp.COLOR_PRIMARY : ColorsApp.COLOR_SECONDARY),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  // width: 100,
                                                                )),
                                                          )
                                                      ],
                                                    )),
                                              ))),
                                      Positioned(
                                          top: 5,
                                          left: 40,
                                          child: Container(
                                            color: Colors.white,
                                            padding: const EdgeInsets.all(12),
                                            child: Text(
                                              "Modules",
                                              style: TextStyle(
                                                  color: ColorsApp
                                                      .COLOR_SECONDARY_TEXT,
                                                  fontFamily:
                                                      Fonts.font_Montserrat,
                                                  fontSize: 16),
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              }
                            },
                          )))
          ],
        ),
        Positioned(
            top: 2,
            right: 2,
            child: IconButton(
              icon: Icon(Icons.close, color: ColorsApp.COLOR_SECONDARY_TEXT),
              onPressed: () {
                Get.back();
              },
            ))
      ]),
    );
  });
}
}