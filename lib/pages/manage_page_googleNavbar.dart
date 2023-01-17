
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kpi_ndqxai/pages/add_task_page/add_task_page.dart';
import 'package:kpi_ndqxai/pages/manage_page_googleNavbar_controller.dart';
import 'package:kpi_ndqxai/pages/sendedTask/sendedTask_controller.dart';
import 'package:kpi_ndqxai/pages/sendedTask/sendedTasks_page.dart';
import 'package:kpi_ndqxai/pages/user_home_page/user_home_controller.dart';
import 'package:kpi_ndqxai/pages/user_home_page/user_home_page.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/user_profile_controller.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/user_profile_page.dart';
import 'package:kpi_ndqxai/services/log_service.dart';
import 'package:logger/logger.dart';

import 'add_task_page/add_task_controller.dart';

class ManageGoogleNavBar extends StatefulWidget {
  const ManageGoogleNavBar({Key? key}) : super(key: key);

  @override
  State<ManageGoogleNavBar> createState() => _ManageGoogleNavBarState();
}

class _ManageGoogleNavBarState extends State<ManageGoogleNavBar> {
  bool isConnected =false;
  var subscription;

  void initState() {
    checkNetvork();
    Get.find<AddtaskController>();
    Get.find<UserProfileController>();
    Get.find<UserHomePageController>();
    Get.find<SendedTasksController>();

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      debugPrint("Interet ahvoli :$result");
      if (result!=ConnectivityResult.none){
        setState(() {
          isConnected=true;
          checkNetvork();
        });
      }
      // Got a new connectivity status!
    });
    super.initState();
  }

void checkNetvork(){
    if(isConnected==false){
      LogService.e("Internet yo'q");
      SnackBar(content: Text("Tarmoq yo'q"),shape: RoundedRectangleBorder());
      Get.snackbar("Internet uzildi", "Internet uzildi. Tarmoqni tekshiring", snackPosition: SnackPosition.BOTTOM);
    }
}

  static const List<Widget> _widgetOptions = <Widget>[
    UserHomePage(),
    AddTaskPage(),
    SendedTasks(),
    UserAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagePageGoogleNavbarController>(builder: (controller) {
      return Scaffold(

        backgroundColor: Colors.white,
        body: Center(
          child: _widgetOptions.elementAt(controller.selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[400]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.teal,
                iconSize: 26,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 600),
                tabBackgroundColor: Colors.grey[200]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Bosh sahifa',
                  ),
                  GButton(
                    icon: Icons.add_circle,
                    text: 'Tayinlash',
                  ),
                  GButton(
                    icon: Icons.note_alt_outlined,
                    text: 'Jo\'natilgan',
                  ),
                  GButton(
                    icon: Icons.account_circle_outlined,
                    text: 'Profil',
                  ),
                ],
                selectedIndex: controller.selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    controller.selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),

      );
    });
  }
}
