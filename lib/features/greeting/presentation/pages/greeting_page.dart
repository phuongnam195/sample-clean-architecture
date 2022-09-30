import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sample_clean_arch/core/constants/enums.dart';
import 'package:sample_clean_arch/core/widgets/loading_overlay.dart';
import 'package:sample_clean_arch/core/utils/extensions/date_time_ext.dart';

import '../stores/greeting_store.dart';

class GreetingArguments {
  final String? text;

  GreetingArguments({this.text});
}

class GreetingPage extends StatefulWidget {
  const GreetingPage({Key? key}) : super(key: key);

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
              body: entity == null
                  ? Container()
                  : SingleChildScrollView(
                      child: Column(
                      children: [
                        const SizedBox(height: 80),
                        ListTile(
                          title: Text(entity.contractInfo?.contractName ?? ''),
                          subtitle: Text(entity.contractInfo?.expiredDate?.formatDate() ?? ''),
                          tileColor: Colors.amber,
                        ),
                        const SizedBox(height: 25),
                        for (var page in entity.pdfPages)
                          SizedBox(
                            width: page.orientation == PdfPageOrientation.portrait ? 150 : 200,
                            height: page.orientation == PdfPageOrientation.portrait ? 200 : 150,
                            child: Text(page.content ?? ''),
                          )
                      ],
                    )),
            ));
      },
    );
  }
}
