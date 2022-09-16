import 'dart:convert';
import 'package:app_035_api/model/employeeList_model.dart';
import 'package:app_035_api/model/employeeOne_model.dart';
import 'package:http/http.dart';
import '../model/user_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  //APIs

  static String Api_Emp_List = "/api/v1/employees";
  static String Api_Emp_One = "/api/v1/employee/"; //id
  static String Api_Emp_Create = "/api/v1/create";
  static String Api_Emp_Update = "/api/v1/update/"; //id
  static String Api_Emp_Delete = "/api/v1/delete/"; //id

  //Requests

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    print(api);
    var uri = Uri.http(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  //Params
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(User user) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(User user) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
    });
    return params;
  }

  static Map<String, String> paramsDelete() {
    Map<String, String> params = new Map();
    return params;
  }

  //parsing
  static parseEmpList(String body) {
    dynamic json = jsonDecode(body);
    var data1 = EmpList.fromJson(json);
    return data1;
  }

  static parseEmpOne(String body){
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }
}