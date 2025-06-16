import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<Locale> {
  static const String _selectedLanguageKey = 'selected_language';
  static const List<Locale> supportedLocales = [Locale('en'), Locale('ar')];
  static LanguageCubit get(context) => BlocProvider.of(context);
  final ValueNotifier<String?> groupValue = ValueNotifier<String?>(null);

  LanguageCubit() : super(const Locale('en')) {
    _loadSavedLanguage();
    // groupValue.value = Intl.getCurrentLocale();
  }

  void changeLanguage(Locale newLocale) {
    if (supportedLocales.contains(newLocale)) {
      emit(newLocale);
      _saveLanguage(newLocale);
      // NavigateToPage.slideFromLeftAndRemove(
      //     context: context, page: const SplashView());
    }
  }

  Future<void> _saveLanguage(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedLanguageKey, locale.languageCode);
  }

  Future<void> _loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString(_selectedLanguageKey);
    if (languageCode != null) {
      emit(Locale(languageCode));
      groupValue.value = languageCode;
    }
  }
}
