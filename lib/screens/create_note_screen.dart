import 'package:flutter/material.dart';
import 'package:notepad/utils/constants/colors.dart';
import 'package:notepad/utils/constants/textstyles.dart';
import 'package:notepad/widgets/ui_helpers.dart';
import 'package:notepad/services/note_services.dart';
import 'package:notepad/model/note_model.dart';
import 'package:notepad/widgets/current_activity_text_update_widget.dart';
import 'package:notepad/widgets/note_character_count_fab.dart';
import 'package:notepad/widgets/note_color_picker_button.dart';
import 'package:notepad/widgets/note_title_field.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({
    super.key,
    this.noteIndex,
    this.isNewNote = false,
    required this.controller,
  });
  final int? noteIndex;
  final bool isNewNote;
  final NoteService controller;
  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final ValueNotifier<String> noteTitle = ValueNotifier("");
  final ValueNotifier<String> noteContent = ValueNotifier("");
  final ValueNotifier<bool> editMode = ValueNotifier(false);
  final ValueNotifier<Color> selectedColor = ValueNotifier(
    AppColors.defaultColor,
  );
  Note currentNote = Note(
    title: '',
    content: '',
    dateCreated: DateTime.now(),
    color: AppColors.defaultColor,
  );
  Note newNote = Note(
    title: '',
    content: '',
    dateCreated: DateTime.now(),
    color: AppColors.defaultColor,
  );
  @override
  void initState() {
    if (widget.noteIndex != null && !widget.isNewNote) {
      currentNote = widget.controller.getNotes()[widget.noteIndex!];
      _titleController.text = currentNote.title;
      noteTitle.value = currentNote.title;
      noteContent.value = currentNote.content;
      _contentController.text = currentNote.content;
      selectedColor.value = currentNote.color;
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    editMode.value = false;
    super.dispose();
  }

  void popOut() {
    _titleController.clear();
    _contentController.clear();
    selectedColor.value = AppColors.defaultColor;
    Navigator.of(context).pop(newNote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: NoteCharacterCountFab(
        noteContent: noteContent,
        countColor: selectedColor,
      ),
      appBar: AppBar(
        backgroundColor: widget.noteIndex != null
            ? currentNote.color.withValues(alpha: 0.8)
            : AppColors.defaultColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: GestureDetector(
            onTap: () {
              popOut();
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        leadingWidth: 25,
        title: NoteTitleField(
          editMode: editMode,
          isNewNote: widget.isNewNote,
          noteIndex: widget.noteIndex,
          titleController: _titleController,
          staticTitle: currentNote.title,
        ),
        actions: [
          if (editMode.value || widget.noteIndex == null)
            NoteColorPickerButton(
              currentNote: currentNote,
              selectedColor: selectedColor,
              isNewNote: widget.isNewNote,
            ),

          IconButton(
            onPressed: () {
              if (editMode.value || widget.isNewNote) {
                noteTitle.value = _titleController.text.trim();
                noteContent.value = _contentController.text.trim();
                if (noteTitle.value.isEmpty || noteContent.value.isEmpty) {
                  appShowDialog(
                    context,
                    'Error',
                    'Title and content cannot be empty',
                  );
                  return;
                }
                newNote = Note(
                  title: noteTitle.value,
                  content: noteContent.value,
                  dateCreated: DateTime.now(),
                  color: selectedColor.value,
                );
                if (widget.noteIndex != null) {
                  widget.controller.updateNote(
                    currentNote,
                    newNote.title,
                    newNote.content,
                    newNote.color,
                  );

                  showAppSnackBar(context, 'Note updated successfully');
                } else {
                  widget.controller.addNote(newNote);

                  showAppSnackBar(context, 'Note created successfully');
                  popOut();
                }
              }

              setState(() {
                editMode.value = !editMode.value;
              });
            },
            icon: Icon(
              editMode.value || widget.noteIndex == null
                  ? Icons.done
                  : Icons.edit,
              size: 35,
            ),
          ),
        ],
      ),

      body: Container(
        color: currentNote.color.withValues(alpha: 0.2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8,
                ),
                child: CurrentActivityTextUpdateWidget(
                  widget: widget,
                  editMode: editMode,
                  currentNote: currentNote,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 2,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        !editMode.value && widget.noteIndex != null
                            ? Text(
                                currentNote.content,
                                style: AppTextStyles.bodyRg.copyWith(
                                  fontSize: 16,
                                ),
                              )
                            : SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.78,
                                child: TextField(
                                  style: AppTextStyles.bodyRg.copyWith(
                                    fontSize: 16,
                                  ),
                                  maxLines: null,
                                  minLines: null,
                                  controller: _contentController,
                                  onChanged: (val) {
                                    noteContent.value = val;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(4),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: BorderSide.none,
                                    ),
                                    hint: Text(
                                      'Enter your content here',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.hintColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
