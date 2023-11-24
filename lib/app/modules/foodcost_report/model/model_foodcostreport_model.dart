class ModelFoodcostreport {
  String? shopname;
  String? shopmobile;
  String? shopaddress;
  String? shopgst;
  String? fromDate;
  String? toDate;
  List<ListData>? listData;

  ModelFoodcostreport(
      {this.shopname,
      this.shopmobile,
      this.shopaddress,
      this.shopgst,
      this.fromDate,
      this.toDate,
      this.listData});

  ModelFoodcostreport.fromJson(Map<String, dynamic> json) {
    shopname = json['shopname'];
    shopmobile = json['shopmobile'];
    shopaddress = json['shopaddress'];
    shopgst = json['shopgst'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    if (json['list_data'] != null) {
      listData = <ListData>[];
      json['list_data'].forEach((v) {
        listData?.add(ListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['shopname'] = shopname;
    data['shopmobile'] = shopmobile;
    data['shopaddress'] = shopaddress;
    data['shopgst'] = shopgst;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    if (listData != null) {
      data['list_data'] = listData?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListData {
  String? date;
  double? openingstockvalue;
  double? purchasevalue;
  double? closingstockvalue;
  double? sales;
  double? foodcost;
  double? foodcostinpercentage;

  ListData(
      {this.date,
      this.openingstockvalue,
      this.purchasevalue,
      this.closingstockvalue,
      this.sales,
      this.foodcost,
      this.foodcostinpercentage});

  ListData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    openingstockvalue = json['openingstockvalue'];
    purchasevalue = json['purchasevalue'];
    closingstockvalue = json['closingstockvalue'];
    sales = json['sales'];
    foodcost = json['foodcost'];
    foodcostinpercentage = json['foodcostinpercentage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['openingstockvalue'] = openingstockvalue;
    data['purchasevalue'] = purchasevalue;
    data['closingstockvalue'] = closingstockvalue;
    data['sales'] = sales;
    data['foodcost'] = foodcost;
    data['foodcostinpercentage'] = foodcostinpercentage;
    return data;
  }
}
