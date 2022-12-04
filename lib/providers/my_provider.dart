import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode mode = ThemeMode.light;

  void changeLanguage(String language) {
    languageCode = language;
    notifyListeners();
  }

  void changeTheme(ThemeMode themeMode) {
    mode = themeMode;

    notifyListeners();
  }
}
