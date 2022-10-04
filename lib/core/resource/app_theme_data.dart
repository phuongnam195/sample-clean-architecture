import 'package:flutter/material.dart';
import 'package:sample_clean_arch/core/resource/app_colors.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData light() => ThemeData.light().copyWith(
        primaryColor: Colors.orange,
        backgroundColor: Colors.grey[100],
        extensions: [AppColors.light()],
      );

  static ThemeData dark() => ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        backgroundColor: Colors.red,
        extensions: [AppColors.dark()],
      );
}
