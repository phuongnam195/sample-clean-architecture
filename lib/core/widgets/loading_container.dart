import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final bool isLoading;
  final Widget? child;

  const LoadingContainer({required this.isLoading, required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        child ?? const SizedBox.shrink(),
        if (isLoading)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black26,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
                Text(
                  'hello'.tr().toUpperCase(),
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        else
          const SizedBox.shrink()
      ],
    ));
  }
}
