import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notepad/model/note_model.dart';

class NoteService extends ChangeNotifier {
  final Box<Note> box = Hive.box<Note>('notes');

  List<Note> getNotes() {
    return box.values.toList();
  }

  void addNote(Note note) {
    box.add(note);
    notifyListeners();
  }

  void deleteNote(Note note) {
    note.delete();
    notifyListeners();
  }

  void updateNote(Note note, String title, String content, Color color) {
    note.title = title;
    note.content = content;
    note.color = color;
    note.dateCreated = DateTime.now();
    note.save();
    notifyListeners();
  }
}
