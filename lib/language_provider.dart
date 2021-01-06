import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_sample/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Language _language;
  SharedPreferences _preferences;

  Language get language => _language;

  LanguageProvider() {
    _initializeLanguageFromPrefs();
  }

  // to change language
  Future<void> changeLanguage(String languageCode) async {
    switch (languageCode) {
      case "eng":
        _language = Language.fromJson(
            await _getJson('assets/jsons/eng.json'), languageCode);
        break;

      case "hindi":
        _language = Language.fromJson(
            await _getJson('assets/jsons/hindi.json'), languageCode);
        break;

      default:
        _language = Language.fromJson(
            await _getJson('lib/intl/eng.json'), languageCode);
        break;
    }
    _updatePrefs(languageCode);
    notifyListeners();
  }

  Future<void> _updatePrefs(String langCode) async {
    await _preferences.setString('Language Code', langCode);
  }

  // fetch json from assets
  Future<dynamic> _getJson(String assetPath) async {
    return jsonDecode(await rootBundle.loadString(assetPath));
  }

  Future<void> _initializeLanguageFromPrefs() async {
    _preferences = await SharedPreferences.getInstance();
    String langCode = _preferences.getString('Language Code') ?? 'eng';
    changeLanguage(langCode);
  }
}
