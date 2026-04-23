import 'package:flutter/material.dart';

class NoteEmptyStateWidget extends StatelessWidget {
  const NoteEmptyStateWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No Note Available', style: TextStyle(fontSize: 20)),
    );
  }
}
