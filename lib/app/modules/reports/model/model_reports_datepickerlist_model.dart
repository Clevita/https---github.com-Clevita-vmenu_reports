class ModelReportsDatepickerlist {
  List<Datepickerlist>? datepickerlist;

  ModelReportsDatepickerlist({this.datepickerlist});

  ModelReportsDatepickerlist.fromJson(Map<String, dynamic> json) {
    if (json['datepickerlist'] != null) {
      datepickerlist = <Datepickerlist>[];
      json['datepickerlist'].forEach((v) {
        datepickerlist?.add(Datepickerlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (datepickerlist != null) {
      data['datepickerlist'] = datepickerlist?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datepickerlist {
  int? index;
  String? text;
  bool? is_selected;
  String? from_date;
  String? to_date;

  Datepickerlist(
      {this.index, this.text, this.is_selected, this.from_date, this.to_date});

  Datepickerlist.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    text = json['text'];
    is_selected = json['is_selected'];
    from_date = json['from_date'];
    to_date = json['to_date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['index'] = index;
    data['text'] = text;
    data['is_selected'] = is_selected;
    data['from_date'] = from_date;
    data['to_date'] = to_date;
    return data;
  }
}
