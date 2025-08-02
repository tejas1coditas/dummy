import 'package:assignment_4/models/notes_model.dart';
import 'package:assignment_4/notes_provider/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 78, 78, 78),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.visibility, color: Colors.white),
          ),
          SizedBox(width: 10),
          Consumer<NotesProvider>(
            builder: (context, noteprovider, child) => GestureDetector(
              onTap: () {
                final title = titleController.text;
                final description = descriptionController.text;
                if (title.isNotEmpty) {
                  final updatedNote = NotesModel(
                    title: title,
                    description: description,
                  );
                  noteprovider.addNotes(updatedNote);
                  Navigator.pop(context);
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 78, 78, 78),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(Icons.save, color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: Colors.white, fontSize: 46),
                    controller: titleController,
                    cursorHeight: 38,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 46),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    controller: descriptionController,
                    cursorColor: Colors.white,
                    //cursorHeight: 38,
                    decoration: InputDecoration(
                      hintText: 'Type Something ......',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      border: InputBorder.none,
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
