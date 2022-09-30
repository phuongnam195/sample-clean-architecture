import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/change_language_button.dart';

class GoodbyeArguments {
  GoodbyeArguments();
}

class GoodbyePage extends StatelessWidget {
  final GoodbyeArguments? arguments;

  const GoodbyePage({this.arguments, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('goodbye'.tr()),
        actions: [
          ChangeLanguageButton(context),
        ],
      ),
      body: Center(
        child: Text('goodbye'.tr()),
      ),
    );
  }
}
