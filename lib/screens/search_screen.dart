import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/models/notes_model.dart';
import 'package:assignment_4/notes_provider/notes_provider.dart';
import 'package:assignment_4/screens/edit_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<NotesModel> _filteredNotes = [];
  late List<NotesModel> _allNotes;

  @override
  void initState() {
    super.initState();
    // Immediately get all notes from the provider
    _allNotes = Provider.of<NotesProvider>(context, listen: false).getNotes();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      // If search bar is empty, show no results
      setState(() {
        _filteredNotes = [];
      });
      return;
    }
    // Filter notes based on title
    setState(() {
      _filteredNotes = _allNotes
          .where((note) => note.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          decoration: InputDecoration(
            hintText: 'Search by the keyword...',
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white),
                    onPressed: () {
                      _searchController.clear();
                    },
                  )
                : null,
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (_searchController.text.isEmpty) {
            return const Center(
              child: Text(
                'Search for notes by title.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          if (_filteredNotes.isEmpty) {
            return Column(
              children: [
                Image.asset(searchScreenImage),
                Text(
                  'File not found. Try searching again.',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                final note = _filteredNotes[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNoteScreen(notes: note),
                      ),
                    ).then((_) {
                      // When returning from edit, refresh the notes list and re-apply the filter
                      setState(() {
                        _allNotes = Provider.of<NotesProvider>(
                          context,
                          listen: false,
                        ).getNotes();
                        _onSearchChanged();
                      });
                    });
                  },
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Text(
                      note.title,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  tileColor: Colors.blue.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              },
              separatorBuilder: (context, child) => const SizedBox(height: 20),
              itemCount: _filteredNotes.length,
            ),
          );
        },
      ),
    );
  }
}
