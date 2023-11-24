class ModelPieChart {
  WidgetData? widgetData;

  ModelPieChart({this.widgetData});

  ModelPieChart.fromJson(Map<String, dynamic> json) {
    widgetData = json['widget_data'] != null
        ? WidgetData?.fromJson(json['widget_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (widgetData != null) {
      data['widget_data'] = widgetData?.toJson();
    }
    return data;
  }
}

class WidgetData {
  String? title;
  double? titleFontsize;
  String? subtitle;
  double? subtitleFontsize;
  String? percentage;
  double? percentageFontsize;
  double? piechartRadius;
  List<PichartSectionlist>? pichartSectionlist;

  WidgetData(
      {this.title,
      this.titleFontsize,
      this.subtitle,
      this.subtitleFontsize,
      this.percentage,
      this.percentageFontsize,
      this.piechartRadius,
      this.pichartSectionlist});

  WidgetData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleFontsize = json['title_fontsize'];
    subtitle = json['subtitle'];
    subtitleFontsize = json['subtitle_fontsize'];
    percentage = json['percentage'];
    percentageFontsize = json['percentage_fontsize'];
    piechartRadius = json['piechart_radius'];
    if (json['pichart_sectionlist'] != null) {
      pichartSectionlist = <PichartSectionlist>[];
      json['pichart_sectionlist'].forEach((v) {
        pichartSectionlist?.add(PichartSectionlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['title_fontsize'] = titleFontsize;
    data['subtitle'] = subtitle;
    data['subtitle_fontsize'] = subtitleFontsize;
    data['percentage'] = percentage;
    data['percentage_fontsize'] = percentageFontsize;
    data['piechart_radius'] = piechartRadius;
    if (pichartSectionlist != null) {
      data['pichart_sectionlist'] =
          pichartSectionlist?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PichartSectionlist {
  double? radius;
  double? touchedRadius;
  String? color;
  int? value;
  String? valueColor;
  bool? showtitle;
  Borderside? borderside;

  PichartSectionlist(
      {this.radius,
      this.touchedRadius,
      this.color,
      this.value,
      this.valueColor,
      this.showtitle,
      this.borderside});

  PichartSectionlist.fromJson(Map<String, dynamic> json) {
    radius = json['radius'];
    touchedRadius = json['touched_radius'];
    color = json['color'];
    value = json['value'];
    valueColor = json['value_color'];
    showtitle = json['showtitle'];
    borderside = json['borderside'] != null
        ? Borderside?.fromJson(json['borderside'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['radius'] = radius;
    data['touched_radius'] = touchedRadius;
    data['color'] = color;
    data['value'] = value;
    data['value_color'] = valueColor;
    data['showtitle'] = showtitle;
    if (borderside != null) {
      data['borderside'] = borderside?.toJson();
    }
    return data;
  }
}

class Borderside {
  double? width;
  String? color;

  Borderside({this.width, this.color});

  Borderside.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['width'] = width;
    data['color'] = color;
    return data;
  }
}
