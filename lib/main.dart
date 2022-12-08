import 'package:covid_19/src/controllers/api_controller.dart';
import 'package:covid_19/src/screens/splash/splash_screen.dart';
import 'package:covid_19/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiController());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt("initScreen", 12);
  initScreen = prefs.getInt("initScreen");
  print('initScreen $initScreen');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Covid_19',
          theme: MyTheme.lightTheme,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
