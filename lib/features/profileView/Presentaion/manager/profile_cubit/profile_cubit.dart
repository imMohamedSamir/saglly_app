import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/routing/NavigationMethod.dart';
import 'package:hodory/features/AuthView/Presentaion/login_view.dart';
import 'package:hodory/features/profileView/data/models/profile_model.dart';
import 'package:hodory/features/profileView/data/repo/profile_repo.dart';
import 'package:hodory/main.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repo) : super(ProfileInitial());
  final ProfileRepo _repo;
  static ProfileCubit get(context) => BlocProvider.of(context);
  void getDetails() async {
    emit(ProfileLoading());
    final result = await _repo.getDetails();
    result.fold(
      (l) {
        emit(ProfileFailure());
      },
      (profile) {
        emit(ProfileSuccess(profile: profile));
      },
    );
  }

  void logout() async {
    final result = await _repo.logout();
    result.fold(
      (l) {
        emit(ProfileFailure());
      },
      (profile) {
        NavigateToPage.slideFromTopAndRemove(
          context: navigatorKey.currentContext!,
          page: const LoginView(),
        );
      },
    );
  }
}
