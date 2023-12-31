import 'dart:convert';
import 'package:bath_service_project/Utils/preference.dart';
import 'package:bath_service_project/models/base_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WebServices {
  static const _baseURL = "https://cqpplefitting.com/ad_cqpple/Api/";
  static const _deleteAccountFlag = "${_baseURL}Flag";
  static const _deleteAccount = "${_baseURL}UserDelete";

  static Future<BaseModel> getDeleteAccountFlag() async {
    var response = await http.get(Uri.parse(_deleteAccountFlag));
    final json = jsonDecode(response.body);
    return BaseModel.fromJson(json);
  }

  static Future<BaseModel> deleteAccount() async {
    final apikey = PreferencesManager.getAPIKey();
    Map map = {"apikey": apikey};
    var response = await http.post(Uri.parse(_deleteAccount), body: map);
    final json = jsonDecode(response.body);
    if (kDebugMode) {
      print(json);
    }
    return BaseModel.fromJson(json);
  }
}
