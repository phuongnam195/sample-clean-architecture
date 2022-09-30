import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_clean_arch/core/network/language/language.dart';

class ChangeLanguageButton extends StatelessWidget {
  final BuildContext parentContext;

  const ChangeLanguageButton(this.parentContext, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Language>(
      icon: const Icon(Icons.language),
      offset: const Offset(0, 50),
      onSelected: (Language item) {
        parentContext.setLocale(item.locale);
      },
      itemBuilder: (_) => [
        PopupMenuItem(
          value: Language.vi,
          child: Text(Language.vi.toString()),
        ),
        PopupMenuItem(
          value: Language.en,
          child: Text(Language.en.toString()),
        ),
      ],
    );
  }
}
