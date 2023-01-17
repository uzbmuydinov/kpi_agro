import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/add_task_page/add_task_controller.dart';
import 'package:kpi_ndqxai/pages/login_page/login_page_controller.dart';
import 'package:kpi_ndqxai/pages/manage_page_googleNavbar_controller.dart';
import 'package:kpi_ndqxai/pages/sendedTask/sendedTask_controller.dart';
import 'package:kpi_ndqxai/pages/splash_page/splash_controller.dart';
import 'package:kpi_ndqxai/pages/task_detail_page/task_detail_controller.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/taskStatus_controller.dart';

import 'package:kpi_ndqxai/pages/user_home_page/user_home_controller.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/only_my_task/only_my_tasks_controller.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/user_profile_controller.dart';
import 'package:kpi_ndqxai/services/locals/dio/base_options.dart';


class DIService implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<TaskStatusController>(() => TaskStatusController(), fenix: true);

    Get.lazyPut<ManagePageGoogleNavbarController>(() => ManagePageGoogleNavbarController(), fenix: true);
    //Get.lazyPut<EmployeeController>(() => EmployeeController(), fenix: true);

    Get.lazyPut<BaseOption>(() => BaseOption(), fenix: true);
    Get.lazyPut<AddtaskController>(() => AddtaskController(), fenix: true);

    Get.lazyPut<SendedTasksController>(() => SendedTasksController(), fenix: true);
    Get.lazyPut<UserProfileController>(() => UserProfileController(),
        fenix: true);
    Get.lazyPut<UserHomePageController>(() => UserHomePageController(),
        fenix: true);
    Get.lazyPut<TaskDetailController>(() => TaskDetailController(),
        fenix: true);
    Get.lazyPut<OnlyMyTaskDetailController>(() => OnlyMyTaskDetailController(),
        fenix: true);
  }
}
