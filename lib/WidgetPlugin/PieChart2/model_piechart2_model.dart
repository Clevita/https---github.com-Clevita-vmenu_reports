class ModelPiechart2 {
  Piechart? piechart;

  ModelPiechart2({this.piechart});

  ModelPiechart2.fromJson(Map<String, dynamic> json) {
    piechart =
        json['piechart'] != null ? Piechart?.fromJson(json['piechart']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (piechart != null) {
      data['piechart'] = piechart?.toJson();
    }
    return data;
  }
}

class Piechart {
  String? title;
  double? titleFontsize;
  String? titleColor;
  List<PiechartData>? piechartData;

  Piechart(
      {this.title, this.titleFontsize, this.titleColor, this.piechartData});

  Piechart.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleFontsize = json['title_fontsize'];
    titleColor = json['title_color'];
    if (json['piechart_data'] != null) {
      piechartData = <PiechartData>[];
      json['piechart_data'].forEach((v) {
        piechartData?.add(PiechartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['title_fontsize'] = titleFontsize;
    data['title_color'] = titleColor;
    if (piechartData != null) {
      data['piechart_data'] = piechartData?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PiechartData {
  String? label;
  double? totalPercent;
  double? growthPercent;
  String? color;
  bool? haveIncreased;

  PiechartData(
      {this.label,
      this.totalPercent,
      this.growthPercent,
      this.color,
      this.haveIncreased});

  PiechartData.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    totalPercent = json['total_percent'];
    growthPercent = json['growthPercent'];
    color = json['color'];
    haveIncreased = json['haveIncreased'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['label'] = label;
    data['total_percent'] = totalPercent;
    data['growthPercent'] = growthPercent;
    data['color'] = color;
    data['haveIncreased'] = haveIncreased;
    return data;
  }
}
