
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kpi_ndqxai/pages/login_page/login_page.dart';
import 'package:kpi_ndqxai/pages/manage_page_googleNavbar.dart';
import 'package:kpi_ndqxai/services/di_service.dart';
import 'package:kpi_ndqxai/services/lang_service.dart';
import 'package:kpi_ndqxai/services/root_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await RootService.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
       /* localizationsDelegates: const [MaterialLocalizationsDelegate()],
        supportedLocales: LangService.locales,*/
        debugShowCheckedModeBanner: false,
        title: 'KPI AndQXAI',
        theme: ThemeData(fontFamily: "Mulish"),
        initialBinding: DIService(),

        home: LoginPage(),
        //translations: LangService(),
        //locale: LangService.locale,
        fallbackLocale: LangService.fallbackLocale,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
      ),
    );


  }

}
