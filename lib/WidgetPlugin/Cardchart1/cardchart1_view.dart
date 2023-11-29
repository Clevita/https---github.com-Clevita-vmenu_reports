// ideal data need for graphchart2 eg is provided below the class 
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vmenu_reports/Fonts.dart';
import 'package:vmenu_reports/WidgetPlugin/Cardchart1/cardchart1_controller.dart';
import 'package:vmenu_reports/WidgetPlugin/Cardchart1/model_cardchart_model.dart';

class cardchart1 extends GetView {
   cardchart1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing:cardchart1_controller.model_cardchart.value!.cardchartData!.spacing!.toDouble(),
      runSpacing: cardchart1_controller.model_cardchart.value!.cardchartData!.runspacing!.toDouble(),
      children: <Widget>[ for(var a in cardchart1_controller.model_cardchart.value!.cardchartData!.cardData!)
        _InformationBox(carddata: a ),
      ],
    );
  }
}


      _InformationBox({required CardData carddata}){
    return Container(
      width: cardchart1_controller.model_cardchart.value!.cardchartData!.cardWidth!.toDouble(),
      height:cardchart1_controller.model_cardchart.value!.cardchartData!.cardHeight!.toDouble(),
      decoration: BoxDecoration(
        color:  colorFromHex(cardchart1_controller.model_cardchart.value!.cardchartData!.cardBackgrndclr!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius:cardchart1_controller.model_cardchart.value!.cardchartData!.iconCircleavatar!.radius!.toDouble() ,
            backgroundColor: colorFromHex(cardchart1_controller.model_cardchart.value!.cardchartData!.iconCircleavatar!.color!),
            child:ClipOval(
                        child: Image.asset(carddata.icon.toString(), 
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        
                      ) ),
          ),
           SizedBox(height:cardchart1_controller.model_cardchart.value!.cardchartData!.cardHeight!.toDouble()*0.04),
        Obx(() =>   Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
               carddata.title.toString()  ,
                style: TextStyle(fontFamily: Fonts.font_Montserrat,fontSize: carddata.titleFontsize!.toDouble(),color:colorFromHex(carddata.titleColor!) ),
              ),
              const SizedBox(width: 5),
              InkWell(onTap: (){
                cardchart1_controller.show_incrementdecrement.value=!cardchart1_controller.show_incrementdecrement.value;
                carddata.percentage!.decreaseIncrease= cardchart1_controller.show_incrementdecrement.value;
                cardchart1_controller.model_cardchart.refresh();
              },
                child: Icon(carddata.showPercentage==false?null:
                  carddata.percentage!.decreaseIncrease==true ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 20,
                  color:cardchart1_controller.show_incrementdecrement.value==true|| carddata.percentage!.decreaseIncrease==true ? Colors.green : Colors.red,
                ),
              ),
              Text(carddata.showPercentage==false?"":
                carddata.percentage!.value.toString() + '%',
                style: cardchart1_controller.show_incrementdecrement.value==true||
                carddata.percentage!.decreaseIncrease==true
                    ? TextStyle(color: Colors.green,fontFamily: Fonts.font_Montserrat)
                    // TextStyles.myriadProSemiBold12Green
                    : TextStyle(color: Colors.red,fontFamily: Fonts.font_Montserrat)
                    // TextStyles.myriadProSemiBold12Red,
              ),
            ],
          )),
           SizedBox(height: cardchart1_controller.model_cardchart.value!.cardchartData!.cardHeight!.toDouble()*0.02),
          Text(carddata.subtitle!, style:TextStyle(color: colorFromHex(carddata.subtitleColor!),fontFamily: Fonts.font_Montserrat,fontSize: carddata.subtitleFontsize!.toDouble())),
        ],
      ),
    );
  }
  // cardchart1_controller.Getdata(
  //                         modelcardchart: ModelCardchart(
  //                             cardchartData: CardchartData(
  //                                 spacing: 2,
  //                                 runspacing: 1,
  //                                 iconCircleavatar:
  //                                     IconCircleavatar(color: "#FFFFFF", radius: 15),
  //                                 cardHeight: 80,
  //                                 cardWidth: 180,
  //                                 cardBackgrndclr:"#FFFFFF" ,
  //                                 cardData: [
  //                           CardData(
  //                               title: "12345",
  //                               icon: "assets/images/download.png",
  //                               iconColor: "#FFFFFF",
  //                               percentage: Percentage(
  //                                   decreaseIncrease: true,
  //                                   showtitlePercentage: true,
  //                                   value: 50,
  //                                   valueFontsize: 8),
  //                               showPercentage: true,
  //                               subtitle: "perfect",
  //                               subtitleColor: "#000000",
  //                               subtitleFontsize: 12,
  //                               titleColor: "#000000",
  //                               titleFontsize: 14),
  //                                  CardData(
  //                               title: "100",
  //                               icon: "assets/images/images.png",
  //                               iconColor: "0xFFFF3EF4",
  //                               percentage: Percentage(
  //                                   decreaseIncrease: true,
  //                                   showtitlePercentage: true,
  //                                   value: 23,
  //                                   valueFontsize: 8),
  //                               showPercentage: true,
  //                               subtitle: "perfect",
  //                               subtitleColor: "#000000",
  //                               subtitleFontsize: 12,
  //                               titleColor: "#000000",
  //                               titleFontsize: 14),
  //                                  CardData(
  //                               title: "45",
  //                               icon: "assets/images/bell.png",
  //                               iconColor: "#000000",
  //                               percentage: Percentage(
  //                                   decreaseIncrease: true,
  //                                   showtitlePercentage: true,
  //                                   value: 10,
  //                                   valueFontsize: 8),
  //                               showPercentage: true,
  //                               subtitle: "perfect",
  //                               subtitleColor: "#000000",
  //                               subtitleFontsize: 12,
  //                               titleColor: "#000000",
  //                               titleFontsize: 14),
  //                         ])))
