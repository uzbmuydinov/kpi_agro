
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/only_my_task/only_my_tasks_view.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';
import 'package:kpi_ndqxai/views/noData.dart';


import 'only_my_tasks_controller.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnlyMyTaskDetailController>(
      init: OnlyMyTaskDetailController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){}),
              title: Text("Batafsil", style: AppColors.bukvalni),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bubble_left_bubble_right, color: Colors.black,size: 27,),splashRadius: 25),
                IconButton(onPressed: (){}, icon: Icon(Icons.check_circle_outline,color: AppColors.mainColorGreen,size:30),splashRadius: 25),
                SizedBox(width: 10.w,)
              ],
            ),
            body: Column(
              children: [

                Expanded(
                  child: Stack(
                    children: [
                      controller.onlyMytaskList.isEmpty
                          ? noData()
                          : FadeInUp(
                        duration: const Duration(milliseconds: 500),
                        child: ListView.builder(

                          padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h),
                          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          itemCount: controller.onlyMytaskList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 15.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r), color: Colors.white),
                            child: expansionTile(controller, index),
                            );
                          },
                        ),
                      ),
                      Visibility(
                        visible: controller.isLoading,
                        child: const IsLoadingPage(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },);
  }
}
