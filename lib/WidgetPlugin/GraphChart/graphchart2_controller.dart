import 'package:get/get.dart';
import 'package:vmenu_reports/WidgetPlugin/GraphChart/graphchart2_view.dart';
import 'package:vmenu_reports/WidgetPlugin/GraphChart/model_graph_chart_model.dart';


class graphcard2_controller{
   static var model_graphchart2 = Rxn<ModelGraphChart>();
   static var finalbottomtiles={};
   static var finalleftnames={};
     static Getdata({required ModelGraphChart modellinechart}) {
    String text;
    int num;
     var bottomtiles={};
    model_graphchart2.value = modellinechart;
    print(model_graphchart2.toJson());
    // months = getMonthNumbersanddays(model_linechart.value!);

    for (var i in graphcard2_controller
        .model_graphchart2.value!.linechartdata!.bottomtileNames!) {
      //  bottomtiles.keys=i.number;
      finalbottomtiles[i.number] = i.names;
    }
    print(finalbottomtiles);
    for (var i in graphcard2_controller
        .model_graphchart2.value!.linechartdata!.lefttileNames!) {
      //  bottomtiles.keys=i.number;
      finalleftnames[i.number] = i.names;
    }
    print(finalleftnames);

    return graphchart2();
  }
}