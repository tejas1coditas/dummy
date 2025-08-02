import 'package:assignment_4/models/notes_model.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  List<NotesModel> notes = [];




  List<NotesModel> getNotes() {

  

     return notes;
  }

  void addNotes(NotesModel note) {
    notes.add(note);
    notifyListeners();
  }

  int getLength() {
    return notes.length;
  }

  void updateTask(NotesModel oldNotes, NotesModel newNotes) {
    final index = notes.indexOf(oldNotes);
    notes[index] = newNotes;
    notifyListeners();
  }

 


}
