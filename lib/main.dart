import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/App_keys.dart';
import 'package:hodory/core/utlis/Constatnts.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/features/AuthView/Presentaion/login_view.dart';
import 'package:hodory/features/HomeView/Presentaion/main_home_view.dart';
import 'package:hodory/hodory_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utlis/blocObs.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  await AppKeys.initializeSupabase();
  await setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();

  runApp(HodoryApp(page: await checkUserId()));
}

Future<Widget> checkUserId() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString(AppConstatnts.userId);
  return userId == null ? const LoginView() : const MainHomeView();
}
