import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/taskStatus_controller.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';

class UncompeletedTask extends StatelessWidget {
  const UncompeletedTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskStatusController>(builder: (controller){
      return RefreshIndicator(
          onRefresh: () async {
            Get.snackbar("Refresh", "Test refresh");
          },
          child: ListView.builder(

              shrinkWrap: false,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 1.sw,
                  height: 170.h,
                  margin: EdgeInsets.only(
                    bottom: 15.h,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: InkWell(
                    onTap: () => Get.snackbar("title", "message"),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.allGivenTasks[index].title,
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    controller.allGivenTasks[index].description,
                                    textAlign: TextAlign.justify,
                                    maxLines: 3,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16.sp,
                                      color: AppColors.colorTextLightGrey,
                                      height: 1.3,
                                      fontStyle: FontStyle.normal,
                                      textBaseline: TextBaseline.ideographic,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.access_time,color: Colors.pink,size: 17),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        controller.allGivenTasks[index].deadline.toString(),
                                        style: TextStyle(
                                            color: Colors.pink,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              })
      );
    }



    );
  }
}


