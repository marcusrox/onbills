
import 'package:flutter/material.dart';

// Para criar outros tipso de diálogos: https://www.javatpoint.com/flutter-alert-dialogs

enum ConfirmAction { Yes, No }

Future<ConfirmAction> asyncConfirmDialog(BuildContext context, String message) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmação'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Yes);
            },
          ),
          FlatButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.No);
            },
          )
        ],
      );
    },
  );
}
