import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kpi_ndqxai/models/all_task_model.dart';
import 'package:kpi_ndqxai/pages/task_detail_page/task_detail_controller.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';


/// #ExpansionTile
ExpansionTile expansionTile(TaskDetailController controller, int index) {
  return ExpansionTile(
    expandedCrossAxisAlignment: CrossAxisAlignment.start,
    childrenPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
    iconColor: Colors.black,
    textColor: Colors.black,
    leading: Container(
      height: 59.w,
      width: 59.w,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(
            "assets/images/unnamed.jpg",
          ))),
    ),
    title: Text(
      maxLines: 1,
      "Topshiriq nomi",
      style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis),
    ),
    subtitle: Text(
      maxLines: 1,
      "Kimdan",
      style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFADB5BD),
          overflow: TextOverflow.ellipsis),
    ),
    children: controller
        .children(index)
        .map(
          (label) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.keys.first,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                label.values.first,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              if (label.keys.first != "Muhlat")
                const Divider(
                  color: Colors.black,
                ),
            ],
          ),
        )
        .toList(),
  );
}

class TaskDetailElement extends StatelessWidget {
 final AllTaskList? taskList;

  TaskDetailElement({Key? key, required this.taskList }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.mainWhiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Topshiriq nomi",
                style: AppColors.kulrangMatn,
              ),
              SizedBox(height: 7.h),
              Text("Qo’shimcha portni ishga tushirish",
                  style: AppColors.cardHeadStyle,
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start),
              Divider(),
              Text(
                "Ma'sul shaxs",
                style: AppColors.kulrangMatn,
              ),
              SizedBox(height: 7.h),
              Text("Ibrat Ochilov",
                  style: AppColors.cardHeadStyle,
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start),
              Divider(),
              Text("Tavsif", style: AppColors.kulrangMatn),
              SizedBox(height: 7.h),
              Text("Konferensiayalr zalidagi monitorni sozlang",
                  style: AppColors.cardHeadStyle,
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start),
              Divider(),
              Text("Muhimlilik darajasi", style: AppColors.kulrangMatn),
              SizedBox(height: 7.h),
              Text("Shoshilinch",
                  style: AppColors.cardHeadStyle,
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start),
              Divider(),

              // for deadline
              Text("Muhlat", style: AppColors.kulrangMatn),
              SizedBox(height: 7.h),
              Text("12.12.2022",
                  style: AppColors.cardHeadStyle,
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start),
              Divider(),

              // for dificulty level
              Text("Qiyinlik darajasi", style: AppColors.kulrangMatn),
              SizedBox(height: 7.h),
              Text("7",
                  style: AppColors.cardHeadStyle,
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start),
              Divider(),
              // for file download filed
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    height: 50.h,
                    width: 280.w,
                    decoration: BoxDecoration(
                      color: AppColors.colorGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "File name Bu yerda uzun so'zlar yozilgani ko'rinyaptimi",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(45.w, 45.h),
                        elevation: 0.7,
                        backgroundColor: AppColors.mainColorGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {},
                    child: Icon(Icons.cloud_download_outlined,
                        color: Colors.white),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
