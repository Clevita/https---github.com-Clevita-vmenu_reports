class ModelReportItemwisetax {
  String? reportName;
  String? fromDate;
  String? toDate;
  double? nettotal;
  double? totalTaxable;
  String? shopname;
  String? shopAddress;
  String? shopMobileno;
  String? shopGst;
  int? totalCount;
  List<ListReportdata>? listReportdata;

  ModelReportItemwisetax(
      {this.reportName,
      this.fromDate,
      this.toDate,
      this.nettotal,
      this.totalTaxable,
      this.shopname,
      this.shopAddress,
      this.shopMobileno,
      this.shopGst,
      this.totalCount,
      this.listReportdata});

  ModelReportItemwisetax.fromJson(Map<String, dynamic> json) {
    reportName = json['report_name'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    nettotal = json['nettotal'];
    totalTaxable = json['total_taxable'];
    shopname = json['shopname'];
    shopAddress = json['shop_address'];
    shopMobileno = json['shop_mobileno'];
    shopGst = json['shop_gst'];
    totalCount = json['total_count'];
    if (json['list_reportdata'] != null) {
      listReportdata = <ListReportdata>[];
      json['list_reportdata'].forEach((v) {
        listReportdata?.add(ListReportdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['report_name'] = reportName;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['nettotal'] = nettotal;
    data['total_taxable'] = totalTaxable;
    data['shopname'] = shopname;
    data['shop_address'] = shopAddress;
    data['shop_mobileno'] = shopMobileno;
    data['shop_gst'] = shopGst;
    data['total_count'] = totalCount;
    if (listReportdata != null) {
      data['list_reportdata'] = listReportdata?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListReportdata {
  String? date;
  int? billno;
  String? categoryname;
  String? itemname;
  String? sectionname;
  double? qty;
  double? rate;
  String? gsttype;
  double? taxable;
  String? tax;
  double? total;

  ListReportdata(
      {this.date,
      this.billno,
      this.categoryname,
      this.itemname,
      this.sectionname,
      this.qty,
      this.rate,
      this.gsttype,
      this.taxable,
      this.tax,
      this.total});

  ListReportdata.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    billno = json['billno'];
    categoryname = json['categoryname'];
    itemname = json['itemname'];
    sectionname = json['sectionname'];
    qty = json['qty'];
    rate = json['rate'];
    gsttype = json['gsttype'];
    taxable = json['taxable'];
    tax = json['tax'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['billno'] = billno;
    data['categoryname'] = categoryname;
    data['itemname'] = itemname;
    data['sectionname'] = sectionname;
    data['qty'] = qty;
    data['rate'] = rate;
    data['gsttype'] = gsttype;
    data['taxable'] = taxable;
    data['tax'] = tax;
    data['total'] = total;
    return data;
  }
}
