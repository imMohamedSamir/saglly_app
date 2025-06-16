import 'package:get_it/get_it.dart';
import 'package:hodory/core/utlis/Supabase_services.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo_impl.dart';
import 'package:hodory/features/attendanceView/data/repo/attendance_repo_impl.dart';
import 'package:hodory/features/authView/data/repo/auth_repo_impl.dart';
import 'package:hodory/features/profileView/data/repo/profile_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  getIt.registerSingleton<SupabaseServices>(SupabaseServices());

  // Wait for async singletons like SharedPreferences to be ready
  await getIt.allReady();

  getIt.registerSingleton<ClassesRepoImpl>(
    ClassesRepoImpl(
      services: getIt.get<SupabaseServices>(),
      pref: getIt.get<SharedPreferences>(),
    ),
  );
  getIt.registerSingleton<AttendanceRepoImpl>(
    AttendanceRepoImpl(services: getIt.get<SupabaseServices>()),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(services: getIt.get<SupabaseServices>()),
  );
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      services: getIt.get<SupabaseServices>(),
      pref: getIt.get<SharedPreferences>(),
    ),
  );
  // getIt.registerSingleton<DPlacesRepoImpl>(
  //   DPlacesRepoImpl(services: getIt.get<SupabaseServices>()),
  // );

  // getIt.registerSingleton<BookRepoImpl>(
  //   BookRepoImpl(
  //     services: getIt.get<SupabaseServices>(),
  //     preferences: getIt.get<SharedPreferences>(),
  //   ),
  // );
}
