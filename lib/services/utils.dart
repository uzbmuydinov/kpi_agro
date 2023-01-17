import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';


import 'db_service.dart';
import 'log_service.dart';

class Utils {
  static const String defaultAvatar = 'assets/images/im_account_holder.png';
  static const String defaultNoticeUrl =
      "https://www.cloudsigma.com/wp-content/uploads/Testing-out-rook_EdgeFS_Artboard-1.jpg";

  /// #GetPickedImages
  static Future<List<XFile>?> getPickedImages() async {
    try {
      final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        return selectedImages;
      } else {
        LogService.i("Not selected Image");
      }
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

  /// #OpenPicker
  static Future<XFile?> openPicker(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        return image;
      } else {
        LogService.i("Not selected Image");
      }
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

/*  static Future<Map<String, String>> deviceParams() async {
    Map<String, String> params = {};
    var deviceInfo = DeviceInfoPlugin();
    String fcmToken = DBService.to.getFirebaseToken();

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      params.addAll({
        'deviceId': iosInfo.identifierForVendor.toString(),
        'deviceType': "I",
        'phoneModel': iosInfo.utsname.machine.toString(),
        'firebaseToken': fcmToken,
      });
    } else {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      params.addAll({
        'deviceId': androidInfo.androidId.toString(),
        'deviceType': "A",
        'phoneModel': androidInfo.model.toString(),
        'firebaseToken': fcmToken,
      });
    }
    return params;
  }*/

  static fireToast(String text) async {
    await Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        timeInSecForIosWeb: 5,
        fontSize: 16.0);
  }

/*  static Date dateTime(DateTime date) {
    final formats = DateFormat('yMMMMEEEEd', 'en_US').format(date);
    late List list = formats
        .replaceAll(RegExp(r'[ ]'), '/')
        .replaceAll(RegExp(r','), '')
        .split("/");
    late Date currentDate = Date(
        week: list[0].toString().toLowerCase(),
        month: list[1].toString().toLowerCase(),
        day: list[2],
        year: list[3]);
    return currentDate;
  }*/

/*  static Future<void> showLocalNotification(String title, String body) async {
    var android = const AndroidNotificationDetails("channelId", "channelName",
        channelDescription: "channelDescription");
    var iOS = const IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);

    int id = Random().nextInt((pow(2, 31) - 1).toInt());
    await FlutterLocalNotificationsPlugin().show(id, title, body, platform);
  }*/

  static String languageSwitch({required String number, required String text}) {
    final int numberInt =
        int.parse(number.substring(number.length > 1 ? number.length - 2 : 0));
    final int n = numberInt % 10;

    if (numberInt > 4 && numberInt < 21 || numberInt == 0) {
      return jsonDecode(text)["5+"];
    } else if (n == 1) {
      return jsonDecode(text)["1"];
    } else if (n > 1 && n < 5) {
      return jsonDecode(text)["2+"];
    } else if (n > 4 && n < 10) {
      return jsonDecode(text)["5+"];
    }
    return "";
  }
}
