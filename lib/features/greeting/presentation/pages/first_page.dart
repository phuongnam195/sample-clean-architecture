import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:sample_clean_arch/core/utils/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_clean_arch/core/constants/enums.dart';
import 'package:sample_clean_arch/core/resource/app_colors.dart';
import 'package:sample_clean_arch/core/utils/dialog/dialog_utils.dart';
import 'package:sample_clean_arch/core/utils/navigation/routes.dart';
import 'package:sample_clean_arch/core/widgets/loading_container.dart';
import 'package:sample_clean_arch/core/utils/extensions/date_time_ext.dart';
import 'package:sample_clean_arch/features/greeting/domain/entities/e_contract_entity.dart';

import '../provider/first_provider.dart';
import '../widgets/change_theme_button.dart';
import '../widgets/change_language_button.dart';

class FirstArguments {
  final String? text;

  FirstArguments({this.text});
}

class FirstPage extends ConsumerWidget {
  final FirstArguments? arguments;

  const FirstPage({this.arguments, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen error
    ref.listen<AsyncValue<EContractEntity?>>(getEContractProvider, (previous, next) {
      if (next.hasError) {
        DialogUtils.showErrorDialog(
          context,
          message: next.error.toString(),
        );
      }
    });

    final eContractAsyncValue = ref.watch(getEContractProvider);
    EContractEntity? entity;
    if (eContractAsyncValue.hasValue) {
      entity = eContractAsyncValue.value;
    }

    return LoadingContainer(
      isLoading: eContractAsyncValue.isLoading,
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
                      'contract_info'.translate,
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    ListTile(
                      title: Text(entity.contractInfo?.contractName ?? ''),
                      subtitle: Text(entity.contractInfo?.expiredDate?.formatDate() ?? ''),
                      tileColor: AdaptiveTheme.of(context).theme.primaryColor,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'contract'.translate,
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
                      child: Text('goodbye'.translate),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.goodbye);
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
