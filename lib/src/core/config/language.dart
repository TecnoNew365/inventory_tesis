import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Language { en, es }

extension LanguageExtension on Language {
  String get enumName => describeEnum(this);

  Locale get locale {
    switch (this) {
      case Language.en:
        return const Locale('en', 'En');
      case Language.es:
        return const Locale('es', 'Es');
    }
  }

  String get languageName {
    switch (this) {
      case Language.en:
        return 'English';
      case Language.es:
        return 'Español';
    }
  }
}
