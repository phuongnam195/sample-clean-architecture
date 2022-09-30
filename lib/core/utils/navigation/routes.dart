import 'package:flutter/material.dart';
import 'package:sample_clean_arch/features/greeting/presentation/pages/goodbye_page.dart';
import 'package:sample_clean_arch/features/greeting/presentation/pages/greeting_page.dart';

class Routes {
  Routes._();

  static const String greeting = '/greeting';
  static const String goodbye = '/goodbye';

  static final routes = <String, WidgetBuilder>{
    greeting: (_) => GreetingPage(arguments: GreetingArguments(text: 'ABC')),
    goodbye: (_) => const GoodbyePage(),
  };
}
