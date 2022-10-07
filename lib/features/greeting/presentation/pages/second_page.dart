import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_clean_arch/features/greeting/presentation/provider/second_provider.dart';

import '../widgets/change_language_button.dart';
import '../widgets/change_theme_button.dart';

class SecondArguments {
  SecondArguments();
}

class SecondPage extends StatelessWidget {
  final SecondArguments? arguments;

  const SecondPage({this.arguments, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('goodbye'.tr()),
        actions: [
          const ChangeThemeButton(),
          ChangeLanguageButton(context),
        ],
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final timerAsyncValue = ref.watch(timerProvider);

          return timerAsyncValue.when(
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => Text('Error: $err'),
            data: (i) {
              return Text(
                '$i',
                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
              );
            },
          );
        }),
      ),
    );
  }
}
