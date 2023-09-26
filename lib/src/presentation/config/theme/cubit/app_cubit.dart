import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/core/config/language.dart';
import 'package:inventory_tesis/src/domain/repositories/app_repo.dart';
import 'package:inventory_tesis/src/presentation/config/config.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(
    this.appPreferencesRepository,
  ) : super(AppState.initial(appPreferencesRepository));

  final AppRepository appPreferencesRepository;

  void toggleTheme() {
    if (state.themeData?.brightness == Brightness.light) {
      appPreferencesRepository.setThemeData(AppTheme.Dark);
      emit(state.copyWith(themeData: AppThemeData.appThemeData[AppTheme.Dark]));
    } else {
      appPreferencesRepository.setThemeData(AppTheme.Light);
      emit(
          state.copyWith(themeData: AppThemeData.appThemeData[AppTheme.Light]));
    }
  }

  void changeLanguage(Language language) {
    emit(state.copyWith(locale: language.locale));
    appPreferencesRepository.setLanguage(language);
  }

  // Future<void> getInternetConnectionStatus() async {
  //   final connectivityResult = await Connectivity().checkConnectivity();
  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi) {
  //     emit(state.copyWith(thereIsConnection: true));
  //   } else {
  //     emit(state.copyWith(thereIsConnection: false));
  //   }
  // }

  // void changeInternetConnectionStatus(ConnectivityResult connectivityResult) {
  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi) {
  //     emit(state.copyWith(thereIsConnection: true));
  //   } else {
  //     emit(state.copyWith(thereIsConnection: false));
  //   }
  // }
}
