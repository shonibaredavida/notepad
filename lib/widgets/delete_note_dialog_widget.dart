import 'package:flutter/material.dart';
import 'package:notepad/model/note_model.dart';
import 'package:notepad/services/note_services.dart';
import 'package:notepad/widgets/ui_helpers.dart';

class DeleteNoteDialogWidget extends StatelessWidget {
  const DeleteNoteDialogWidget({
    super.key,
    required this.note,
    required this.service,
  });

  final Note note;
  final NoteService service;

  void _deleteNote(BuildContext context) {
    service.deleteNote(note);
    Navigator.of(context).pop(true);
    showAppSnackBar(context, 'Note deleted successfully');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      titlePadding: EdgeInsets.only(left: 18, top: 10),
      contentPadding: EdgeInsets.only(left: 18, top: 8),
      actionsPadding: EdgeInsets.only(bottom: 3, right: 8),

      title: const Text('Delete Note'),
      content: const Text('Are you sure you want to delete this note?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => _deleteNote(context),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
