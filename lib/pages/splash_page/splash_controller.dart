import 'dart:async';

import 'package:get/get.dart';
import 'package:kpi_ndqxai/models/user_info.dart';
import 'package:kpi_ndqxai/pages/login_page/login_page.dart';
import 'package:kpi_ndqxai/pages/manage_page_googleNavbar.dart';
import 'package:kpi_ndqxai/services/db_service.dart';
import 'package:kpi_ndqxai/services/locals/dio/base_options.dart';
import 'package:kpi_ndqxai/services/locals/dio/method.dart';
import 'package:kpi_ndqxai/services/locals/dio/routes.dart';
import 'package:kpi_ndqxai/services/utils.dart';

class SplashController extends GetxController {
  UserInfo? userInfo;
  // from splash page to switch language
  void initTimer(){
    Timer(const Duration(seconds: 2), (){
      checkToken;
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

  void checkToken() async {
    update();
    try {

      final response = await DioMethod().getDio(api: DioRoutePath.getAccount, params: DioRoutePath.paramsEmpty());
      if(response != null && response.data != null){
        userInfo = UserInfo.fromJson(response.data);

        Get.off(ManageGoogleNavBar());
        update();
      }

      else {
        Get.off(LoginPage());
        Utils.fireToast("Tizimga qayta kiris".tr);
      }
    } on TimeoutException {
      Utils.fireToast("try_again".tr);
    }

    update();
  }
  check() {
    if (DBService.to.getAccessToken().isNotEmpty)  {
      Get.to(()=> const ManageGoogleNavBar());


    } else {
      Get.to(()=> const LoginPage());
    }
  }
}