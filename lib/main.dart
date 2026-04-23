import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/model/note_model.dart';
import 'package:notepad/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());

  await Hive.openBox<Note>('notes');

  runApp(MyApp());
}
