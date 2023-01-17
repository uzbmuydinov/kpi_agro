
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kpi_ndqxai/services/locals/dio/base_options.dart';
import 'package:logger/logger.dart';

class DioMethod {
  Dio dio = Dio(BaseOption().baseDioOptions());

  Future<Response?> getDio(
      {required String api, required Map<String, dynamic> params}) async {
    try {
      Response response = await dio.get(api, queryParameters: params);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      }
      return null;
    } on DioError catch (e) {
      return e.response?.data;
    }
  }

  Future<dynamic> getFileDio({required String api}) async {
    Response response =
        await Dio(BaseOption().baseDioOptionsMultipart()).get(api);
    if (response.statusCode == 200) return response.data;
    return null;
  }

  Future<Map<String, dynamic>?> postDio({
    required String api,
    required Map<String, dynamic> body,
    Map<String, dynamic>? params,
  }) async {
    try {
      Logger().i(dio.options.baseUrl + api);
      Logger().i(body.toString());
      Response response =
          await dio.post(api, data: body, queryParameters: params);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      return null;
    } on DioError catch (e) {
      Logger().e(e.message);
      Logger().e(e.error.toString());
      return e.response?.data;
    }
  }

  Future<String?> postFile({
    required String api,
    required File file,
  }) async {
    FormData formData = FormData.fromMap(
      {
        "file": MultipartFile.fromFileSync(
          file.path,
          filename: DateTime.now().toIso8601String(),
        ),
      },
    );
    try {
      Response response = await Dio(BaseOption().baseDioOptionsMultipart())
          .post(api, data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonEncode(response.data);
      }
    } on DioError catch (e) {
    }
    return null;
  }

  Future<Map<String, dynamic>?> putDio({
    required String api,
    required Map<String, dynamic> params,
  }) async {
    try {
      Response response = await dio.put(api, data: jsonEncode(params));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      return null;
    } on DioError catch (e) {
      Logger().e(e.response.toString());
    }
    return null;
  }

  Future<String?> patchDio({
    required String api,
    required Map<String, dynamic> params,
  }) async {
    Response response = await dio.patch(api, queryParameters: params);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  Future<Map<String, dynamic>?> deleteDio({
    required String api,
    Map<String, dynamic>? params,
  }) async {
    try {
      if (params != null) {
        Response response = await dio.delete(api, data: params);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        }
      } else {
        Response response = await dio.delete(api);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        }
      }

      return null;
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
        return null;
      }
    }
    return null;
  }
}
