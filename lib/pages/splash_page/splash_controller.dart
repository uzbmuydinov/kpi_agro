import 'dart:async';

import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/login_page/login_page.dart';
import 'package:kpi_ndqxai/pages/manage_page_googleNavbar.dart';
import 'package:kpi_ndqxai/services/db_service.dart';
import 'package:kpi_ndqxai/services/locals/dio/base_options.dart';

class SplashController extends GetxController {

  // from splash page to switch language
  void initTimer(){
    Timer(const Duration(seconds: 2), (){
      check();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit\1

    super.onInit();
    Get.find<BaseOption>().updateToken;
    initTimer();
  }

  check() {
    if (DBService.to.getAccessToken().isNotEmpty)  {
      Get.to(()=> const ManageGoogleNavBar());


    } else {
      Get.to(()=> const LoginPage());
    }
  }
}