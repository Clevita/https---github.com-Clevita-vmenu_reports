class TaxCalculation {
  static Map<String, dynamic> GetBillTaxData(
      {required double itemtotal,
      required String gsttype,
      required double gstper,
      required String fldcesstype,
      required double fldcessper,
      required String cesstype,
      required double cessper}) {
    var tax = 0.0;
    var cess = 0.0;
    var fldcess = 0.0;
    var totalwithtax = 0.0;
    var gst_exc = 0.0;
    var gst_inc = 0.0;
    var cess_exc = 0.0;
    var cess_inc = 0.0;
    var fcess_exc = 0.0;
    var fcess_inc = 0.0;

    if (gsttype.isEmpty || gsttype == 'N' || gsttype == "I") {
      gsttype = "I";
    }
    if (cesstype.isEmpty || cesstype == 'N') {
      cesstype = "I";
    }
    if (fldcesstype.isEmpty || fldcesstype == 'N') {
      fldcesstype = "I";
    }
    if (gsttype == "E" && cesstype == "E" && fldcesstype == "E") {
      tax = (itemtotal * gstper) / 100;
      gst_exc = tax;
      cess = (itemtotal * cessper) / 100;
      cess_exc = cess;
      fldcess = (itemtotal * fldcessper) / 100;
      fcess_exc = fldcess;
      totalwithtax = itemtotal + tax + fldcess + cess;
    } else if (gsttype == "E" && fldcesstype == "E" && cesstype != "E") {
      var taxablevalue = (itemtotal * 100) / (100 + cessper);
      tax = (taxablevalue * gstper) / 100;
      gst_exc = tax;
      cess = (taxablevalue * cessper) / 100;
      cess_inc = tax;
      fldcess = (taxablevalue * fldcessper) / 100;
      fcess_exc = fldcess;
      totalwithtax = itemtotal + tax + fldcess;
    } else if (gsttype == "E" && fldcesstype != "E" && cesstype == "E") {
      var taxablevalue = (itemtotal * 100) / (100 + fldcessper);
      tax = (taxablevalue * gstper) / 100;
      gst_exc = tax;
      cess = (taxablevalue * cessper) / 100;
      cess_exc = cess;
      fldcess = (taxablevalue * fldcessper) / 100;
      fcess_inc = fldcess;
      totalwithtax = itemtotal + tax + cess;
    } else if (gsttype != "E" && fldcesstype == "E" && cesstype == "E") {
      var taxablevalue = (itemtotal * 100) / (100 + gstper);
      tax = (taxablevalue * gstper) / 100;
      gst_inc = tax;
      cess = (taxablevalue * cessper) / 100;
      cess_exc = cess;
      fldcess = (taxablevalue * fldcessper) / 100;
      fcess_exc = fldcess;
      totalwithtax = itemtotal + fldcess + cess;
    } else if (gsttype == "E" && fldcesstype != "E" && cesstype != "E") {
      var taxablevalue = (itemtotal * 100) / (100 + cessper + fldcessper);
      tax = (taxablevalue * gstper) / 100;
      gst_exc = tax;
      cess = (taxablevalue * cessper) / 100;
      cess_inc = cess;
      fldcess = (taxablevalue * fldcessper) / 100;
      fcess_inc = fldcess;
      totalwithtax = itemtotal + tax;
    } else if (gsttype != "E" && fldcesstype == "E" && cesstype != "E") {
      var taxablevalue = (itemtotal * 100) / (100 + cessper + gstper);
      tax = (taxablevalue * gstper) / 100;
      gst_inc = tax;
      cess = (taxablevalue * cessper) / 100;
      cess_inc = cess;
      fldcess = (taxablevalue * fldcessper) / 100;
      fcess_exc = fldcess;
      totalwithtax = itemtotal + fldcess;
    } else if (gsttype != "E" && fldcesstype != "E" && cesstype == "E") {
      var taxablevalue = (itemtotal * 100) / (100 + fldcessper + gstper);
      tax = (taxablevalue * gstper) / 100;
      gst_inc = tax;
      cess = (taxablevalue * cessper) / 100;
      cess_exc = cess;
      fldcess = (taxablevalue * fldcessper) / 100;
      fcess_inc = fldcess;
      totalwithtax = itemtotal + cess;
    } else if (gsttype != "E" && fldcesstype != "E" && cesstype != "E") {
      var taxablevalue =
          (itemtotal * 100) / (100 + gstper + fldcessper + cessper);
      tax = (taxablevalue * gstper) / 100;
      gst_inc = tax;
      cess = (taxablevalue * cessper) / 100;
      cess_inc = cess;
      fldcess = (taxablevalue * fldcessper) / 100;
      fcess_inc = fldcess;
      totalwithtax = itemtotal;
    }
    return {
      "totalwithtax": totalwithtax,
      "tax": tax,
      "cess": cess,
      "fldcess": fldcess,
      "gst_exc": gst_exc,
      "gst_inc": gst_inc,
      "cess_exc": cess_exc,
      "cess_inc": cess_inc,
      "fcess_exc": fcess_exc,
      "fcess_inc": fcess_inc
    };
  }
}
