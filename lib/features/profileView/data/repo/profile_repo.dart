import 'package:dartz/dartz.dart';
import 'package:hodory/features/profileView/data/models/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<String, ProfileModel>> getDetails();
  Future<Either<String, dynamic>> logout();
}
