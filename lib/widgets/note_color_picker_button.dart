import 'package:flutter/material.dart';
import 'package:notepad/model/note_model.dart';
import 'package:notepad/utils/constants/colors.dart';
import 'package:notepad/widgets/ui_helpers.dart';

class NoteColorPickerButton extends StatelessWidget {
  const NoteColorPickerButton({
    super.key,
    required this.selectedColor,
    required this.currentNote,
    required this.isNewNote,
  });

  final ValueNotifier<Color> selectedColor;
  final Note currentNote;
  final bool isNewNote;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final updatedColor = await colorSelector(context, selectedColor);

        if (updatedColor != null && updatedColor != currentNote.color) {
          selectedColor.value = updatedColor;
        }
      },
      icon: ValueListenableBuilder(
        valueListenable: selectedColor,
        builder: (context, value, child) {
          return Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.appGrey, width: 0.5),
              color: !isNewNote
                  ? Color.lerp(
                      selectedColor.value,
                      const Color.fromARGB(60, 0, 0, 0),
                      .1,
                    )
                  : selectedColor.value,
            ),
          );
        },
      ),
    );
  }
}
