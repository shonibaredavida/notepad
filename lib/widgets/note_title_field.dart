import 'package:flutter/material.dart';
import 'package:notepad/utils/constants/colors.dart';
import 'package:notepad/utils/constants/textstyles.dart';

class NoteTitleField extends StatelessWidget {
  const NoteTitleField({
    super.key,
    required this.editMode,
    required this.isNewNote,
    required this.noteIndex,
    required this.titleController,
    required this.staticTitle,
  });

  final ValueNotifier<bool> editMode;
  final bool isNewNote;
  final int? noteIndex;
  final TextEditingController titleController;
  final String staticTitle;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: editMode,
      builder: (context, inEditMode, _) {
        final isViewMode = !inEditMode && noteIndex != null && !isNewNote;

        return isViewMode
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  staticTitle,
                  style: AppTextStyles.header.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.3,
                  ),
                  maxLines: 1,
                ),
              )
            : SizedBox(
                height: 35,
                child: TextField(
                  style: AppTextStyles.bodyRg.copyWith(
                    fontSize: 20,
                    height: 1.3,
                  ),
                  controller: titleController,
                  decoration: InputDecoration(
                    fillColor: AppColors.whiteColor,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(4, 2, 5, 2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter a title',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: AppColors.hintColor,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
