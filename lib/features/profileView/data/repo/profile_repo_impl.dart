import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hodory/core/utlis/Constatnts.dart';
import 'package:hodory/core/utlis/Supabase_services.dart';
import 'package:hodory/features/profileView/data/models/profile_model.dart';
import 'package:hodory/features/profileView/data/repo/profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepoImpl implements ProfileRepo {
  final SupabaseServices _services;
  final SharedPreferences _pref;

  ProfileRepoImpl({
    required SupabaseServices services,
    required SharedPreferences pref,
  }) : _services = services,
       _pref = pref;

  @override
  Future<Either<String, ProfileModel>> getDetails() async {
    try {
      final userId = _pref.getString(AppConstatnts.userId);
      final response = await _services.get(
        table: AppConstatnts.teachers,
        filters: {"id": userId},
      );

      return right(ProfileModel.fromJson(response.first));
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, dynamic>> logout() async {
    try {
      await _pref.remove(AppConstatnts.userId).then((_) {
        return right(true);
      });

      return right(true);
    } catch (e) {
      log(e.toString());
      return const Left('Error');
    }
  }
}
