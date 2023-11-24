class ModelCardchart {
  CardchartData? cardchartData;

  ModelCardchart({this.cardchartData});

  ModelCardchart.fromJson(Map<String, dynamic> json) {
    cardchartData = json['cardchart_data'] != null
        ? CardchartData?.fromJson(json['cardchart_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (cardchartData != null) {
      data['cardchart_data'] = cardchartData?.toJson();
    }
    return data;
  }
}

class CardchartData {
  int? spacing;
  int? runspacing;
  int? cardWidth;
  int? cardHeight;
  String? cardBackgrndclr;
  IconCircleavatar? iconCircleavatar;
  List<CardData>? cardData;

  CardchartData(
      {this.spacing,
      this.runspacing,
      this.cardWidth,
      this.cardHeight,
      this.cardBackgrndclr,
      this.iconCircleavatar,
      this.cardData});

  CardchartData.fromJson(Map<String, dynamic> json) {
    spacing = json['spacing'];
    runspacing = json['runspacing'];
    cardWidth = json['card_width'];
    cardHeight = json['card_height'];
    cardBackgrndclr = json['card_backgrndclr'];
    iconCircleavatar = json['icon_circleavatar'] != null
        ? IconCircleavatar?.fromJson(json['icon_circleavatar'])
        : null;
    if (json['card_data'] != null) {
      cardData = <CardData>[];
      json['card_data'].forEach((v) {
        cardData?.add(CardData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['spacing'] = spacing;
    data['runspacing'] = runspacing;
    data['card_width'] = cardWidth;
    data['card_height'] = cardHeight;
    data['card_backgrndclr'] = cardBackgrndclr;
    if (iconCircleavatar != null) {
      data['icon_circleavatar'] = iconCircleavatar?.toJson();
    }
    if (cardData != null) {
      data['card_data'] = cardData?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IconCircleavatar {
  int? radius;
  String? color;

  IconCircleavatar({this.radius, this.color});

  IconCircleavatar.fromJson(Map<String, dynamic> json) {
    radius = json['radius'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['radius'] = radius;
    data['color'] = color;
    return data;
  }
}

class CardData {
  String? icon;
  String? iconColor;
  String? title;
  String? titleColor;
  int? titleFontsize;
  String? subtitle;
  String? subtitleColor;
  int? subtitleFontsize;
  bool? showPercentage;
  Percentage? percentage;

  CardData(
      {this.icon,
      this.iconColor,
      this.title,
      this.titleColor,
      this.titleFontsize,
      this.subtitle,
      this.subtitleColor,
      this.subtitleFontsize,
      this.showPercentage,
      this.percentage});

  CardData.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    iconColor = json['icon_color'];
    title = json['title'];
    titleColor = json['title_color'];
    titleFontsize = json['title_fontsize'];
    subtitle = json['subtitle'];
    subtitleColor = json['subtitle_color'];
    subtitleFontsize = json['subtitle_fontsize'];
    showPercentage = json['show_percentage'];
    percentage = json['percentage'] != null
        ? Percentage?.fromJson(json['percentage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['icon'] = icon;
    data['icon_color'] = iconColor;
    data['title'] = title;
    data['title_color'] = titleColor;
    data['title_fontsize'] = titleFontsize;
    data['subtitle'] = subtitle;
    data['subtitle_color'] = subtitleColor;
    data['subtitle_fontsize'] = subtitleFontsize;
    data['show_percentage'] = showPercentage;
    if (percentage != null) {
      data['percentage'] = percentage?.toJson();
    }
    return data;
  }
}

class Percentage {
  bool? showtitlePercentage;
  double? value;
  int? valueFontsize;
  bool? decreaseIncrease;

  Percentage(
      {this.showtitlePercentage,
      this.value,
      this.valueFontsize,
      this.decreaseIncrease});

  Percentage.fromJson(Map<String, dynamic> json) {
    showtitlePercentage = json['showtitle_percentage'];
    value = json['value'];
    valueFontsize = json['value_fontsize'];
    decreaseIncrease = json['decrease/increase'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['showtitle_percentage'] = showtitlePercentage;
    data['value'] = value;
    data['value_fontsize'] = valueFontsize;
    data['decrease/increase'] = decreaseIncrease;
    return data;
  }
}
