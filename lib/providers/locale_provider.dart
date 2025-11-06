import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _current = const Locale('vi');

  Locale get currentLocale => _current;

  void setLocale(Locale locale) {
    if (_current == locale) return;
    _current = locale;
    notifyListeners();
  }
}
