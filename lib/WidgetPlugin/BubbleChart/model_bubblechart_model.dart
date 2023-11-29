class ModelBubblechart {
  BubbleData? bubbleData;

  ModelBubblechart({this.bubbleData});

  ModelBubblechart.fromJson(Map<String, dynamic> json) {
    bubbleData = json['bubble_data'] != null
        ? BubbleData?.fromJson(json['bubble_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (bubbleData != null) {
      data['bubble_data'] = bubbleData?.toJson();
    }
    return data;
  }
}

class BubbleData {
  String? title;
  double? titleFontsize;
  List<BubbledataList>? bubbledataList;
  List<PlatformdataList>? platformdataList;

  BubbleData(
      {this.title,
      this.titleFontsize,
      this.bubbledataList,
      this.platformdataList});

  BubbleData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleFontsize = json['title_fontsize'];
    if (json['bubbledata_list'] != null) {
      bubbledataList = <BubbledataList>[];
      json['bubbledata_list'].forEach((v) {
        bubbledataList?.add(BubbledataList.fromJson(v));
      });
    }
    if (json['platformdata_list'] != null) {
      platformdataList = <PlatformdataList>[];
      json['platformdata_list'].forEach((v) {
        platformdataList?.add(PlatformdataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['title_fontsize'] = titleFontsize;
    if (bubbledataList != null) {
      data['bubbledata_list'] = bubbledataList?.map((v) => v.toJson()).toList();
    }
    if (platformdataList != null) {
      data['platformdata_list'] =
          platformdataList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BubbledataList {
  double? bubbleRadius;
  String? bubbleColor;
  String? bubbleLabel;
  double? bottom;
  double? right;
  double? top;
  double? left;

  BubbledataList(
      {this.bubbleRadius,
      this.bubbleColor,
      this.bubbleLabel,
      this.bottom,
      this.right,
      this.top,
      this.left});

  BubbledataList.fromJson(Map<String, dynamic> json) {
    bubbleRadius = json['bubble_radius'];
    bubbleColor = json['bubble_color'];
    bubbleLabel = json['bubble_label'];
    bottom = json['bottom'];
    right = json['right'];
    top = json['top'];
    left = json['left'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bubble_radius'] = bubbleRadius;
    data['bubble_color'] = bubbleColor;
    data['bubble_label'] = bubbleLabel;
    data['bottom'] = bottom;
    data['right'] = right;
    data['top'] = top;
    data['left'] = left;
    return data;
  }
}

class PlatformdataList {
  String? platformName;
  double? percentage;
  String? backgroundcolor;
  String? foregroundcolor;

  PlatformdataList(
      {this.platformName,
      this.percentage,
      this.backgroundcolor,
      this.foregroundcolor});

  PlatformdataList.fromJson(Map<String, dynamic> json) {
    platformName = json['platform_name'];
    percentage = json['percentage'];
    backgroundcolor = json['backgroundcolor'];
    foregroundcolor = json['foregroundcolor'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['platform_name'] = platformName;
    data['percentage'] = percentage;
    data['backgroundcolor'] = backgroundcolor;
    data['foregroundcolor'] = foregroundcolor;
    return data;
  }
}
