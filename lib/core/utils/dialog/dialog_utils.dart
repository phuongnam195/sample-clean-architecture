import 'package:flutter/material.dart';
import 'package:sample_clean_arch/core/widgets/message_popup.dart';

class DialogUtils {
  static showErrorDialog(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      builder: (_) => MessagePopup(message: message ?? 'Lỗi không xác định'),
    );
  }
}
