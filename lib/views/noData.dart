import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
Widget noData() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      /// #Lottie
      Lottie.asset("assets/lottie_animations/album_null_page.json",
          height: 150.h, width: 1.sw),
      const Text("Ma'lumot topilmadi"),
    ],
  );
}