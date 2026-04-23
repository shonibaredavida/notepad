import 'package:flutter/material.dart';
import 'package:notepad/model/note_model.dart';
import 'package:notepad/screens/create_note_screen.dart';
import 'package:notepad/utils/constants/colors.dart';
import 'package:notepad/utils/helper_functions.dart';

class CurrentActivityTextUpdateWidget extends StatelessWidget {
  const CurrentActivityTextUpdateWidget({
    super.key,
    required this.widget,
    required this.editMode,
    required this.currentNote,
  });

  final CreateNoteScreen widget;
  final ValueNotifier<bool> editMode;
  final Note currentNote;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.isNewNote)
          Text(
            'Creating New Note',
            style: TextStyle(color: AppColors.appGrey, fontSize: 12),
          ),
        if (widget.noteIndex != null && !editMode.value)
          Text(
            'Viewing Note',
            style: TextStyle(color: AppColors.appGrey, fontSize: 12),
          ),
        if (widget.noteIndex != null && editMode.value)
          Text(
            'Editing Note',
            style: TextStyle(color: AppColors.appGrey, fontSize: 12),
          ),

        Text(
          formatDate(
            widget.isNewNote ? DateTime.now() : currentNote.dateCreated,
          ),
          style: TextStyle(color: AppColors.appGrey, fontSize: 12),
        ),
      ],
    );
  }
}
