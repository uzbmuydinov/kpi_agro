import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/user_home_page/taskStatus/taskStatus_controller.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String description;
  final String? kimtomondanBerilgan;
  final String? deadlie;
  final Function() onTap;

  const CustomListTile({
    required this.title,
    required this.description,
    this.kimtomondanBerilgan,
    required this.onTap,
    this.deadlie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            /// date
            Container(
              width: 86.w,
              height: 70.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.colorLightBlue,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(8.r)),
              ),
              child: Text.rich(
                TextSpan(
                    text: "(day == null)",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.mainColorBlack,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: ("month == null)"),
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.mainColorBlack,
                            fontWeight: FontWeight.w500),
                      )
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),

            /// group name and icons
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (title != null)
                    Text(
                      title.tr,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.colorTextLightGrey,
                          fontWeight: FontWeight.w400),
                    ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Flexible(
                      child: Text(
                    description,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16.sp,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.mainColorBlack,
                        fontWeight: FontWeight.w500),
                  ))
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            if (kimtomondanBerilgan != null)

              /// icon arrow
              SizedBox(
                width: 15.w,
              ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.mainColorBlack,
            ),
            SizedBox(
              width: 19.w,
            )
          ],
        ),
      ),
    );
  }
}

class TaskGetCardHome extends StatelessWidget {
  /*final String title;
  final String description;
  final String deadline;
  final bool isExtra;
  final Function() onTap;
  final int? itemCount;*/

  TaskGetCardHome(
      {Key? key,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskStatusController>(builder: (controller) {
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
                  height: 130.h,
                  margin: EdgeInsets.only(
                    bottom: 15.h,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: InkWell(
                    onTap: () => Get.snackbar("title", "message"),
                      child: Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title",
                                maxLines: 1,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Description",
                                maxLines: 3,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13.sp,
                                  color: AppColors.colorTextLightGrey,
                                ),
                              ),
                            ],
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Deadline",

                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ],

                    ),

                  ),
                );

          }));
    });
  }
}
