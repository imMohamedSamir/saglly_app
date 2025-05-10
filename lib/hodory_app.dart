import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hodory/features/HomeView/Presentaion/main_home_view.dart';
import 'package:hodory/main.dart';
import 'package:toastification/toastification.dart';

class HodoryApp extends StatelessWidget {
  const HodoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: ToastificationWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
            dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
          ),
          home: const MainHomeView(),
        ),
      ),
    );
  }
}
