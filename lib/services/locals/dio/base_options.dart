import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/services/db_service.dart';
import 'package:kpi_ndqxai/services/locals/dio/header.dart';
import 'package:kpi_ndqxai/services/locals/dio/routes.dart';
import 'package:logger/logger.dart';

class BaseOption extends GetxController {
  String token = DBService.to.getAccessToken();

  void updateToken(String token2) {
    token = token2;
    Logger().d("token  $token");
    update();
  }

  BaseOptions baseDioOptions() {
    return BaseOptions(
      baseUrl: DioRoutePath.baseUrl,
      headers: headerNanMultipart(
          "Bearer ${DBService.to.getAccessToken()}"),
    );
  }

  BaseOptions baseDioOptionsMultipart() {
   Logger().w(DBService.to.getAccessToken());
   return BaseOptions(
      baseUrl: DioRoutePath.baseUrl,
      headers: headersMultipart(
          "Bearer ${DBService.to.getAccessToken()}"),
    );
  }

  BaseOptions baseDioOptionsDelete() {
    Logger().w(DBService.to.getAccessToken());
    return BaseOptions(
      baseUrl: DioRoutePath.baseUrl,
      headers: headersDelete(
          "Bearer ${DBService.to.getAccessToken()}"),
    );
  }
}
