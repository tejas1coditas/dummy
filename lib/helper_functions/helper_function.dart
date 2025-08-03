import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/models/notes_model.dart';
import 'package:assignment_4/notes_provider/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void saveNote({
  required BuildContext context,
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required NotesModel originalNote,
}) {
  final title = titleController.text;
  final description = descriptionController.text;

  if (title.isNotEmpty) {
    final updatedNote = NotesModel(title: title, description: description);

    Provider.of<NotesProvider>(
      context,
      listen: false,
    ).updateTask(originalNote, updatedNote);

    Navigator.pop(context);
  }
}

void showSaveConfirmationDialog({
  required BuildContext context,
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required NotesModel originalNote,
}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        backgroundColor: backgroundColor,
        title: const Icon(Icons.info, color: Color(0XFF606060)),
        content: Padding(
          padding: const EdgeInsets.fromLTRB(38,0,0,0),
          child: const Text(
            'Save changes ?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(38, 0, 0, 38),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Discard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                ),
              ),
              const SizedBox(width: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 33, 38),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();

                    saveNote(
                      context: context,
                      titleController: titleController,
                      descriptionController: descriptionController,
                      originalNote: originalNote,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
