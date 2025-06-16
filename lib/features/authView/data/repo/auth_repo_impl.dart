import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hodory/core/utlis/Constatnts.dart';
import 'package:hodory/core/utlis/Supabase_services.dart';
import 'package:hodory/features/authView/data/models/signup_model.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseServices _services;

  AuthRepoImpl({required SupabaseServices services}) : _services = services;
  @override
  @override
  Future<Either<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userId = await _services.signinWithEmail(
        email: email,
        password: password,
      );

      return right(userId);
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> signUp({required SignupModel model}) async {
    try {
      final userId = await _services.signupWithEmail(
        email: model.email!,
        password: model.password!,
      );
      final currentModel = model.copyWith(id: userId);
      log(currentModel.toJson().toString());
      final response = await _services.insert(
        table: AppConstatnts.teachers,
        values: currentModel.toJson(),
      );
      return right(response);
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }
}
