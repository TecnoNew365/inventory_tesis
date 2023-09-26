import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:inventory_tesis/src/data/repositories/app_repository_impl.dart';
import 'package:inventory_tesis/src/domain/repositories/app_repo.dart';
import 'package:inventory_tesis/src/presentation/config/config.dart';
import 'package:inventory_tesis/src/presentation/pages/home/bloc/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await registerStorageDirectory();

  //SharedPreferences
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => preferences);

  // final packageInfo = await PackageInfo.fromPlatform();
  // injector.registerLazySingleton(() => packageInfo);

  // injector.registerLazySingleton<PackageInfoService>(
  // () => PackageInfoServiceImpl(
  // injector(),
  // ),
  // );

  // injector.registerLazySingleton<LoggerService>(() => LoggerServiceImpl());

  // Rest Client
  // injector.registerLazySingleton<Dio>(() => Dio());
  // injector.registerLazySingleton<RestApiClient>(() => RestApiClient(
  //       injector(),
  //     ));

  //Database
  // injector.registerLazySingleton<AppDatabase>(() => AppDatabase());
  // injector.registerLazySingleton<IsarServices>(() => IsarServices());

  // Register Repositories
  injector.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      injector(),
    ),
  );

  // Register Cubits
  injector.registerFactory<AppCubit>(
    () => AppCubit(
      injector(),
    ),
  );

  //Register Blocs
  injector.registerFactory<HomeBloc>(
    () => HomeBloc(),
  );
}

Future<void> registerStorageDirectory() async {
  if (kIsWeb) {
    final webStorageDirectory = Directory('');
    injector.registerLazySingleton(() => webStorageDirectory);
  } else if (Platform.isAndroid) {
    final Directory? dir = await getExternalStorageDirectory();
    if (dir != null) {
      injector.registerLazySingleton(() => dir);
    }
  } else if (Platform.isIOS) {
    final Directory dir = await getApplicationDocumentsDirectory();
    injector.registerLazySingleton(() => dir);
  }
}
