part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    required this.locale,
    this.themeData,
    required this.thereIsConnection,
  });

  factory AppState.initial(AppRepository _appPreferencesRepository) {
    final language = _appPreferencesRepository.currentLanguage;
    final savedTheme = _appPreferencesRepository.currentTheme;

    return AppState(
      locale: language.locale,
      themeData: savedTheme,
      thereIsConnection: true,
    );
  }

  //Set the language of the app
  final Locale? locale;
  final ThemeData? themeData;
  final bool thereIsConnection;

  @override
  List<Object?> get props => [
        locale,
        themeData,
        thereIsConnection,
      ];

  AppState copyWith({
    Locale? locale,
    ThemeData? themeData,
    double? fontSize,
    bool? thereIsConnection,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      themeData: themeData ?? this.themeData,
      thereIsConnection: thereIsConnection ?? this.thereIsConnection,
    );
  }
}
