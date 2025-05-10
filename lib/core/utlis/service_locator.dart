// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;

// Future<void> setupServiceLocator() async {
//   getIt.registerSingletonAsync<SharedPreferences>(
//     () async => await SharedPreferences.getInstance(),
//   );

//   getIt.registerSingleton<SupabaseServices>(SupabaseServices());

//   // Wait for async singletons like SharedPreferences to be ready
//   await getIt.allReady();

//   getIt.registerSingleton<AuthRepoImpl>(
//     AuthRepoImpl(services: getIt.get<SupabaseServices>()),
//   );

//   getIt.registerSingleton<DPlacesRepoImpl>(
//     DPlacesRepoImpl(services: getIt.get<SupabaseServices>()),
//   );

//   getIt.registerSingleton<BookRepoImpl>(
//     BookRepoImpl(
//       services: getIt.get<SupabaseServices>(),
//       preferences: getIt.get<SharedPreferences>(),
//     ),
//   );
// }
