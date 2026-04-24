import 'package:flutter/material.dart';
import 'package:notepad/model/note_model.dart';
import 'package:notepad/screens/create_note_screen.dart';
import 'package:notepad/services/note_services.dart';
import 'package:notepad/utils/constants/textstyles.dart';
import 'package:notepad/utils/helper_functions.dart';
import 'package:notepad/widgets/delete_note_dialog_widget.dart';

class NoteListViewItemWidget extends StatelessWidget {
  const NoteListViewItemWidget({
    super.key,
    required this.note,
    required this.index,
    required this.service,
  });

  final Note note;
  final int index;
  final NoteService service;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(width: 0.1),
        color: note.color,
        borderRadius: BorderRadius.circular(0),
      ),
      child: ListTile(
        isThreeLine: true,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  CreateNoteScreen(noteIndex: index, controller: service),
            ),
          );
        },
        onLongPress: () {
          showDialog(
            context: context,
            builder: (_) =>
                DeleteNoteDialogWidget(note: note, service: service),
          );
        },
        title: Text(
          toSentenceCase(note.title),
          style: AppTextStyles.header.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: SizedBox(
          height: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                toSentenceCase(note.content),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyRg.copyWith(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                note.dateCreated.toLocal().toString().split('.')[0],
                style: AppTextStyles.bodyRg.copyWith(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
