import 'package:flutter/material.dart';
import 'package:sample_clean_arch/features/greeting/presentation/pages/greeting_page.dart';
import 'package:sample_clean_arch/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Clean Architecture',
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),
      home: const GreetingPage(),
    );
  }
}
