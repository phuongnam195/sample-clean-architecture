import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String formatDate() => DateFormat('dd-MM-yyyy').format(this);
}
