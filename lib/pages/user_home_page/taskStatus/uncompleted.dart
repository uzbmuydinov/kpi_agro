import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/user_home_page/user_home_controller.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';

class UnCompletedTask extends GetView<UserHomePageController> {
  const UnCompletedTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserHomePageController>(
      builder: (ctr) {
        return RefreshIndicator(
            onRefresh: () async {
              Get.snackbar("Refresh", "Test refresh");
            },
            child: ListView.builder(
                shrinkWrap: false,
                itemCount: controller.getTaskModelList?.length,
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
                                      "${controller.getTaskModelList?[index]?.title}",
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
                                      "${controller.getTaskModelList?[index]?.description}",
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
                                          "${Get.find<UserHomePageController>().getTaskModelList?[index]?.deadline.toString()}",
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

/*
CustomListTile(
title: "Tarmoqni tekshiring",
description:
"Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into",
onTap: () {
Get.snackbar("Eslatma", "Shu yerda detail pagega o'tiladi");
},
deadlie: "11.11.2011",
kimtomondanBerilgan: "Muhammadqodir",
)*/
