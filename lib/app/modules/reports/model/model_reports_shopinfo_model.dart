class ModelReportsShopinfo {
  List<Datainfo>? datainfo;

  ModelReportsShopinfo({this.datainfo});

  ModelReportsShopinfo.fromJson(Map<String, dynamic> json) {
    if (json['datainfo'] != null) {
      datainfo = <Datainfo>[];
      json['datainfo'].forEach((v) {
        datainfo?.add(Datainfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (datainfo != null) {
      data['datainfo'] = datainfo?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datainfo {
  int? parentid;
  String? shopname;
  String? shoplogo;
  bool? sts;
  List<StoreList>? storeList;

  Datainfo(
      {this.parentid, this.shopname, this.shoplogo, this.sts, this.storeList});

  Datainfo.fromJson(Map<String, dynamic> json) {
    parentid = json['parentid'];
    shopname = json['shopname'];
    shoplogo = json['shoplogo'];
    sts = json['sts'];
    if (json['store_list'] != null) {
      storeList = <StoreList>[];
      json['store_list'].forEach((v) {
        storeList?.add(StoreList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['parentid'] = parentid;
    data['shopname'] = shopname;
    data['shoplogo'] = shoplogo;
    data['sts'] = sts;
    if (storeList != null) {
      data['store_list'] = storeList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoreList {
  int? childRowid;
  String? shopname;
  String? shoplogo;
  String? shopdatabase;
  bool? sts;
  bool? isSelected;
  String? lastSynctime;

  StoreList(
      {this.childRowid,
      this.shopname,
      this.shoplogo,
      this.shopdatabase,
      this.sts,
      this.isSelected,
      this.lastSynctime});

  StoreList.fromJson(Map<String, dynamic> json) {
    childRowid = json['child_rowid'];
    shopname = json['shopname'];
    shoplogo = json['shoplogo'];
    shopdatabase = json['shopdatabase'];
    sts = json['sts'];
    isSelected = json['isSelected'];
    lastSynctime = json['last_synctime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['child_rowid'] = childRowid;
    data['shopname'] = shopname;
    data['shoplogo'] = shoplogo;
    data['shopdatabase'] = shopdatabase;
    data['sts'] = sts;
    data['isSelected'] = isSelected;
    data['last_synctime'] = lastSynctime;
    return data;
  }
}
