
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/user_profile_controller.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';
import 'package:kpi_ndqxai/views/showCustomAllertDialog.dart';

class UserFunction extends StatelessWidget {
  const UserFunction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(builder: (controller) {
      return Container(
        width: 1.sw,
        decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// for language
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  /* Get.to(
                        () => NextLanguagePage(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 150),
                  );*/
                },
                radius: 1000,
                splashColor: Colors.grey.shade200,
                child: Container(
                  height: 62.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                          bottom: BorderSide(
                              color: const Color(0xFFB3B3B3), width: 1.sp))),
                  child: Row(
                    children: [
                      Text(
                        "Profilni tahrirlash",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),

                      /// Language
                      Image(
                        image: const AssetImage(
                          "assets/images/notes.png",
                        ),
                        width: 24.w,
                        height: 24.h,
                        color: AppColors.mainColorBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// for complaints page
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  showAlertDialogOnlyOk(

                      title: 'Bildirgi',
                      confirm: () {
                       Get.back();
                      },
                      context: context,
                      body: 'Kechirasiz, hozircha tillar boshqaruvi menyusi amalda emas. Keyingi talqinlarimizda bu imkoniatni taqdim etamiz.');
                  /*Get.to(() => const DirectorReportPage(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 150),
                  );*/
                },
                radius: 1000,
                splashColor: Colors.grey.shade200,
                child: Container(
                  height: 62.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                          bottom: BorderSide(
                              color: const Color(0xFFB3B3B3), width: 1.sp))),
                  child: Row(
                    children: [
                      Text(
                        "Til boshqaruvi",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),

                      /// report icon
                      Image(
                        image: const AssetImage(
                          "assets/images/language_icon.png",
                        ),
                        width: 26.w,
                        height: 26.h,
                        color: AppColors.mainColorBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // for change password
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.snackbar(
                      "Tekshir", "Ishlavattimi",
                      barBlur: 40,
                      animationDuration: Duration(milliseconds: 400),
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 2),
                      snackStyle: SnackStyle.FLOATING,
                      margin: EdgeInsets.symmetric(vertical: 70),
                      maxWidth: MediaQuery.of(context).size.width*0.9
                  );
                  /*Get.to(() => const DirectorReportPage(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 150),
                  );*/
                },
                radius: 1000,
                splashColor: Colors.grey.shade200,
                child: Container(
                  height: 62.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                          bottom: BorderSide(
                              color: const Color(0xFFB3B3B3), width: 1.sp))),
                  child: Row(
                    children: [
                      Text(
                        "Parolni almashtirish",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),

                      /// report icon
                      Image(
                        image: const AssetImage(
                          "assets/images/refresh.png",
                        ),
                        width: 26.w,
                        height: 26.h,
                        color: AppColors.mainColorBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // for log out
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  showAlertDialog(
                      title: 'Chiqish',
                      confirm: () {
                        controller.logOut();
                      },
                      context: context,
                      body: 'Chiqishni xoxlaysizmi?');
                },
                radius: 1000,
                splashColor: Colors.grey.shade200,
                child: Container(
                  height: 62.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(

                        bottom: BorderSide(
                            color: const Color(0xFFB3B3B3), width: 1.sp),)),
                  child: Row(
                    children: [
                      Text(
                        "Chiqish".tr,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Image(
                        image:
                            const AssetImage("assets/images/log_out_icon.png"),
                        width: 26.w,
                        height: 26.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Todo bu testni keyin o'chirvaramiz
            // test user list
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {

                },
                radius: 1000,
                splashColor: Colors.grey.shade200,
                child: Container(
                  height: 62.h,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Text(
                        "Ishchilar".tr,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Image(
                        image:
                        const AssetImage("assets/images/672774.png"),
                        width: 26.w,
                        height: 26.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      );
    });
  }
}
