import 'package:dartz/dartz.dart';

import '../models/signup_model.dart';

abstract class AuthRepo {
  Future<Either<String, dynamic>> signUp({required SignupModel model});
  Future<Either<String, dynamic>> login({
    required String email,
    required String password,
  });
}
