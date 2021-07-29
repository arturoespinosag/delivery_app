import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static Future<void> alert(
    BuildContext context, {
    String title,
    String description,
    String action = 'OK',
    bool dismissible = true,
  }) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => WillPopScope(
        onWillPop: () async => dismissible,
        child: CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: description != null ? Text(description) : null,
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: Text(action),
            ),
          ],
        ),
      ),
    );
  }
}
