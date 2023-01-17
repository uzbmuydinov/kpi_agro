import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


/// #ShowAlertDialog
void showAlertDialog({required BuildContext context, required String title, required String body, required Function() confirm}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        buttonPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
        content: Container(
          constraints: BoxConstraints(minWidth: 100.w, maxHeight: 250.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Text(
              body,
              style: TextStyle(fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          Container(
            height: 60.h,
            margin: EdgeInsets.only(top: 1.h),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey, width: 0.5.h))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Bekor qilish",
                      style: TextStyle(fontSize: 19.sp, color: Colors.red),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 0.5.h,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: confirm,
                    child: Text(
                      "Tasdiqlash".tr,
                      style: TextStyle(fontSize: 19.sp, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}

void showAlertDialogOnlyOk({required BuildContext context, required String title, required String body, required Function() confirm}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        buttonPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
        content: Container(
          constraints: BoxConstraints(minWidth: 100.w, maxHeight: 250.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Text(
              body,
              style: TextStyle(fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          Container(
            height: 60.h,
            margin: EdgeInsets.only(top: 1.h),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey, width: 0.5.h))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: confirm,
                  child: Text(
                    "Ok",
                    style: TextStyle(fontSize: 19.sp, color: Colors.blue),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}

/// #ShowEditAndDeleteDialog
/*void showEditAndDeleteDialog({
  required BuildContext context,
  required String title,
  required Function(String id, BuildContext context) delete,
  required Function(dynamic argument) edit,
  var argument,
  required String id,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        buttonPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
        actions: [
          Container(
            height: 60.h,
            margin: EdgeInsets.only(top: 1.h),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey, width: 0.5.h))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: (){
                      Get.back();
                      delete(id, context);
                    },
                    child: Text(
                      "delete".tr,
                      style: TextStyle(fontSize: 19.sp, color: Colors.red),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 0.5.h,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: (){
                      Get.back();
                      edit(argument);
                    },
                    child: Text(
                      "edit".tr,
                      style: TextStyle(fontSize: 19.sp, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}*/


