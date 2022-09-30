// Cải tiến: log ngay khi khởi tạo Failure

import 'package:sample_clean_arch/core/utils/log/log.dart';

class Failure {
  final String? message;
  Failure._(this.message);

  factory Failure(String message) {
    Log.e('Failure', message);
    return Failure._(message);
  }
}

class ServerFailure extends Failure {
  ServerFailure([String? message]) : super._(message);

  factory ServerFailure.nullData() => ServerFailure('Data response is null');
}
