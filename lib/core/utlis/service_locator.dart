import 'package:get_it/get_it.dart';
import 'package:hodory/core/utlis/Supabase_services.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo_impl.dart';
import 'package:hodory/features/attendanceView/data/repo/attendance_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // getIt.registerSingletonAsync<SharedPreferences>(
  //   () async => await SharedPreferences.getInstance(),
  // );

  getIt.registerSingleton<SupabaseServices>(SupabaseServices());

  // Wait for async singletons like SharedPreferences to be ready
  // await getIt.allReady();

  getIt.registerSingleton<ClassesRepoImpl>(
    ClassesRepoImpl(services: getIt.get<SupabaseServices>()),
  );
  getIt.registerSingleton<AttendanceRepoImpl>(
    AttendanceRepoImpl(services: getIt.get<SupabaseServices>()),
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
