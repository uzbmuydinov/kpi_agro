import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/manage_page_googleNavbar.dart';
import 'package:kpi_ndqxai/services/db_service.dart';
import 'package:kpi_ndqxai/services/locals/dio/base_options.dart';
import 'package:kpi_ndqxai/services/locals/dio/method.dart';
import 'package:kpi_ndqxai/services/locals/dio/routes.dart';
import 'package:kpi_ndqxai/services/utils.dart';

class LoginPageController extends GetxController {
  bool isLoading = false;
  TextEditingController hemisIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void apiPostAuthenticate() {
    String hemisId = hemisIdController.text.trim().toString();
    String password = passwordController.text.trim().toString();
    if (hemisId.isNotEmpty && password.isNotEmpty) {
      DioMethod()
          .postDio(
              api: DioRoutePath.postAuthenticate,
              body: DioRoutePath.bodyAuthenticate(
                  hemisId: hemisId, password: password))
          .then((value) => {
                getToken(value!),
              });
    } else if (hemisId.isEmpty || password.isEmpty) {
      Utils.fireToast("Maydonlarni to'gr'i to'ldiring");
    }
  }

  Future<void> getToken(Map<String, dynamic> tokenData) async {
    if (tokenData["id_token"] != null) {
      await DBService.to.setAccessToken(tokenData["id_token"]).then((value) => {
            BaseOption().updateToken(tokenData["id_token"]),
          });
      isLoading = true;
      Get.to(() => const ManageGoogleNavBar());
    } else if (tokenData["id_token"] == null) {
      Utils.fireToast("Login yoki parol xato");
    }
  }

  void setLoadingStatus(bool isLoading) {
    this.isLoading = isLoading;
    update();
  }
}
