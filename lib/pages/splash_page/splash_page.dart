import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpi_ndqxai/pages/splash_page/splash_controller.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (SplashController controller) => Center(
          child: Lottie.asset('assets/lottie_animations/cloud-sync.json', height: 300, width: 300)
        ),
      ),
    );
  }
}
