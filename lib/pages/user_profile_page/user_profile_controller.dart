
import 'dart:async';

import 'package:get/get.dart';
import 'package:kpi_ndqxai/models/my_account_info.dart';
import 'package:kpi_ndqxai/pages/login_page/login_page.dart';
import 'package:kpi_ndqxai/pages/splash_page/splash_controller.dart';
import 'package:kpi_ndqxai/pages/task_detail_page/task_detail_controller.dart';
import 'package:kpi_ndqxai/pages/user_home_page/user_home_controller.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/only_my_task/only_my_tasks_controller.dart';
import 'package:kpi_ndqxai/services/db_service.dart';
import 'package:kpi_ndqxai/services/utils.dart';
import 'package:kpi_ndqxai/views/is_loading.dart';

class UserProfileController extends GetxController{
  List<MyAccountInfo> myAccountInfoList = [];

  List menyular =["Topshiriqlarim", "Til sozlamalari", "Chiqish"];

  Future<void> logOut() async {
    Get.back();
    progressIndicator(Get.context!);
    try {
     /* var response = await NetworkService.DELETE(
          "${ApiService.DELETE_ONE_DEVICE}$currentDeviceId",
          ApiService.paramsEmpty());*/
      if (2==2) {
        await DBService.to.logOut().then((value) async {
          await Get.delete<UserHomePageController>();
          await Get.delete<UserProfileController>();
          await Get.delete<TaskDetailController>();
          await Get.delete<OnlyMyTaskDetailController>();
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