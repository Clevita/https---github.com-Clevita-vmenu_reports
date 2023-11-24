import 'dart:convert';

import 'package:get/get.dart';
import 'package:vmenu_reports/Constants.dart';

class ReportsProvider extends GetConnect {
    Future<Map<String, dynamic>> Ownerapp_getshopinfo(
      {required var jsondata}) async {
    httpClient.timeout = Duration(seconds: Constants.Http_timeout);
    try {
      var response = await post(
        '${Constants.serverapi}/get_ownerapp_shopinfo',
        jsonEncode(jsondata),
        headers: Constants.ApiHeader,
      );
      if (response.statusCode == 200) {
        return {"code": response.statusCode, "message": response.body};
      } else {
        return {"code": response.statusCode, "message": "Data Not found"};
      }
    } catch (error) {
      return {"code": 400, "message": error.toString()};
    }
  }
  
  Future<Map<String, dynamic>> Get_filter_invoice_data(
      {required Map<String, Object> jsondata}) async {
    httpClient.timeout = Duration(seconds: Constants.Http_timeout);
    try {
      var response = await post(
        '${Constants.serverapi}/get_report_invoicefilter',
        jsonEncode(jsondata),
        headers: Constants.ApiHeader,
      );
      if (response.statusCode == 200) {
        return {"code": response.statusCode, "message": response.body};
      } else {
        return {"code": response.statusCode, "message": "Data Not found"};
      }
    } catch (error) {
      return {"code": 400, "message": error.toString()};
    }
  }
    Future<Map<String, dynamic>> Report_ItemWiseTax_Getdata({required Map<String, dynamic> jsondata}) async{
   httpClient.timeout = Duration(seconds: Constants.Http_timeout);
    try {
      var response = await post(
        '${Constants.serverapi}/get_reports_saleswithtax',
      jsonEncode(jsondata),
        headers: Constants.ApiHeader,
      );
      if (response.statusCode == 200) {
        return {"code": response.statusCode, "message": response.body};
      } else {
        return {"code": response.statusCode, "message": "Data Not found"};
      }
    } catch (error) {
      return {"code": 400, "message": error.toString()};
    }
  }
  
    Future<Map<String, dynamic>> Foodstockreport_Getdata({required Map<String, dynamic> jsondata}) async{
   httpClient.timeout = Duration(seconds: Constants.Http_timeout);
    try {
     print(jsondata);
      var response = await post(
        '${Constants.serverapi}/get_report_foodcost',
      jsonEncode(jsondata),
        headers: Constants.ApiHeader,
      );
      if (response.statusCode == 200) {
        return {"code": response.statusCode, "message": response.body};
      } else {
        return {"code": response.statusCode, "message": "Data Not found"};
      }
    } catch (error) {
      return {"code": 400, "message": error.toString()};
    }
  }
  Future<Map<String, dynamic>> Get_ownerapp_revenueleakage(
      {required var jsondata}) async {
    httpClient.timeout = Duration(seconds: Constants.Http_timeout);
    try {
      var response = await post(
        '${Constants.serverapi}/reports_revenueleakage_mis',
        jsonEncode(jsondata),
        headers: Constants.ApiHeader,
      );
      if (response.statusCode == 200) {
        return {"code": response.statusCode, "message": response.body};
      } else {
        return {"code": response.statusCode, "message": "Data Not found"};
      }
    } catch (error) {
      return {"code": 400, "message": error.toString()};
    }
  }
///
 Future<Map<String, dynamic>> Registration_Check(
      {required var jsondata}) async {
    httpClient.timeout = Duration(seconds: Constants.Http_timeout);
    try {
      var response = await post(
        '${Constants.serverapi}/check_registration',
        jsonEncode(jsondata),
        headers: Constants.ApiHeader,
      );
      if (response.statusCode == 200) {
        return {"code": response.statusCode, "message": response.body};
      } else {
        return {"code": response.statusCode, "message": "Data Not found"};
      }
      // return {"code": 200, "message": "Verification Success"};
    } catch (error) {
      return {"code": 400, "message": error.toString()};
    }
  }

Future<Map<String, dynamic>>  Encrypt_loginpin({required var jsondata}) async{
  httpClient.timeout = Duration(seconds: Constants.Http_timeout);
    try {
      var response = await post(
        '${Constants.serverapi}/data_encription',
        jsonEncode(jsondata),
        headers: Constants.ApiHeader,
      );
      if (response.statusCode == 200) {
        return {"code": response.statusCode, "message":jsonDecode(response.body) };
      } else {
        return {"code": response.statusCode, "message": "Data Not found"};
      }
      // return {"code": 200, "message": "Verification Success"};
    } catch (error) {
      return {"code": 400, "message": error.toString()};
    }
}

 Future<Map<String, dynamic>> Decrypt_loginpin({required Map<String, String> jsondata}) async{try {
      var response = await post(
        '${Constants.serverapi}/data_decription',
        jsonEncode(jsondata),
        headers: Constants.ApiHeader,
      );
      if (response.statusCode == 200) {
        return {"code": response.statusCode, "message":jsonDecode(response.body) };
      } else {
        return {"code": response.statusCode, "message": "Data Not found"};
      }
      // return {"code": 200, "message": "Verification Success"};
    } catch (error) {
      return {"code": 400, "message": error.toString()};
    }}



}
