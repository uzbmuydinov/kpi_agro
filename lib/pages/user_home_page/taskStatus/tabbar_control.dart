import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/allTasks.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/completedTask.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/taskStatus_controller.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/uncompleted.dart';
import 'package:kpi_ndqxai/pages/user_home_page/user_home_view.dart';

class TabControl extends StatefulWidget {
  const TabControl({Key? key}) : super(key: key);

  @override
  State<TabControl> createState() => _TabControlState();
}

class _TabControlState extends State<TabControl> {
  @override
  void initState() {
    Get.find<TaskStatusController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskStatusController>(
        init: TaskStatusController(),
        builder: (TaskStatusController controller) {
          return Scaffold(
            appBar: AppBar(
              title: TabBarCustom(),
            ),
            body: PageView(

              //physics: NeverScrollableScrollPhysics(),
              controller: controller.pageControl,
              scrollDirection: Axis.vertical,
              children: const [
                UncompeletedTask(),
                CompletedTask(),
                BarchaTopshiriqlar()
              ],
            ),

          );
        });
  }
}
