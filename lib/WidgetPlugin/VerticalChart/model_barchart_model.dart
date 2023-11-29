class ModelBarchart {
  BarData? barData;

  ModelBarchart({this.barData});

  ModelBarchart.fromJson(Map<String, dynamic> json) {
    barData =
        json['bar_data'] != null ? BarData?.fromJson(json['bar_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (barData != null) {
      data['bar_data'] = barData?.toJson();
    }
    return data;
  }
}

class BarData {
  String? title;
  double? titleFontsize;
  String? titleColor;
  List<BardataList>? bardataList;
  List<BarcontainerData>? barcontainerData;

  BarData(
      {this.title,
      this.titleFontsize,
      this.titleColor,
      this.bardataList,
      this.barcontainerData});

  BarData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleFontsize = json['title_fontsize'];
    titleColor = json['title_color'];
    if (json['bardata_list'] != null) {
      bardataList = <BardataList>[];
      json['bardata_list'].forEach((v) {
        bardataList?.add(BardataList.fromJson(v));
      });
    }
    if (json['barcontainer_data'] != null) {
      barcontainerData = <BarcontainerData>[];
      json['barcontainer_data'].forEach((v) {
        barcontainerData?.add(BarcontainerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['title_fontsize'] = titleFontsize;
    data['title_color'] = titleColor;
    if (bardataList != null) {
      data['bardata_list'] = bardataList?.map((v) => v.toJson()).toList();
    }
    if (barcontainerData != null) {
      data['barcontainer_data'] =
          barcontainerData?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BardataList {
  int? key;
  List<double>? value;

  BardataList({this.key, this.value});

  BardataList.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class BarcontainerData {
  String? title;
  int? number;

  BarcontainerData({this.title, this.number});

  BarcontainerData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['number'] = number;
    return data;
  }
}
