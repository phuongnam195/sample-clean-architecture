import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  static AppColors? of(BuildContext context) => AdaptiveTheme.of(context).theme.extensions[0] as AppColors?;

  AppColors._({
    this.chartColor,
    this.textBorderColor,
  });

  final Color? chartColor;
  final Color? textBorderColor;

  factory AppColors.light() => AppColors._(
        chartColor: Colors.red,
        textBorderColor: const Color(0xFF4A4C41),
      );

  factory AppColors.dark() => AppColors._(
        chartColor: Colors.indigo,
        textBorderColor: Colors.yellow,
      );

  @override
  AppColors copyWith({
    Color? chartColor,
    Color? textBorderColor,
  }) {
    return AppColors._(
      chartColor: chartColor ?? this.textBorderColor,
      textBorderColor: textBorderColor ?? this.textBorderColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors._(
      chartColor: Color.lerp(chartColor, other.chartColor, t),
      textBorderColor: Color.lerp(textBorderColor, other.textBorderColor, t),
    );
  }
}
