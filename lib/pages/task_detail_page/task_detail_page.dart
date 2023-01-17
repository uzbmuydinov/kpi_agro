
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/task_detail_page/task_detail_controller.dart';
import 'package:kpi_ndqxai/pages/task_detail_page/task_detail_view.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';
import 'package:kpi_ndqxai/views/noData.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TaskDetailController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),onPressed: (){}),
              title: const Text("Batafsil", style: AppColors.bukvalni),
              actions: [
                IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.bubble_left_bubble_right, color: Colors.black,size: 27,),splashRadius: 25),
                IconButton(onPressed: (){}, icon: const Icon(Icons.check_circle_outline,color: AppColors.mainColorGreen,size:30),splashRadius: 25),
                SizedBox(width: 10.w,)
              ],
            ),
            body: Column(
              children: [

                Expanded(
                  child: Stack(
                    children: [
                      controller.taskList.isEmpty
                          ? noData()
                          : FadeInUp(
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: TaskDetailElement(taskList: controller.taskList[0],),
                        )
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
