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

Future<Color?> colorSelector(
  BuildContext context,
  ValueNotifier<Color> selectedColor,
) {
  return showDialog<Color>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 18.0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: appNoteColors.map((color) {
                  final isSelected = selectedColor.value == color;
                  return GestureDetector(
                    onTap: () => setDialogState(() {
                      selectedColor.value = color;
                      Navigator.pop(context, selectedColor.value);
                    }),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: color,
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: isSelected ? Icon(Icons.check, size: 18) : null,
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      );
    },
  );
}
