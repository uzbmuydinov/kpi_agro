import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/models/all_task_model.dart';
import 'package:kpi_ndqxai/models/get_all_tasks_model.dart';
import 'package:kpi_ndqxai/models/my_account_info.dart';
import 'package:kpi_ndqxai/models/user_info.dart';
import 'package:kpi_ndqxai/services/api_service.dart';
import 'package:kpi_ndqxai/services/db_service.dart';
import 'package:kpi_ndqxai/services/locals/dio/method.dart';
import 'package:kpi_ndqxai/services/locals/dio/routes.dart';
import 'package:kpi_ndqxai/services/network_service.dart';
import 'package:kpi_ndqxai/services/utils.dart';
import 'package:logger/logger.dart';

class UserHomePageController extends GetxController {
  bool isLoading = false;
  int pageNumber=0;
  int totalElements=0;
  UserInfo? userInfo;
  MyAccountInfo userHomeModel = DBService.to.getMyAccoountInfo();

  List<GetTaskModel?>? getTaskModelList=[];
  List<GetTaskModel?>? completedTaskList=[];
  List<GetTaskModel?>? AllTaskList=[];
  List<String> allGroups = <String>["Barchasi","Odatiy","Shoshilinch"];
  String status = "Topshiriq kategoryalari";
  ScrollController scrollController = ScrollController();
  // statusni almashtirish uchun dropdown funksiyasi

  void changeStatus(String? newValue) {
    status = newValue ?? status;
    update();
  }


  @override
  void onInit() {
    apiGetAccount();
    getAllTasks();
    super.onInit();
  }

// get account info from  network
  Future<void> apiGetAccount() async{
    isLoading=true;
    final response = await DioMethod().getDio(api: DioRoutePath.getAccount, params: DioRoutePath.paramsEmpty());
    if(response != null && response.data != null){
      userInfo = UserInfo.fromJson(response.data);
      isLoading=false;
      update();
    }
  }



  void getAllTasks() async {
    isLoading = true;
    update();
    try {
      var response = await NetworkService.GET(ApiService.GET_ALL_TASKS, ApiService.paramsEmpty());
      Logger().w('response  ------  --------  -------- --------  $response');
      if (response != null) {

        var result = parseResult(response);
        getTaskModelList = result;
        //Logger().wtf('description  ${result?.first?.description}');
      //  barchaTopshiriqlar =allTaskListFromJson(jsonEncode(result));
        // Logger().wtf("Mana topshiriqlar matni   ${barchaTopshiriqlar.first.title}");
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

  void getCompletedTasks() async {
    isLoading = true;
    update();
    try {
      var response = await NetworkService.GET(ApiService.GET_ALL_TASKS, ApiService.paramsEmpty());
      Logger().w('response  ------  --------  -------- --------  $response');
      if (response != null) {

        var result = parseResult(response);
        getTaskModelList = result;

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

  List<GetTaskModel?>? parseResult(String? response) {
    if(response != null){
      var getTaskModelList = getTaskModelFromJson(response);
      return getTaskModelList;
    }
    return null;
  }

/*  Future<void> getDataUserPage() async {
    if (userHomeModel == MyAccountInfo()) {
      isLoading = true;
      update();
    }
    try {
      var response = await NetworkService.GET(
          ApiService.GET_ALL_TASKS, ApiService.paramsEmpty());
      if (response != null) {
        var results = NetworkService.parseResult(response);
        await DBService.to
            .setDirectorHome(DirectorHomeModel.fromJson(results.object));
        directorHomeModel = DBService.to.getDirectorHome();
        update();
      } else {
        if (directorHomeModel == DirectorHomeModel(enable: false)) {
          Utils.fireToast("try_again");
        }
      }
    } on TimeoutException {
      Utils.fireToast("try_again");
    }
    isLoading = false;
    update();
  }*/
}
