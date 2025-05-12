import 'package:flutter/material.dart';
import 'package:hodory/core/utlis/App_keys.dart';
import 'package:hodory/core/utlis/service_locator.dart';
import 'package:hodory/hodory_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  await AppKeys.initializeSupabase();
  await setupServiceLocator();
  runApp(const HodoryApp());
}
