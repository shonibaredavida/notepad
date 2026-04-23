import 'package:flutter/material.dart';
import 'package:notepad/model/note_model.dart';
import 'package:notepad/screens/create_note_screen.dart';
import 'package:notepad/utils/constants/colors.dart';
import 'package:notepad/utils/constants/images.dart';
import 'package:notepad/services/note_services.dart';
import 'package:notepad/widgets/note_empty_state_widget.dart';
import 'package:notepad/widgets/note_list_view_item_widget.dart';

class Homescreen extends StatelessWidget {
  final NoteService service;
  const Homescreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarbackground,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset(AppImages.noteLogo, height: 32),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToCreateNewNote(context, service),
        child: Icon(Icons.add),
      ),
      body: AnimatedBuilder(
        animation: service,
        builder: (context, _) {
          final notes = service.getNotes();

          return notes.isEmpty
              ? NoteEmptyStateWidget()
              : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final currentNote = notes[index];
                    return NoteListViewItemWidget(
                      note: currentNote,
                      index: index,
                      service: service,
                    );
                  },
                );
        },
      ),
    );
  }
}

void _goToCreateNewNote(BuildContext context, NoteService service) {
  Navigator.push<Note>(
    context,
    MaterialPageRoute(
      builder: (context) =>
          CreateNoteScreen(isNewNote: true, controller: service),
    ),
  );
}
