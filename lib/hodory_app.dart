import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hodory/features/profileView/Presentaion/manager/language_cubit/language_cubit.dart';
import 'package:hodory/main.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class HodoryApp extends StatelessWidget {
  const HodoryApp({super.key, required this.page});
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      child: ToastificationWrapper(
        child: BlocProvider(
          create: (context) => LanguageCubit(),
          child: BlocBuilder<LanguageCubit, Locale>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: navigatorKey,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: state,
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
                  dialogTheme: const DialogThemeData(
                    backgroundColor: Colors.white,
                  ),
                ),
                home: page,
              );
            },
          ),
        ),
      ),
    );
  }
}
