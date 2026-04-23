import 'package:flutter/material.dart';

class NoteCharacterCountFab extends StatelessWidget {
  const NoteCharacterCountFab({super.key, required this.noteContent});

  final ValueNotifier<String> noteContent;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: null,
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
