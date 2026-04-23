import 'package:flutter/material.dart';
import 'package:notepad/utils/constants/colors.dart';

void showAppSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(text), duration: Duration(seconds: 2)));
}

Future<dynamic> appShowDialog(
  BuildContext context,
  String titleText,
  String contentText, {
  String? buttonText,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(titleText),
      content: Text(contentText),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      titlePadding: EdgeInsets.only(left: 18, top: 10),
      contentPadding: EdgeInsets.only(left: 18, top: 8),
      actionsPadding: EdgeInsets.only(bottom: 3),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(buttonText ?? 'OK'),
        ),
      ],
    ),
  );
}

              ),
          );
        },
      );
    },
  );
}
