

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/add_task_page/add_task_page.dart';
import 'package:kpi_ndqxai/pages/sendedTask/sendedTasks_page.dart';
import 'package:kpi_ndqxai/pages/user_home_page/user_home_page.dart';
import 'package:kpi_ndqxai/pages/user_profile_page/user_profile_page.dart';

class ManagePageGoogleNavbarController extends GetxController {
  int selectedIndex = 0;

  // for check network



  static const List<Widget> widgetOptions = <Widget>[
    UserHomePage(),
    AddTaskPage(),
    SendedTasks(),
    UserAccountPage(),
  ];

}
