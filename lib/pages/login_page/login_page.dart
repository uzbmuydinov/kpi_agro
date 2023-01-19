

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/login_page/login_page_controller.dart';
import 'package:kpi_ndqxai/pages/login_page/login_page_view.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';

import '../../views/is_loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.mainBackgroundColor,
          body: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200.h,
                      ),
                      FadeInDown(
                        duration: Duration(seconds: 1),
                        child: Container(
                          height: 140.h,
                          width: 140.h,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/andqxai-logo.png"))),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      FadeInDown(
                        duration: Duration(seconds: 1),
                        child: const Text(
                          "KPI AndQXAI",
                          style: AppColors.mainTextSyle,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      // Login field only number
                      /*LoginHemisField(loginFieldController: controller.hemisIdController,),*/
                      FadeInUp(
                        duration: Duration(seconds: 1),
                        child: LoginTextField(
                            loginFieldController: controller.hemisIdController),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      // for password input
                      FadeInUp(
                        duration: Duration(seconds: 1),
                        child: PasswordField(
                            passwordFieldController:
                                controller.passwordController),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),

                      FadeInUp(
                        duration: Duration(seconds: 1),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              backgroundColor: AppColors.mainColorGreen,
                              elevation: 0,
                              fixedSize: Size(252.w, 50.h)),
                          onPressed: () {
                            controller.apiPostAuthenticate();
                            controller.hemisIdController.clear();
                            controller.passwordController.clear();
                            // Get.to(const ManagePage());
                            // debugPrint("Home pagega o'tdimi");
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: AppColors.mainWhiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: controller.isLoading,
                  child: const IsLoadingPage(
                    backgroundColor: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
