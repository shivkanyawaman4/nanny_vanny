import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiServices {
  static String hostUrl = "http://cgprojects.in/flutter/";

  static postRequest(
    String url,
    Map formData,
  ) async {
    // final customerData = await SharedPref.getCustomerData();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      print("url is $url");
      var response = await Dio()
          .post(url, data: formData, options: Options(headers: headers));
      final x = response.data;
      print(response);
      if (response.statusCode! < 400) {
        return x;
      } else {
        return {
          "status": "error",
          "message": x["message"] ?? "Something went wrong"
        };
      }
    } on TimeoutException {
      return {
        "status": "false",
        "message": 'The connection has timed out, Please try again!'
      };
    } on SocketException {
      debugPrint("Internet Issue! No Internet connection 😑");
      // navigatorKey.currentState!.pushReplacementNamed(noInternetRoute);
      return {
        "status": "false",
        "message": "Internet Issue! No Internet connection 😑"
      };
    } catch (e) {
      debugPrint("Error: $e");
      return {"status": "false", "message": "Connection Problem"};
    }
  }

  static getRequest(
      // String url
      ) async {
    // final customerData = await SharedPref.getCustomerData();
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      var response = await Dio().get('http://cgprojects.in/flutter/',
          options: Options(
            headers: headers,
          ));

      final x = response.data;
      if (response.statusCode! < 400) {
        return jsonDecode(x);
      } else if (response.statusCode! > 400 && response.statusCode! < 500) {
        return {
          "status": "error",
          "message": x["message"] ?? "Something went wrong"
        };
      } else {
        return {
          "status": "error",
          "message": x["message"] ?? "Something went wrong"
        };
      }
    } on TimeoutException {
      return {
        "status": "false",
        "message": 'The connection has timed out, Please try again!'
      };
    } on SocketException {
      debugPrint("Internet Issue! No Internet connection 😑");
      // navigatorKey.currentState!.pushReplacementNamed(noInternetRoute);
      return {
        "status": "false",
        "message": "Internet Issue! No Internet connection 😑"
      };
    } catch (e) {
      debugPrint("Error: $e");
      return {"status": "false", "message": "Connection Problem"};
    }
  }
}
