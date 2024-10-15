import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = true;

  setTheme({required bool turnOn}) {
    isDark = true;
    notifyListeners();
  }
}
