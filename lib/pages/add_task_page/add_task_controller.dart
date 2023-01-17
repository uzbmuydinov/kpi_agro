

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/models/employee_model.dart';
import 'package:kpi_ndqxai/services/locals/dio/method.dart';
import 'package:kpi_ndqxai/services/locals/dio/routes.dart';
import 'package:kpi_ndqxai/services/log_service.dart';
import 'package:logger/logger.dart';

class AddtaskController extends GetxController {

  // text editing controllers
  final taskNameController = TextEditingController();
  final executiveNameController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isSelected=false;
  List<EmployeeModel>? employeeModelList;

  DateTime startdate = DateTime.now();
  DateTime finishdate = DateTime.now();
  File? selectedFile;
  String imagePath = "";
  List<File> imageFileList = [];
  List<String> fileIds = [];
  List department = ["Bir", "Ikki", "Uch", ];
  List employees = ["Ali", "Vali", "G'ani", "Sobir", "Bobur"];
    List selectedExecutor =[];
  List checkListDepartment=[];


  @override
  void onInit() {
    apiGetEmployee();
    super.onInit();
  } // fro dropdown button
  List<String> allGroups = <String>["Odatiy","Shoshilinch"];
  String status = "Tanlash";

  // qiyinlik darajasi tanlash uchun default qiymat
  double daraja=1;

  void sendTask(){
    if (taskNameController == null||descriptionController==null) {
      Get.snackbar("To'ldirishda xatolik", "Maydonlarni to'liq to'ldiring");
      
    }
  }
  
  void changeStatus(String? newValue) {
    status = newValue ?? status;
    update();
  }
  void setDaraja(double? yangiDaraja){
    daraja =yangiDaraja??daraja;
    update();
  }

  // for allert dialog
/*  Future<void> selectExecuter(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.symmetric(horizontal: 10.w),
          title: Text(
            "Shu yerdan mas'ul shaxslar tanlanadi",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.mainColorBlack,
            ),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.spaceAround,
          content: Text(
            "Odam tanlang",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Bekor qilish",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Tasdiqlash",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      },
    );
  }*/
  void uploadImage(List<File> value) async {
    imageFileList.addAll(value);
    imagePath = value.first.path;
    update();
    LogService.e(fileIds.toString());
  }
  void uploadFileToServer(File fileSelected) async {
    selectedFile = fileSelected;
    update();
    //fileIds = await apiAlbumUpload(imageFile!);
    update();
  }

  void showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216.h,
          padding: EdgeInsets.only(top: 6.h),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: child,
        ));
  }

  void changeStartDateTime(DateTime newDate) {
    startdate = newDate;
    update();
  }

  void changeFinishDateTime(DateTime newDate) {
    finishdate = newDate;
    update();
  }

  void cancelChoosingEmployee() {
    for (int i = 0; i < selectedExecutor.length; i++) {
      selectedExecutor[i] = false;
    }
    isSelected = false;
    update();
  }

  void chooseDepartment(int index) {
    for (int i = 0; i < checkListDepartment.length; i++) {
      if (i == index) {
        checkListDepartment[i] = true;
      } else {
        checkListDepartment[i] = false;
      }
    }
    isSelected = true;
    update();
  }

  Future<void> apiGetEmployee() async{
    final response = await DioMethod().getDio(api: DioRoutePath.getEmployees, params: DioRoutePath.paramsEmpty());
    if(response != null && response.data != null){
      List responseList = response.data;
      List<EmployeeModel> employeeList = responseList.map((e) => EmployeeModel.fromJson(e)).toList();
      employeeModelList = employeeList;
      Logger().wtf("EmployeeList   ${employeeModelList?.first.lastname}");
    }
  }



}

