import 'package:get/get.dart';
class bottomController extends GetxController {
  List<bool> checkList = [];
  bool isSelected=false;

  void cancelChoosingGroup({String? isBack}) {
    for (int i = 0; i < checkList.length; i++) {
      checkList[i] = false;
    }
    isSelected = false;
    update();
    if (isBack == null) {
      Get.back();
    }
  }
}
