import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/allTasks.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/completedTask.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/taskStatus_controller.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/uncompleted.dart';
import 'package:kpi_ndqxai/pages/user_home_page/user_home_controller.dart';
import 'package:kpi_ndqxai/pages/user_home_page/user_home_view.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserHomePageController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.mainBackgroundColor,

        // asosiy qism
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 120.h, left: 15, top: 35, right: 15),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarHomePageCustom(),
              SizedBox(
                height: 8.h,
              ),
              // bu yerda dropdown
              /*  dropDownButtonForHomePage(controller, controller.status, controller.changeStatus),
                  SizedBox(height: 20.h,),*/
              TabBarCustom(),

              Container(
                height: MediaQuery.of(context).size.height - 0.1,
                child: Expanded(
                    child: TabBarView(
                        controller:
                            Get.find<TaskStatusController>().tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                      UncompeletedTask(),
                      CompletedTask(),
                      BarchaTopshiriqlar()
                    ])),
              ),


              // delete this
            ],
          ),
        ),
      );
    });
  }
}
