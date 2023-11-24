class ModelReportSettings {
  List<ReportSettings>? reportSettings;

  ModelReportSettings({this.reportSettings});

  ModelReportSettings.fromJson(Map<String, dynamic> json) {
    if (json['report_settings'] != null) {
      reportSettings = <ReportSettings>[];
      json['report_settings'].forEach((v) {
        reportSettings?.add(ReportSettings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (reportSettings != null) {
      data['report_settings'] = reportSettings?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReportSettings {
  Reportbasedon? reportbasedon;
  List<Currency>? currency;
  Theme? theme;
  List<Modules>? modules;

  ReportSettings({this.reportbasedon, this.currency, this.theme, this.modules});

  ReportSettings.fromJson(Map<String, dynamic> json) {
    reportbasedon = json['reportbasedon'] != null
        ? Reportbasedon?.fromJson(json['reportbasedon'])
        : null;
    if (json['currency'] != null) {
      currency = <Currency>[];
      json['currency'].forEach((v) {
        currency?.add(Currency.fromJson(v));
      });
    }
    theme = json['theme'] != null ? Theme?.fromJson(json['theme']) : null;
    if (json['modules'] != null) {
      modules = <Modules>[];
      json['modules'].forEach((v) {
        modules?.add(Modules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (reportbasedon != null) {
      data['reportbasedon'] = reportbasedon?.toJson();
    }
    if (currency != null) {
      data['currency'] = currency?.map((v) => v.toJson()).toList();
    }
    if (theme != null) {
      data['theme'] = theme?.toJson();
    }
    if (modules != null) {
      data['modules'] = modules?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reportbasedon {
  String? type;
  Customtime? customtime;

  Reportbasedon({this.type, this.customtime});

  Reportbasedon.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    customtime = json['customtime'] != null
        ? Customtime?.fromJson(json['customtime'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    if (customtime != null) {
      data['customtime'] = customtime?.toJson();
    }
    return data;
  }
}

class Customtime {
  bool? nextday;
  String? starttime;
  String? closetime;

  Customtime({this.nextday, this.starttime, this.closetime});

  Customtime.fromJson(Map<String, dynamic> json) {
    nextday = json['nextday'];
    starttime = json['starttime'];
    closetime = json['closetime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nextday'] = nextday;
    data['starttime'] = starttime;
    data['closetime'] = closetime;
    return data;
  }
}

class Currency {
  String? name;
  String? code;
  String? position;
  bool? active;

  Currency({this.name, this.code, this.position, this.active});

  Currency.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    position = json['position'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['position'] = position;
    data['active'] = active;
    return data;
  }
}

class Theme {
  int? selectedTheme;
  String? s1COLORPRIMARY;
  String? s1COLORPRIMARYTEXT;
  String? s1COLORSECONDARY;
  String? s1COLORSECONDARYTEXT;
  String? s1COLORTERTIARY;
  String? s1COLORTERTIARYTEXT;
  String? s2COLORPRIMARY;
  String? s2COLORPRIMARYTEXT;
  String? s2COLORSECONDARY;
  String? s2COLORSECONDARYTEXT;
  String? s2COLORTERTIARY;
  String? s2COLORTERTIARYTEXT;
  String? s3COLORPRIMARY;
  String? s3COLORPRIMARYTEXT;
  String? s3COLORSECONDARY;
  String? s3COLORSECONDARYTEXT;
  String? s3COLORTERTIARY;
  String? s3COLORTERTIARYTEXT;
  String? s4COLORPRIMARY;
  String? s4COLORPRIMARYTEXT;
  String? s4COLORSECONDARY;
  String? s4COLORSECONDARYTEXT;
  String? s4COLORTERTIARY;
  String? s4COLORTERTIARYTEXT;
  String? s5COLORPRIMARY;
  String? s5COLORPRIMARYTEXT;
  String? s5COLORSECONDARY;
  String? s5COLORSECONDARYTEXT;
  String? s5COLORTERTIARY;
  String? s5COLORTERTIARYTEXT;

  Theme(
      {this.selectedTheme,
      this.s1COLORPRIMARY,
      this.s1COLORPRIMARYTEXT,
      this.s1COLORSECONDARY,
      this.s1COLORSECONDARYTEXT,
      this.s1COLORTERTIARY,
      this.s1COLORTERTIARYTEXT,
      this.s2COLORPRIMARY,
      this.s2COLORPRIMARYTEXT,
      this.s2COLORSECONDARY,
      this.s2COLORSECONDARYTEXT,
      this.s2COLORTERTIARY,
      this.s2COLORTERTIARYTEXT,
      this.s3COLORPRIMARY,
      this.s3COLORPRIMARYTEXT,
      this.s3COLORSECONDARY,
      this.s3COLORSECONDARYTEXT,
      this.s3COLORTERTIARY,
      this.s3COLORTERTIARYTEXT,
      this.s4COLORPRIMARY,
      this.s4COLORPRIMARYTEXT,
      this.s4COLORSECONDARY,
      this.s4COLORSECONDARYTEXT,
      this.s4COLORTERTIARY,
      this.s4COLORTERTIARYTEXT,
      this.s5COLORPRIMARY,
      this.s5COLORPRIMARYTEXT,
      this.s5COLORSECONDARY,
      this.s5COLORSECONDARYTEXT,
      this.s5COLORTERTIARY,
      this.s5COLORTERTIARYTEXT});

  Theme.fromJson(Map<String, dynamic> json) {
    selectedTheme = json['Selected_Theme'];
    s1COLORPRIMARY = json['1_COLOR_PRIMARY'];
    s1COLORPRIMARYTEXT = json['1_COLOR_PRIMARY_TEXT'];
    s1COLORSECONDARY = json['1_COLOR_SECONDARY'];
    s1COLORSECONDARYTEXT = json['1_COLOR_SECONDARY_TEXT'];
    s1COLORTERTIARY = json['1_COLOR_TERTIARY'];
    s1COLORTERTIARYTEXT = json['1_COLOR_TERTIARY_TEXT'];
    s2COLORPRIMARY = json['2_COLOR_PRIMARY'];
    s2COLORPRIMARYTEXT = json['2_COLOR_PRIMARY_TEXT'];
    s2COLORSECONDARY = json['2_COLOR_SECONDARY'];
    s2COLORSECONDARYTEXT = json['2_COLOR_SECONDARY_TEXT'];
    s2COLORTERTIARY = json['2_COLOR_TERTIARY'];
    s2COLORTERTIARYTEXT = json['2_COLOR_TERTIARY_TEXT'];
    s3COLORPRIMARY = json['3_COLOR_PRIMARY'];
    s3COLORPRIMARYTEXT = json['3_COLOR_PRIMARY_TEXT'];
    s3COLORSECONDARY = json['3_COLOR_SECONDARY'];
    s3COLORSECONDARYTEXT = json['3_COLOR_SECONDARY_TEXT'];
    s3COLORTERTIARY = json['3_COLOR_TERTIARY'];
    s3COLORTERTIARYTEXT = json['3_COLOR_TERTIARY_TEXT'];
    s4COLORPRIMARY = json['4_COLOR_PRIMARY'];
    s4COLORPRIMARYTEXT = json['4_COLOR_PRIMARY_TEXT'];
    s4COLORSECONDARY = json['4_COLOR_SECONDARY'];
    s4COLORSECONDARYTEXT = json['4_COLOR_SECONDARY_TEXT'];
    s4COLORTERTIARY = json['4_COLOR_TERTIARY'];
    s4COLORTERTIARYTEXT = json['4_COLOR_TERTIARY_TEXT'];
    s5COLORPRIMARY = json['5_COLOR_PRIMARY'];
    s5COLORPRIMARYTEXT = json['5_COLOR_PRIMARY_TEXT'];
    s5COLORSECONDARY = json['5_COLOR_SECONDARY'];
    s5COLORSECONDARYTEXT = json['5_COLOR_SECONDARY_TEXT'];
    s5COLORTERTIARY = json['5_COLOR_TERTIARY'];
    s5COLORTERTIARYTEXT = json['5_COLOR_TERTIARY_TEXT'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Selected_Theme'] = selectedTheme;
    data['1_COLOR_PRIMARY'] = s1COLORPRIMARY;
    data['1_COLOR_PRIMARY_TEXT'] = s1COLORPRIMARYTEXT;
    data['1_COLOR_SECONDARY'] = s1COLORSECONDARY;
    data['1_COLOR_SECONDARY_TEXT'] = s1COLORSECONDARYTEXT;
    data['1_COLOR_TERTIARY'] = s1COLORTERTIARY;
    data['1_COLOR_TERTIARY_TEXT'] = s1COLORTERTIARYTEXT;
    data['2_COLOR_PRIMARY'] = s2COLORPRIMARY;
    data['2_COLOR_PRIMARY_TEXT'] = s2COLORPRIMARYTEXT;
    data['2_COLOR_SECONDARY'] = s2COLORSECONDARY;
    data['2_COLOR_SECONDARY_TEXT'] = s2COLORSECONDARYTEXT;
    data['2_COLOR_TERTIARY'] = s2COLORTERTIARY;
    data['2_COLOR_TERTIARY_TEXT'] = s2COLORTERTIARYTEXT;
    data['3_COLOR_PRIMARY'] = s3COLORPRIMARY;
    data['3_COLOR_PRIMARY_TEXT'] = s3COLORPRIMARYTEXT;
    data['3_COLOR_SECONDARY'] = s3COLORSECONDARY;
    data['3_COLOR_SECONDARY_TEXT'] = s3COLORSECONDARYTEXT;
    data['3_COLOR_TERTIARY'] = s3COLORTERTIARY;
    data['3_COLOR_TERTIARY_TEXT'] = s3COLORTERTIARYTEXT;
    data['4_COLOR_PRIMARY'] = s4COLORPRIMARY;
    data['4_COLOR_PRIMARY_TEXT'] = s4COLORPRIMARYTEXT;
    data['4_COLOR_SECONDARY'] = s4COLORSECONDARY;
    data['4_COLOR_SECONDARY_TEXT'] = s4COLORSECONDARYTEXT;
    data['4_COLOR_TERTIARY'] = s4COLORTERTIARY;
    data['4_COLOR_TERTIARY_TEXT'] = s4COLORTERTIARYTEXT;
    data['5_COLOR_PRIMARY'] = s5COLORPRIMARY;
    data['5_COLOR_PRIMARY_TEXT'] = s5COLORPRIMARYTEXT;
    data['5_COLOR_SECONDARY'] = s5COLORSECONDARY;
    data['5_COLOR_SECONDARY_TEXT'] = s5COLORSECONDARYTEXT;
    data['5_COLOR_TERTIARY'] = s5COLORTERTIARY;
    data['5_COLOR_TERTIARY_TEXT'] = s5COLORTERTIARYTEXT;
    return data;
  }
}

class Modules {
  String? name;
  bool? active;

  Modules({this.name, this.active});

  Modules.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['active'] = active;
    return data;
  }
}
