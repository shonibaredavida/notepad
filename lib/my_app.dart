import 'package:flutter/material.dart';
import 'package:notepad/services/note_services.dart';
import 'package:notepad/screens/homescreen.dart';
import 'package:notepad/utils/theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final NoteService controller = NoteService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      title: 'Kodecamp Notepad',

      debugShowCheckedModeBanner: false,
      home: Homescreen(service: controller),
    );
  }
}
