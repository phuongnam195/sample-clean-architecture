import 'package:flutter/material.dart';

class MessagePopup extends StatelessWidget {
  const MessagePopup({
    required this.message,
    this.label,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String message;
  final String? label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  color: Colors.orange[600],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(message),
                ),
              ],
            ),
            if (label != null) const SizedBox(height: 12),
            if (label != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                onPressed: onPressed,
                child: Text(label!),
              )
          ],
        ),
      ),
    );
  }
}
