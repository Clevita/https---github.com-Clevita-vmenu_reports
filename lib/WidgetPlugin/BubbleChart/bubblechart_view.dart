// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vmenu_reports/Fonts.dart';
import 'package:vmenu_reports/WidgetPlugin/BubbleChart/bubblechart_controller.dart';
import 'package:vmenu_reports/WidgetPlugin/BubbleChart/model_bubblechart_model.dart';
import 'package:vmenu_reports/WidgetPlugin/PieChart2/piechart_view.dart';
import 'package:vmenu_reports/WidgetPlugin/VerticalChart/verticalchart_view.dart';

class BubbleChartView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BubbleChartController().GetData(
          modelBubblechart: ModelBubblechart(
        bubbleData: BubbleData(
          title: "Bubble Plugin",
          titleFontsize: 15,
          platformdataList: [
            PlatformdataList(
                backgroundcolor: "#FFFFF7",
                foregroundcolor: "#FFA500",
                percentage: 60.0,
                platformName: "Android"),
            PlatformdataList(
                backgroundcolor: "#FFFFF7",
                foregroundcolor: "#800080",
                percentage: 30.0,
                platformName: "IOS"),
            PlatformdataList(
                backgroundcolor: "#FFFFF7",
                foregroundcolor: "#0000FF",
                percentage: 10.0,
                platformName: "Web")
          ],
          bubbledataList: [
            BubbledataList(
                bubbleLabel: "30",
                bottom: 50,
                // left: 0,
                // top: 2,
                // right: 0,
                bubbleRadius: 45.0,
                bubbleColor: "#800080"),
            BubbledataList(
                bottom: 15,
                left: 20,
                bubbleLabel: "10",
                bubbleRadius: 32.0,
                bubbleColor: "#0000FF"),
            BubbledataList(
                bubbleLabel: "60",
                // top: 30,
                right: 20,
                bubbleRadius: 55.0,
                bubbleColor: "#FFA500"),
          ],
        ),
      )),
    );
  }
}

Widget Circles() {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${BubbleChartController.model_bubblechart.value!.bubbleData!.title}',
          ),
          SizedBox(height: 25),
          SizedBox(
            width: 200,
            height: 150,
            child: Stack(
              children: <Widget>[
                for (var a in BubbleChartController
                    .model_bubblechart.value!.bubbleData!.bubbledataList!)
                  Positioned(
                    bottom: a.bottom,
                    left: a.left,
                    right: a.right,
                    child: CircleAvatar(
                      radius: a.bubbleRadius,
                      backgroundColor: colorFromHex(a.bubbleColor!),
                      child: Text('${a.bubbleLabel}',
                          style: TextStyle(fontFamily: Fonts.font_Montserrat)),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 20),
          PlatformsList(),
          SizedBox(
            height: 50,
          ),

          ////////STATITICS
          PiechartTwoView()
        ],
      ),
      SizedBox(
        width: 10,
      ),
      VerticalChartView()
    ],
  );
}

Widget PlatformsList() {
  return SizedBox(
    width: 300,
    child: Column(
      children: [
        for (var a in BubbleChartController
            .model_bubblechart.value!.bubbleData!.platformdataList!)
          PlatformListElement(
              platformName: a.platformName!,
              backgroundcolor: colorFromHex(a.backgroundcolor.toString()),
              foregroundcolor: colorFromHex(a.foregroundcolor.toString()),
              percent: a.percentage!)
      ],
    ),
  );
}

PlatformListElement(
    {required String platformName,
    required double? percent,
    required Color? backgroundcolor,
    required Color? foregroundcolor}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(platformName,
              style: TextStyle(fontFamily: Fonts.font_Montserrat)),
          Text('$percent%',
              style: TextStyle(fontFamily: Fonts.font_Montserrat)),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 10,
        width: 300,
        child: CustomPaint(
            painter: _PercentBarPainter(
                backgroundColor: backgroundcolor!,
                value: percent! / 100,
                valueColor: foregroundcolor!)),
      ),
      SizedBox(
        height: 10,
      ),
      // SizedBox(
      //   height: 50,
      // ),
    ],
  );
}

class _PercentBarPainter extends CustomPainter {
  const _PercentBarPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.value,
  });

  final Color backgroundColor;
  final Color valueColor;

  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = backgroundColor; // ..color=backgroundColor
    paint.style = PaintingStyle.fill; //..style=PaintingStyle.fill
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(4.5)),
      paint,
    );

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0) return;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Offset(x, 0.0) & Size(width, size.height),
          const Radius.circular(4.5),
        ),
        paint,
      );
    }

    drawBar(0.0, value.clamp(0.0, 1.0) * size.width);
  }

  @override
  bool shouldRepaint(_PercentBarPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.value != value;
  }
}
