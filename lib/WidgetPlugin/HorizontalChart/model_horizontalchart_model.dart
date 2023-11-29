class ModelHorizontalchart {
  HorizontalChart? horizontalChart;

  ModelHorizontalchart({this.horizontalChart});

  ModelHorizontalchart.fromJson(Map<String, dynamic> json) {
    horizontalChart = json['horizontal_chart'] != null
        ? HorizontalChart?.fromJson(json['horizontal_chart'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (horizontalChart != null) {
      data['horizontal_chart'] = horizontalChart?.toJson();
    }
    return data;
  }
}

class HorizontalChart {
  String? title;
  String? titleColor;
  double? titleFontsize;
  List<MaleData>? maleData;
  List<MaleData>? femaleData;

  HorizontalChart(
      {this.title,
      this.titleColor,
      this.titleFontsize,
      this.maleData,
      this.femaleData});

  HorizontalChart.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleColor = json['title_color'];
    titleFontsize = json['title_fontsize'];
    if (json['Male_data'] != null) {
      maleData = <MaleData>[];
      json['Male_data'].forEach((v) {
        maleData?.add(MaleData.fromJson(v));
      });
    }
    if (json['Female_data'] != null) {
      femaleData = <MaleData>[];
      json['Female_data'].forEach((v) {
        femaleData?.add(MaleData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['title_color'] = titleColor;
    data['title_fontsize'] = titleFontsize;
    if (maleData != null) {
      data['Male_data'] = maleData?.map((v) => v.toJson()).toList();
    }
    if (femaleData != null) {
      data['Female_data'] = femaleData?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MaleData {
  String? age;
  double? value;

  MaleData({this.age, this.value});

  MaleData.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['age'] = age;
    data['value'] = value;
    return data;
  }
}
