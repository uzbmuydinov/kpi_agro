
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskStatusController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  int indexTab = 0;

  bool isExpandInvite = false;
  bool isExpandApproved = false;

  String group = "choose_class".tr;
  bool openTile = false;
  String groupId = "";

  set isExpandedInvite(bool value) {
    isExpandInvite = value;
    update();
  }

  set isExpandedApproved(bool value) {
    isExpandApproved = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(() {
      indexTab = tabController.index;
      update();
    });
  }

  @override
  dispose() {
    super.dispose();
    tabController.dispose();
  }

  PageController pageControl = PageController(initialPage: 0);
  int bottomIndex = 0;
  bool isLoading = false;

  Future<void> apiGetNotice() async {
    Get.snackbar("Test", "test pull to refresh");
  }

}

