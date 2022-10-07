import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = StreamProvider.autoDispose<int>(
  (ref) async* {
    int i = 0;
    while (true) {
      yield i++;
      await Future.delayed(const Duration(seconds: 1));
    }
  },
);
