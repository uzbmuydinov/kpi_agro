import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';
import 'package:lottie/lottie.dart';

class OnlyMyTaskDetailController extends GetxController {
  bool isLoading = false;
  //List<TasksModel> taskList = [];

  List onlyMytaskList = [1,2,3];

  // for expension tile elements
  List<Map<String, String>> children(int index) {
    return [
      {"Topshiriq nomi": "Qo’shimcha port ishga tushirsin"},
      {"Ma’sul shaxs": "Ibrat Ochilov"},
      {"Tavsif".tr: "Yuklama ko’ppayganligi sababli qo’shimcha portni ishga tushiring"},
      {
        "Muhimlilik darajasi":"Shoshilinch"
      },
      {
        "Muhlat".tr: "17.05.2022".toString().substring(0, 10)
      },
    ];
  }
}

// for loading lottie
class IsLoadingPage extends StatelessWidget {
  final Color backgroundColor;
  const IsLoadingPage({Key? key, this.backgroundColor = AppColors.mainBackgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Lottie.asset(
            'assets/lottie_animations/loading.json',
            height: 80.w,
            width: 80.w,
          ),
        ));
  }
}



