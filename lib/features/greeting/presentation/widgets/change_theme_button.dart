import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:sample_clean_arch/core/utils/extensions/string_ext.dart';
import 'package:flutter/material.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> themes = [
      'light'.translate,
      'dark'.translate,
      'system'.translate,
    ];

    return PopupMenuButton<int>(
      icon: const Icon(Icons.dark_mode_outlined),
      offset: const Offset(0, 50),
      onSelected: (index) {
        switch (index) {
          case 0:
            AdaptiveTheme.of(context).setLight();
            break;
          case 1:
            AdaptiveTheme.of(context).setDark();
            break;
          case 2:
            AdaptiveTheme.of(context).setSystem();
            break;
        }
      },
      itemBuilder: (_) => [
        for (int i = 0; i < themes.length; i++)
          PopupMenuItem(
            value: i,
            child: Text(themes[i]),
          ),
      ],
    );
  }
}
