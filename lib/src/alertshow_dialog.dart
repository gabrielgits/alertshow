import 'package:flutter/material.dart';

Future<bool> alertshowDialog({
  required BuildContext context,
  String? title,
  required Widget content,
  String yesButton = 'Yes',
  bool barrierDismissible = false,
  String? noButton = 'No',
}) async {
  bool confirmation = false;
  await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => AlertDialog(
      title: title == null ? null : Text(title),
      content: content,
      actions: <Widget>[
        noButton == null
            ? SizedBox()
            : TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.deepOrange),
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  confirmation = false;
                  Navigator.of(context).pop();
                },
                label: Text(noButton),
              ),
        const SizedBox(width: 20),
        TextButton.icon(
          style: TextButton.styleFrom(foregroundColor: Colors.green),
          icon: const Icon(Icons.done),
          onPressed: () {
            confirmation = true;
            Navigator.of(context).pop();
          },
          label: Text(yesButton),
        ),
      ],
    ),
  );

  return confirmation;
}
