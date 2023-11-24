class ModelLinechart {
  Linechartdata? linechartdata;

  ModelLinechart({this.linechartdata});

  ModelLinechart.fromJson(Map<String, dynamic> json) {
    linechartdata = json['linechartdata'] != null
        ? Linechartdata?.fromJson(json['linechartdata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (linechartdata != null) {
      data['linechartdata'] = linechartdata?.toJson();
    }
    return data;
  }
}

class Linechartdata {
  List<Gradientcolors>? gradientcolors;
  String? lefttileTitle;
  double? lefttiletitleFontsize;
  List<BottomtileNames>? bottomtileNames;
  BottomtilenamesProperty? bottomtilenamesProperty;
  List<BottomtileNames>? lefttileNames;
  BottomtilenamesProperty? lefttilenamesProperty;
  Flgriddata? flgriddata;

  Linechartdata(
      {this.gradientcolors,
      this.lefttileTitle,
      this.lefttiletitleFontsize,
      this.bottomtileNames,
      this.bottomtilenamesProperty,
      this.lefttileNames,
      this.lefttilenamesProperty,
      this.flgriddata});

  Linechartdata.fromJson(Map<String, dynamic> json) {
    if (json['gradientcolors'] != null) {
      gradientcolors = <Gradientcolors>[];
      json['gradientcolors'].forEach((v) {
        gradientcolors?.add(Gradientcolors.fromJson(v));
      });
    }
    lefttileTitle = json['lefttile_title'];
    lefttiletitleFontsize = json['lefttiletitle_fontsize'];
    if (json['bottomtile_names'] != null) {
      bottomtileNames = <BottomtileNames>[];
      json['bottomtile_names'].forEach((v) {
        bottomtileNames?.add(BottomtileNames.fromJson(v));
      });
    }
    bottomtilenamesProperty = json['bottomtilenames_property'] != null
        ? BottomtilenamesProperty?.fromJson(json['bottomtilenames_property'])
        : null;
    if (json['lefttile_names'] != null) {
      lefttileNames = <BottomtileNames>[];
      json['lefttile_names'].forEach((v) {
        lefttileNames?.add(BottomtileNames.fromJson(v));
      });
    }
    lefttilenamesProperty = json['lefttilenames_property'] != null
        ? BottomtilenamesProperty?.fromJson(json['lefttilenames_property'])
        : null;
    flgriddata = json['flgriddata'] != null
        ? Flgriddata?.fromJson(json['flgriddata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (gradientcolors != null) {
      data['gradientcolors'] = gradientcolors?.map((v) => v.toJson()).toList();
    }
    data['lefttile_title'] = lefttileTitle;
    data['lefttiletitle_fontsize'] = lefttiletitleFontsize;
    if (bottomtileNames != null) {
      data['bottomtile_names'] =
          bottomtileNames?.map((v) => v.toJson()).toList();
    }
    if (bottomtilenamesProperty != null) {
      data['bottomtilenames_property'] = bottomtilenamesProperty?.toJson();
    }
    if (lefttileNames != null) {
      data['lefttile_names'] = lefttileNames?.map((v) => v.toJson()).toList();
    }
    if (lefttilenamesProperty != null) {
      data['lefttilenames_property'] = lefttilenamesProperty?.toJson();
    }
    if (flgriddata != null) {
      data['flgriddata'] = flgriddata?.toJson();
    }
    return data;
  }
}

class Gradientcolors {
  String? color;

  Gradientcolors({this.color});

  Gradientcolors.fromJson(Map<String, dynamic> json) {
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['color'] = color;
    return data;
  }
}

class BottomtileNames {
  String? names;

  BottomtileNames({this.names});

  BottomtileNames.fromJson(Map<String, dynamic> json) {
    names = json['names'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['names'] = names;
    return data;
  }
}

class BottomtilenamesProperty {
  String? color;
  double? fontsize;
  bool? showtilename;
  int? reservedsize;
  int? interval;

  BottomtilenamesProperty(
      {this.color,
      this.fontsize,
      this.showtilename,
      this.reservedsize,
      this.interval});

  BottomtilenamesProperty.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    fontsize = json['fontsize'];
    showtilename = json['showtilename'];
    reservedsize = json['reservedsize'];
    interval = json['interval'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['color'] = color;
    data['fontsize'] = fontsize;
    data['showtilename'] = showtilename;
    data['reservedsize'] = reservedsize;
    data['interval'] = interval;
    return data;
  }
}

class Flgriddata {
  bool? showLines;
  bool? showHorizontallines;
  bool? showVerticlelines;
  int? horizontallineInterval;
  int? verticlelineInterval;
  int? maxX;
  int? minX;
  int? maxY;
  int? minY;
  List<Linechartbardata>? linechartbardata;
  bool? isCurved;
  bool? dotdata;

  Flgriddata(
      {this.showLines,
      this.showHorizontallines,
      this.showVerticlelines,
      this.horizontallineInterval,
      this.verticlelineInterval,
      this.maxX,
      this.minX,
      this.maxY,
      this.minY,
      this.linechartbardata,
      this.isCurved,
      this.dotdata});

  Flgriddata.fromJson(Map<String, dynamic> json) {
    showLines = json['show_lines'];
    showHorizontallines = json['show_horizontallines'];
    showVerticlelines = json['show_verticlelines'];
    horizontallineInterval = json['horizontalline_interval'];
    verticlelineInterval = json['verticleline_interval'];
    maxX = json['max_x'];
    minX = json['min_x'];
    maxY = json['max_y'];
    minY = json['min_y'];
    if (json['linechartbardata'] != null) {
      linechartbardata = <Linechartbardata>[];
      json['linechartbardata'].forEach((v) {
        linechartbardata?.add(Linechartbardata.fromJson(v));
      });
    }
    isCurved = json['is_curved'];
    dotdata = json['dotdata'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['show_lines'] = showLines;
    data['show_horizontallines'] = showHorizontallines;
    data['show_verticlelines'] = showVerticlelines;
    data['horizontalline_interval'] = horizontallineInterval;
    data['verticleline_interval'] = verticlelineInterval;
    data['max_x'] = maxX;
    data['min_x'] = minX;
    data['max_y'] = maxY;
    data['min_y'] = minY;
    if (linechartbardata != null) {
      data['linechartbardata'] =
          linechartbardata?.map((v) => v.toJson()).toList();
    }
    data['is_curved'] = isCurved;
    data['dotdata'] = dotdata;
    return data;
  }
}

class Linechartbardata {
  int? spot1;
  int? spot2;

  Linechartbardata({this.spot1, this.spot2});

  Linechartbardata.fromJson(Map<String, dynamic> json) {
    spot1 = json['spot1'];
    spot2 = json['spot2'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['spot1'] = spot1;
    data['spot2'] = spot2;
    return data;
  }
}
