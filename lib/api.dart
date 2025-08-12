import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//________________get__________________________//
class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data; //_____****_____________-//
    } else {
      throw Exception('there is an  error in stat code ${response.statusCode}');
    }
  }

  //__________________________post________________//
  Future<dynamic> post(
      {required String urL,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response =
        await http.post(Uri.parse(urL), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "there is  error  in status code ${response.statusCode} with body ${jsonDecode(response.body)})");
    }
  }

  //______________________________put_________________________________//
  Future<dynamic> put(
      {required String urL,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    print("url $urL body $body token $token"); //اشوف اني وين رايح//
    http.Response response =
        await http.post(Uri.parse(urL), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          "there is  error  in status code ${response.statusCode} with body ${jsonDecode(response.body)})");
    }
  }
}
