import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/routing/NavigationMethod.dart';
import 'package:hodory/core/utlis/Constatnts.dart';
import 'package:hodory/core/utlis/ToastificationMethod.dart';
import 'package:hodory/features/HomeView/Presentaion/main_home_view.dart';
import 'package:hodory/features/authView/Presentaion/login_view.dart';
import 'package:hodory/features/authView/data/models/signup_model.dart';
import 'package:hodory/features/authView/data/repo/auth_repo.dart';
import 'package:hodory/main.dart';
import 'package:meta/meta.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repo, this._preferences) : super(AuthInitial());
  final AuthRepo _repo;
  final SharedPreferences _preferences;
  static AuthCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignupModel model = SignupModel();
  String email = "";
  String password = "";
  void signUp() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(AuthLoading());

      final response = await _repo.signUp(model: model);

      response.fold(
        (failure) {
          CustomToastification.errorDialog(content: "there was an error");
          emit(AuthFailure());
        },
        (success) {
          emit(AuthSuccess());
          CustomToastification.successDialog(
            content: "Registration successful",
          );
          NavigateToPage.slideFromRightandRemove(
            context: navigatorKey.currentContext!,
            page: const LoginView(),
          );
        },
      );
    } else {
      emit(AuthFailure());
    }
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(AuthLoading());

      final response = await _repo.login(email: email, password: password);

      response.fold(
        (failure) {
          CustomToastification.errorDialog(content: "there was an error");
          emit(AuthFailure());
        },
        (userId) {
          _saveId(id: userId);
          emit(AuthSuccess());
          NavigateToPage.slideFromRightandRemove(
            context: navigatorKey.currentContext!,
            page: const MainHomeView(),
          );
        },
      );
    } else {
      emit(AuthFailure());
    }
  }

  void _saveId({required String id}) async {
    await _preferences.setString(AppConstatnts.userId, id);
  }
}
