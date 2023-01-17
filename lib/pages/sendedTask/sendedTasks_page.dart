import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';

class SendedTasks extends StatefulWidget {
  const SendedTasks({Key? key}) : super(key: key);

  @override
  State<SendedTasks> createState() => _SendedTasksState();
}

class _SendedTasksState extends State<SendedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tayinlagan topshiriqlarim", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),backgroundColor: Colors.transparent, elevation: 0, centerTitle: true,),
      backgroundColor: AppColors.mainBackgroundColor,
      body: RefreshIndicator(
          onRefresh: () async {
            Get.snackbar("Refresh", "Test refresh");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
                                      "Qo’shimcha portni ishga tushirish",
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
                                      "Typically I like to update my version name semantically, either incrementing the major or minor number like 1.1.0 -> 1.2.0, if it has breaking changes 1.1.0 -> 2.0.0 etc. And I always increment the version number like +1 to +2.",
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
                                          "20.01.2023",
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
                }),
          )),
    );
  }
}
