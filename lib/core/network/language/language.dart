import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Language {
  final Locale locale;

  Language._(this.locale);

  static Language get vi => Language._(const Locale('vi', 'VN'));
  static Language get en => Language._(const Locale('en', 'ES'));

  @override
  String toString() => locale.languageCode.tr();
}
