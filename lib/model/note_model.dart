// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  int colorValue;

  @HiveField(3)
  DateTime dateCreated;

  Note({
    required this.title,
    required this.content,
    required Color color,
    required this.dateCreated,
  }) : colorValue = color.value;

  Color get color => Color(colorValue);
  set color(Color c) => colorValue = c.value;
}
