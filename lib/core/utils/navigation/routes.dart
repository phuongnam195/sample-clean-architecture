import 'package:flutter/material.dart';
import 'package:sample_clean_arch/features/greeting/presentation/pages/second_page.dart';
import 'package:sample_clean_arch/features/greeting/presentation/pages/first_page.dart';

class Routes {
  Routes._();

  static const String greeting = '/greeting';
  static const String goodbye = '/goodbye';

  static final routes = <String, WidgetBuilder>{
    greeting: (_) => FirstPage(arguments: FirstArguments(text: 'ABC')),
    goodbye: (_) => const SecondPage(),
  };
}
