import 'package:flutter/material.dart';

class NoteCharacterCountFab extends StatelessWidget {
  const NoteCharacterCountFab({
    super.key,
    required this.noteContent,
    required this.countColor,
  });
  final ValueNotifier<Color> countColor;
  final ValueNotifier<String> noteContent;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: countColor.value.withValues(alpha: 0.9),
      elevation: 0,
      onPressed: null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
        side: BorderSide(width: 0.2, color: Colors.black45),
      ),
      child: ValueListenableBuilder<String>(
        valueListenable: noteContent,
        builder: (context, thisValue, _) {
          return Text(
            'Count\n ${thisValue.length}',
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
