import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:provider_sample/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

final languageCodeProvider =
    StateNotifierProvider<LanguageCodeStateNotifier>((ref) {
  return LanguageCodeStateNotifier();
});

final languageProvider = FutureProvider<Language>((ref) async {
  var langCode = ref.watch(languageCodeProvider.state);

  // initial check when first time app run after installing.
  if (langCode == null) {
    final prefs = await SharedPreferences.getInstance();
    langCode = prefs.getString('Language Code') ?? 'eng';

    ref.read(languageCodeProvider).changeLanguageCode(langCode);
  }

  final json =
      jsonDecode(await rootBundle.loadString('assets/jsons/$langCode.json'));

  return Language.fromJson(json, langCode);
});

class LanguageCodeStateNotifier extends StateNotifier {
  LanguageCodeStateNotifier() : super(null);

  Future<void> changeLanguageCode(String languageCode) async {
    state = languageCode;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('Language Code', languageCode);
  }
}
