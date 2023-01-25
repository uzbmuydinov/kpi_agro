import 'dart:async';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/models/get_current_account_model.dart';
import 'package:kpi_ndqxai/models/my_account_info.dart';
import 'package:kpi_ndqxai/pages/login_page/login_page.dart';
import 'package:kpi_ndqxai/pages/splash_page/splash_controller.dart';
import 'package:kpi_ndqxai/pages/task_detail_page/task_detail_controller.dart';
import 'package:kpi_ndqxai/pages/user_home_page/user_home_controller.dart';
import 'package:kpi_ndqxai/services/api_service.dart';
import 'package:kpi_ndqxai/services/db_service.dart';
import 'package:kpi_ndqxai/services/network_service.dart';
import 'package:kpi_ndqxai/services/utils.dart';
import 'package:kpi_ndqxai/views/is_loading.dart';
import 'package:logger/logger.dart';

class UserProfileController extends GetxController {
  List<MyAccountInfo> myAccountInfoList = [];
  bool isLoading = true;
  List<GetCurrentAccountModel>? getCurrentAccountInfoList = [];

  @override
  void onInit() {
    super.onInit();
    getCurrentAccountInfo();
  }



  void getCurrentAccountInfo() async {
    isLoading = true;
    update();
    try {
      var response = await NetworkService.GET(
          ApiService.GET_CURRENT_PROFILE, ApiService.paramsEmpty());
      Logger().w('response  ------  --------  -------- --------  $response');
      if (response != null) {
        var result = parseResult(response);
        getCurrentAccountInfoList = result as List<GetCurrentAccountModel>?;

        update();
      } else {
        Utils.fireToast("try_again".tr);
      }
    } on TimeoutException {
      Utils.fireToast("try_again".tr);
    }
    isLoading = false;
    update();
  }


  // for parse result
  GetCurrentAccountModel? parseResult(String? response) {
    if (response != null) {
      var getCurrentAccountInfoList = getCurrentAccountModelFromJson(response);
      return getCurrentAccountInfoList;
    }
    return null;
  }

  Future<void> logOut() async {
    Get.back();
    progressIndicator(Get.context!);
    try {
      /* var response = await NetworkService.DELETE(
          "${ApiService.DELETE_ONE_DEVICE}$currentDeviceId",
          ApiService.paramsEmpty());*/
      if (2 == 2) {
        await DBService.to.logOut().then((value) async {
          await Get.delete<UserHomePageController>();
          await Get.delete<UserProfileController>();
          await Get.delete<TaskDetailController>();

          await Get.delete<SplashController>();
          Get.offAll(() => const LoginPage());
        });
        Utils.fireToast("Chiqish bajarildi");
      } else {
        Get.back();
        Utils.fireToast("Xatolik! qayta urining".tr);
      }
    } on TimeoutException {
      Get.back();
      Utils.fireToast("try_again".tr);
    }
  }
}
