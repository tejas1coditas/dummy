import 'package:assignment_4/models/notes_model.dart';
import 'package:assignment_4/notes_provider/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.notes});
  final NotesModel notes;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.notes.title);
    descriptionController = TextEditingController(
      text: widget.notes.description,
    );
  }

  void _showSaveConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: const Text('Save Changes?'),

          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Discard'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Save'),
              onPressed: () {
                _saveNote();
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _saveNote() {
    final title = titleController.text;
    final description = descriptionController.text;
    if (title.isNotEmpty) {
      final updatedNote = NotesModel(title: title, description: description);

      Provider.of<NotesProvider>(
        context,
        listen: false,
      ).updateTask(widget.notes, updatedNote);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 78, 78, 78),
              borderRadius: BorderRadius.circular(15),
            ),
            child: GestureDetector(
              onTap: () {
                _showSaveConfirmationDialog();
              },
              child: const Icon(Icons.save, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(color: Colors.white, fontSize: 46),
                    controller: titleController,
                    cursorHeight: 38,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    controller: descriptionController,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(border: InputBorder.none),
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
