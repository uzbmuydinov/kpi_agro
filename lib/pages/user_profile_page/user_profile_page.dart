

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/user_profile_controller.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/user_profile_view.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({Key? key}) : super(key: key);

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.mainBackgroundColor,
        // asosiy qism
        body: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: MediaQuery.of(context).size.height * 0.37,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: <Color>[
                          Color(0xff099773),
                          Color(0xff66f1c4),

                        ]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // circular avatar
                    CircleAvatar(
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 5))),
                      backgroundImage: AssetImage("assets/images/unnamed.jpg"),
                      radius: 50,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Mo'minjon Mo'ydinov", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      "Muhandis dasturchi", style: TextStyle(color: Colors.white, fontSize: 18, ),
                    ),
                    SizedBox(height: 7.h,),
                    Text(
                      "uzbflutterdeveloper@gmail.com", style: TextStyle(color: Colors.white, fontSize: 14, ),
                    ),
                  ],
                ),
              ),

              const UserFunction()
            ],
          ),
        ),
      );
    });
  }
}
