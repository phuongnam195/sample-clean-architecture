import 'package:easy_localization/easy_localization.dart';

extension StringExt on String? {
  String get translate => this == null ? '' : this!.tr();

  bool get isNullOrEmpty => this == null || this?.trim().isEmpty == true;
}
