import 'package:flutter/material.dart';

class Note {
  final String title;
  final String content;
  final DateTime? dateCreated;
  final Color color;

  Note({
    required this.title,
    required this.content,
    required this.dateCreated,
    this.color = Colors.white,
  });
}
