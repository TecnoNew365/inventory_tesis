import 'package:flutter/material.dart';
import 'package:inventory_tesis/src/presentation/config/theme/colors.dart';
import 'package:inventory_tesis/src/presentation/config/theme/text_styles.dart';

enum AppTheme {
  // ignore: constant_identifier_names
  Light,
  // ignore: constant_identifier_names
  Dark,
}

class AppThemeData {
  AppThemeData._();

  static final appThemeData = {
    AppTheme.Light: _lightThemeData,
    AppTheme.Dark: _darkThemeData,
  };

  static final ThemeData _base = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: textStyleAppBar,
    ),
    useMaterial3: true,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle:
          textStyleLabel.copyWith(color: AppColors.primaryBlue, fontSize: 10),
      unselectedLabelStyle:
          textStyleLabel.copyWith(color: Colors.blueGrey, fontSize: 10),
      selectedItemColor: AppColors.primaryBlue,
      unselectedItemColor: Colors.blueGrey,
      backgroundColor: Colors.red,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static ThemeData get _lightThemeData {
    final baseLight = ThemeData.light();
    return baseLight.copyWith(
      scaffoldBackgroundColor: AppColors.platinum,
      canvasColor: Colors.white,
      primaryColor: AppColors.primaryBlue,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      appBarTheme: _base.appBarTheme.copyWith(
        elevation: 2,
        backgroundColor: AppColors.primaryBlue,
        titleTextStyle: textStyleAppBar.copyWith(
          color: AppColors.black,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.primaryBlue,
        ),
      ),
      bottomNavigationBarTheme: _base.bottomNavigationBarTheme.copyWith(
        backgroundColor: Colors.white,
      ),
    );
  }

  static ThemeData get _darkThemeData {
    final baseDark = ThemeData.dark();
    return baseDark.copyWith(
      primaryColor: AppColors.blueForDarkMode,
      secondaryHeaderColor: AppColors.primaryBlue,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      scaffoldBackgroundColor: const Color(0xFF1E1F20),
      cardColor: const Color(0xff2E2F33),
      appBarTheme: _base.appBarTheme.copyWith(
        elevation: 2,
        titleTextStyle: textStyleAppBar.copyWith(
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: _base.bottomNavigationBarTheme.copyWith(
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        unselectedLabelStyle:
            textStyleLabel.copyWith(color: Colors.white, fontSize: 10),
        unselectedItemColor: Colors.white,
      ),
    );
  }

  static ThemeData fromEnum(AppTheme theme) =>
      appThemeData[theme] ?? _lightThemeData;

  static ThemeData byIndex(int index) => appThemeData.values.toList()[index];
}
