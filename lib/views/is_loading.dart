import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';
import 'package:lottie/lottie.dart';


Future progressIndicator(BuildContext context, {Color color = Colors.black54}) {
  return showDialog(
    barrierColor: color,
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: Lottie.asset(
            'assets/lottie_animations/loading.json',
            height: 80.w,
            width: 80.w,
          ),
        ),
      );
    },
  );
}

class IsLoadingPage extends StatelessWidget {
  final Color backgroundColor;
  const IsLoadingPage({Key? key, this.backgroundColor = AppColors.mainBackgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Lottie.asset(
            'assets/lottie_animations/wave_load.json',
            height: 80.w,
            width: 80.w,
          ),
        ));
  }
}