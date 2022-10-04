import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_clean_arch/core/constants/assets.dart';
import 'package:sample_clean_arch/core/network/language/language.dart';
import 'package:sample_clean_arch/core/resource/app_theme_data.dart';
import 'package:sample_clean_arch/core/utils/navigation/routes.dart';
import 'package:sample_clean_arch/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupLocator();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [
      Language.vi.locale,
      Language.en.locale,
    ],
    path: Assets.langPath,
    fallbackLocale: Language.vi.locale,
    useOnlyLangCode: true,
    saveLocale: true,
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppThemeData.light(),
      dark: AppThemeData.dark(),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Sample Clean Architecture',
        theme: theme,
        darkTheme: darkTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routes: Routes.routes,
        initialRoute: Routes.greeting,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
