import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:logger/logger.dart';
import '../models/get_all_tasks_model.dart';
import 'db_service.dart';
import 'log_service.dart';

class NetworkService {
  static bool isTester = true;
  static String SERVER_DEVELOPMENT = "https://admin-kpi.andqxai.uz";
  static String SERVER_PRODUCTION = "https://admin-kpi.andqxai.uz";

  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-type': 'application/json; charset=UTF-8'
    };
    if (DBService.to.isLoggedIn()) {
      headers.putIfAbsent(
          "Authorization", () => 'Bearer ${DBService.to.getAccessToken()}');
      headers.putIfAbsent("device-id", () => DBService.to.getDeviceId());
    }
    return headers;
  }

  static Map<String, String> getUploadHeaders() {
    Map<String, String> headers = {'Content-type': 'multipart/form-data'};
    if (DBService.to.isLoggedIn()) {
      headers.putIfAbsent(
          "Authorization", () => 'Bearer ${DBService.to.getAccessToken()}');
      headers.putIfAbsent("device-id", () => DBService.to.getDeviceId());
    }
    return headers;
  }

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  /// /* Http Requests */

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    try {
      LogService.i(getHeaders().toString());
      Response response = await Dio(BaseOptions(
              baseUrl: getServer(),
              validateStatus: (status) => status! < 203,
              headers: getHeaders()))
          .get(api, queryParameters: params)
          .timeout(const Duration(seconds: 20),
          onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      LogService.d(response.data.toString());
      return jsonEncode(response.data);
    } on DioError catch (e) {
      LogService.d(e.response!.statusCode.toString());
      LogService.d(e.response.toString());
      callLoginPage(e.response);
      return null;
    }
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    try {
      Response response = await Dio(BaseOptions(baseUrl: getServer(), validateStatus: (status) => status! < 203,
              headers: getHeaders()))
          .post(api, data: params)
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      LogService.d(response.toString());
      return jsonEncode(response.data);
    } on DioError catch (e) {
      LogService.d(e.response.toString());
      callLoginPage(e.response);
      return null;
    }
  }

  static Future<String?> POST_MEAL(String api, List params) async {
    try {
      Response response = await Dio(BaseOptions(
              baseUrl: getServer(),
              validateStatus: (status) => status! < 203,
              headers: getHeaders()))
          .post(api, data: params)
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      LogService.i(response.toString());
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return jsonEncode(response.data);
      }
      return null;
    } on DioError catch (e) {
      callLoginPage(e.response);
      return null;
    }
  }

  static Future<String?> MULTIPART(String api, List<File> paths,
      {bool picked = false}) async {
    var formData = FormData.fromMap({
      for (var v in paths)
        DateTime.now().toString(): MultipartFile.fromBytes(
          picked
              ? v.readAsBytesSync()
              : (await rootBundle.load(v.path)).buffer.asUint8List(),
          filename: v.path.substring(v.path.lastIndexOf("/")),
        ),
    });

    try {
      Response response = await Dio(BaseOptions(
              baseUrl: getServer(),
              validateStatus: (status) => status! < 203,
              headers: getUploadHeaders()))
          .post(
        api,
        data: formData,
        onSendProgress: (int sentBytes, int totalBytes) {
          double progressPercent = sentBytes / totalBytes * 100;
          LogService.i("Progress: $progressPercent %");
        },
        onReceiveProgress: (int sentBytes, int totalBytes) {
          double progressPercent = sentBytes / totalBytes * 100;
          LogService.w("Progress: $progressPercent %");
        },
      ).timeout(const Duration(minutes: 10), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      LogService.d(response.toString());
      return jsonEncode(response.data);
    } on DioError catch (e) {
      callLoginPage(e.response);
      return null;
    }
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    try {
      Response response = await Dio(BaseOptions(
              baseUrl: getServer(),
              validateStatus: (status) => status! < 203,
              headers: getHeaders()))
          .put(api, data: params)
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      LogService.d(response.toString()); // http or https
      return jsonEncode(response.data);
    } on DioError catch (e) {
      LogService.i(e.response.toString());
      callLoginPage(e.response);
      return null;
    }
  }

  static Future<String?> PUT_ACCUNT(
      String api, Map<String, dynamic> params) async {
    try {
      Response response = await Dio(BaseOptions(
              baseUrl: getServer(),
              validateStatus: (status) => status! < 203,
              headers: getHeaders()))
          .put(api, queryParameters: params)
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      LogService.d(response.toString()); // http or https
      return jsonEncode(response.data);
    } on DioError catch (e) {
      LogService.i(e.response.toString());
      callLoginPage(e.response);
      return null;
    }
  }

  static Future<String?> PATCH(String api, Map<String, dynamic> params) async {
    try {
      Response response = await Dio(BaseOptions(
              baseUrl: getServer(),
              validateStatus: (status) => status! < 203,
              headers: getHeaders()))
          .patch(api, data: params)
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      LogService.d(response.toString()); // http or https
      return jsonEncode(response.data);
    } on DioError catch (e) {
      callLoginPage(e.response);
      return null;
    }
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    try {
      Response response = await Dio(BaseOptions(
              baseUrl: getServer(),
              validateStatus: (status) => status! < 205,
              headers: getHeaders()))
          .delete(api, data: params)
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      LogService.d(response.toString()); // http or https
      return "success";
    } on DioError catch (e) {
      LogService.i(e.response.toString());
      callLoginPage(e.response);
      return null;
    }
  }

  static void callLoginPage(Response? response) {
    if (response != null && response.statusCode == 403) {
      // DBService.to
      //     .logOut()
      //     .then((value) => Get.offAll(() => const LogInPage()));
    }
  }

  /// /* Parsing */


}
