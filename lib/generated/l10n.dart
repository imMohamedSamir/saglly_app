// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `welcome back`
  String get welcome {
    return Intl.message(
      'welcome back',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `create account`
  String get create_account {
    return Intl.message(
      'create account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get SignUp {
    return Intl.message(
      'Sign up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get CreateAccount {
    return Intl.message(
      'Create a new account',
      name: 'CreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get PhoneNumber {
    return Intl.message(
      'Phone number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get PasswordHint {
    return Intl.message(
      'Enter Your Password',
      name: 'PasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmedPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmedPassword',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Male {
    return Intl.message(
      'Male',
      name: 'Male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get Female {
    return Intl.message(
      'Female',
      name: 'Female',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Already have account ? `
  String get AlreadyHaveAcc {
    return Intl.message(
      'Already have account ? ',
      name: 'AlreadyHaveAcc',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account ? `
  String get DontHaveAcc {
    return Intl.message(
      'Don\'t have account ? ',
      name: 'DontHaveAcc',
      desc: '',
      args: [],
    );
  }

  /// `Join to our community`
  String get join {
    return Intl.message(
      'Join to our community',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `My Classes`
  String get MyClasses {
    return Intl.message(
      'My Classes',
      name: 'MyClasses',
      desc: '',
      args: [],
    );
  }

  /// `Search Classes...`
  String get SearchClass {
    return Intl.message(
      'Search Classes...',
      name: 'SearchClass',
      desc: '',
      args: [],
    );
  }

  /// `No Classes yet`
  String get NoClasses {
    return Intl.message(
      'No Classes yet',
      name: 'NoClasses',
      desc: '',
      args: [],
    );
  }

  /// `Start your teaching journey by adding your first class`
  String get NoClassesMsg {
    return Intl.message(
      'Start your teaching journey by adding your first class',
      name: 'NoClassesMsg',
      desc: '',
      args: [],
    );
  }

  /// `Add Class`
  String get AddClass {
    return Intl.message(
      'Add Class',
      name: 'AddClass',
      desc: '',
      args: [],
    );
  }

  /// `Class Name`
  String get ClassName {
    return Intl.message(
      'Class Name',
      name: 'ClassName',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get dsc {
    return Intl.message(
      'Description',
      name: 'dsc',
      desc: '',
      args: [],
    );
  }

  /// `Add new class`
  String get AddNewClass {
    return Intl.message(
      'Add new class',
      name: 'AddNewClass',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Add {
    return Intl.message(
      'Add',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `Classes`
  String get Classes {
    return Intl.message(
      'Classes',
      name: 'Classes',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get History {
    return Intl.message(
      'History',
      name: 'History',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get Reports {
    return Intl.message(
      'Reports',
      name: 'Reports',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get Students {
    return Intl.message(
      'Students',
      name: 'Students',
      desc: '',
      args: [],
    );
  }

  /// `Take Attendance`
  String get TakeAttendance {
    return Intl.message(
      'Take Attendance',
      name: 'TakeAttendance',
      desc: '',
      args: [],
    );
  }

  /// `Delete Class`
  String get DeleteClass {
    return Intl.message(
      'Delete Class',
      name: 'DeleteClass',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete `
  String get DeleteClassMsg {
    return Intl.message(
      'Are you sure you want to delete ',
      name: 'DeleteClassMsg',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message(
      'Delete',
      name: 'Delete',
      desc: '',
      args: [],
    );
  }

  /// `Class Details`
  String get ClassDetails {
    return Intl.message(
      'Class Details',
      name: 'ClassDetails',
      desc: '',
      args: [],
    );
  }

  /// `No Students yet`
  String get NoStudents {
    return Intl.message(
      'No Students yet',
      name: 'NoStudents',
      desc: '',
      args: [],
    );
  }

  /// `Start your teaching journey by adding your Students`
  String get NoStudentsMsg {
    return Intl.message(
      'Start your teaching journey by adding your Students',
      name: 'NoStudentsMsg',
      desc: '',
      args: [],
    );
  }

  /// `Add Student`
  String get AddStudent {
    return Intl.message(
      'Add Student',
      name: 'AddStudent',
      desc: '',
      args: [],
    );
  }

  /// `Add New Student`
  String get AddNewStudent {
    return Intl.message(
      'Add New Student',
      name: 'AddNewStudent',
      desc: '',
      args: [],
    );
  }

  /// `Student Name`
  String get StudentName {
    return Intl.message(
      'Student Name',
      name: 'StudentName',
      desc: '',
      args: [],
    );
  }

  /// `Absent`
  String get Absent {
    return Intl.message(
      'Absent',
      name: 'Absent',
      desc: '',
      args: [],
    );
  }

  /// `Present`
  String get Present {
    return Intl.message(
      'Present',
      name: 'Present',
      desc: '',
      args: [],
    );
  }

  /// `Drag to left to edit student details`
  String get ClassDetailsInfo {
    return Intl.message(
      'Drag to left to edit student details',
      name: 'ClassDetailsInfo',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message(
      'Edit',
      name: 'Edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete Student`
  String get DeleteStudent {
    return Intl.message(
      'Delete Student',
      name: 'DeleteStudent',
      desc: '',
      args: [],
    );
  }

  /// `Attendance History`
  String get AttendanceHistory {
    return Intl.message(
      'Attendance History',
      name: 'AttendanceHistory',
      desc: '',
      args: [],
    );
  }

  /// `Class Filter`
  String get classFilter {
    return Intl.message(
      'Class Filter',
      name: 'classFilter',
      desc: '',
      args: [],
    );
  }

  /// `Select a class`
  String get classFilterHint {
    return Intl.message(
      'Select a class',
      name: 'classFilterHint',
      desc: '',
      args: [],
    );
  }

  /// `Date Filter`
  String get DateFilter {
    return Intl.message(
      'Date Filter',
      name: 'DateFilter',
      desc: '',
      args: [],
    );
  }

  /// `Date Range`
  String get DateRange {
    return Intl.message(
      'Date Range',
      name: 'DateRange',
      desc: '',
      args: [],
    );
  }

  /// `Select a date range`
  String get DateRangeHint {
    return Intl.message(
      'Select a date range',
      name: 'DateRangeHint',
      desc: '',
      args: [],
    );
  }

  /// `Select a date`
  String get DateFilterHint {
    return Intl.message(
      'Select a date',
      name: 'DateFilterHint',
      desc: '',
      args: [],
    );
  }

  /// `Just one step away`
  String get emptyHistory {
    return Intl.message(
      'Just one step away',
      name: 'emptyHistory',
      desc: '',
      args: [],
    );
  }

  /// `Use filters to see results`
  String get emptyHistoryMsg {
    return Intl.message(
      'Use filters to see results',
      name: 'emptyHistoryMsg',
      desc: '',
      args: [],
    );
  }

  /// `Use filters to see report`
  String get emptyReportsMsg {
    return Intl.message(
      'Use filters to see report',
      name: 'emptyReportsMsg',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get HelpCenter {
    return Intl.message(
      'Help Center',
      name: 'HelpCenter',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get AboutUs {
    return Intl.message(
      'About Us',
      name: 'AboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout ?`
  String get logoutMsg {
    return Intl.message(
      'Are you sure you want to logout ?',
      name: 'logoutMsg',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
