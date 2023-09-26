import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:inventory_tesis/src/core/config/language.dart';
import 'package:inventory_tesis/src/core/constant/key_preferens.dart';
import 'package:inventory_tesis/src/domain/repositories/app_repo.dart';
import 'package:inventory_tesis/src/presentation/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Language get currentLanguage {
    // String? srtLanguage = await _cacheStorage.read<String>(keyLocale);
    final String? srtLanguage = _sharedPreferences.getString(keyLocale);

    if (srtLanguage != null) {
      return Language.values.firstWhere(
        (element) => element.toString() == 'Language.$srtLanguage',
      );
    } else {
      return Language.es;
    }
  }

  @override
  void setLanguage(Language language) {
    _sharedPreferences.setString(keyLocale, describeEnum(language));
  }

  @override
  void setThemeData(AppTheme theme) {
    _sharedPreferences.setInt(keyTheme, AppTheme.values.indexOf(theme));
  }

  @override
  ThemeData get currentTheme {
    // 0 Light 1 Dark
    final themeIndex = _sharedPreferences.getInt(keyTheme);
    if (themeIndex != null) {
      return AppThemeData.byIndex(themeIndex);
    } else {
      // If previous theme not found, use platform default
      final Brightness platformBrightness =
          SchedulerBinding.instance.window.platformBrightness;
      if (platformBrightness == Brightness.dark) {
        return AppThemeData.fromEnum(AppTheme.Dark);
      } else {
        return AppThemeData.fromEnum(AppTheme.Light);
      }
    }
  }

  // @override
  // double get currentFontSize {
  //   final double? fontSize = _sharedPreferences.getDouble(keyFontSized);
  //   return fontSize ?? 18.0;
  // }

  // @override
  // void setFontSize(double fontSized) {
  //   _sharedPreferences.setDouble(keyFontSized, fontSized);
  // }

  // @override
  // bool get showDevicePreviewFrame {
  //   final bool? showDevicePreviewFrame =
  //       _sharedPreferences.getBool(keyShowDevicePreviewFrame);
  //   return showDevicePreviewFrame ?? false;
  // }

  // @override
  // LoginStatus get currentLoginStatus {
  //   final String? loginStatusString =
  //       _sharedPreferences.getString(keyLoginStatus);
  //   if (loginStatusString == LoginStatus.logged.toString()) {
  //     return LoginStatus.logged;
  //   } else if (loginStatusString == LoginStatus.unknown.toString()) {
  //     return LoginStatus.unknown;
  //   } else {
  //     return LoginStatus.unLogged;
  //   }
  // }
}
