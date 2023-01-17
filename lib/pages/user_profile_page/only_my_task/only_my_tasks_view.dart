import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/only_my_task/only_my_tasks_controller.dart';



/// #ExpansionTile
ExpansionTile expansionTile(

    OnlyMyTaskDetailController controller, int index) {
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
       image: DecorationImage(image: AssetImage("assets/images/unnamed.jpg",))
      ),

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

