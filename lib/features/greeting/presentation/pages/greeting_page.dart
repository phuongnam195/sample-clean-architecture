import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sample_clean_arch/core/constants/enums.dart';
import 'package:sample_clean_arch/core/resource/app_colors.dart';
import 'package:sample_clean_arch/core/utils/navigation/routes.dart';
import 'package:sample_clean_arch/core/widgets/loading_overlay.dart';
import 'package:sample_clean_arch/core/utils/extensions/date_time_ext.dart';

import '../widgets/change_theme_button.dart';
import '../widgets/change_language_button.dart';
import '../stores/greeting_store.dart';

class GreetingArguments {
  final String? text;

  GreetingArguments({this.text});
}

class GreetingPage extends StatefulWidget {
  const GreetingPage({this.arguments, Key? key}) : super(key: key);

  final GreetingArguments? arguments;

  @override
  State<GreetingPage> createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {
  final _store = GreetingStore();

  @override
  void initState() {
    _store.getEContract();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final entity = _store.eContractEntity;
        return LoadingOverlay(
            isLoading: _store.isLoading,
            child: Scaffold(
              appBar: AppBar(actions: [
                const ChangeThemeButton(),
                ChangeLanguageButton(context),
              ]),
              body: entity == null
                  ? Container()
                  : SingleChildScrollView(
                      child: Column(
                      children: [
                        Text(
                          'contract_info'.tr(),
                          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        ListTile(
                          title: Text(entity.contractInfo?.contractName ?? ''),
                          subtitle: Text(entity.contractInfo?.expiredDate?.formatDate() ?? ''),
                          tileColor: AdaptiveTheme.of(context).theme.primaryColor,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'contract'.tr(),
                          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        for (var page in entity.pdfPages)
                          SizedBox(
                            width: page.orientation == PdfPageOrientation.portrait ? 150 : 200,
                            height: page.orientation == PdfPageOrientation.portrait ? 200 : 150,
                            child: Text(page.content ?? ''),
                          ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.of(context)?.chartColor),
                          child: Text('goodbye'.tr()),
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.goodbye);
                          },
                        )
                      ],
                    )),
            ));
      },
    );
  }
}
