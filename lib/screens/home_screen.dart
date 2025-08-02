// import 'package:assignment_4/notes_provider/notes_provider.dart';
// import 'package:assignment_4/screens/add_note_screen.dart';
// import 'package:assignment_4/screens/edit_note_screen.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Notes',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//             fontSize: 43,
//           ),
//         ),
//         actions: [
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 78, 78, 78),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: IconButton(
//               onPressed: () {

//               },
//               icon: Icon(Icons.search),
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(width: 10),
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 78, 78, 78),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Icon(Icons.info, color: Colors.white),
//           ),
//           SizedBox(width: 10),
//         ],
//         centerTitle: false,
//         backgroundColor: Colors.transparent,
//       ),

//       body: Consumer<NotesProvider>(
//         builder: (context, noteprovider, child) => noteprovider.notes.isEmpty
//             ? Column(
//                 children: [
//                   Image.asset('assets/home_screen.png'),
//                   Text(
//                     'Create your first note!!',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               )
//             : Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: ListView.separated(
//                   itemBuilder: (context, index) {
//                     final note = noteprovider.getNotes()[index];
//                     return ListTile(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditNoteScreen(notes: note),
//                           ),
//                         );
//                       },

//                       onLongPress: () {},
//                       title: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 17),
//                         child: Text(
//                           note.title,
//                           style: TextStyle(color: Colors.white, fontSize: 25),
//                         ),
//                       ),
//                       tileColor: Colors.blue.shade400,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, child) => SizedBox(height: 20),
//                   itemCount: noteprovider.getLength(),
//                 ),
//               ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddNoteScreen()),
//           );
//         },
//         backgroundColor: Color.fromARGB(255, 78, 78, 78),
//         elevation: 50,

//         shape: CircleBorder(),
//         child: Icon(Icons.add_outlined, color: Colors.white, size: 48),
//       ),
//     );
//   }
// }

import 'package:assignment_4/constants/constants.dart';
import 'package:assignment_4/notes_provider/notes_provider.dart';
import 'package:assignment_4/screens/add_note_screen.dart';
import 'package:assignment_4/screens/edit_note_screen.dart';
import 'package:assignment_4/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 43,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 78, 78, 78),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 78, 78, 78),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.info, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),

      body: Consumer<NotesProvider>(
        builder: (context, noteprovider, child) => noteprovider.notes.isEmpty
            ? Column(
                children: [
                  Image.asset(homeScreenImage),
                  Text(
                    'Create your first note!!',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final note = noteprovider.getNotes()[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditNoteScreen(notes: note),
                          ),
                        );
                      },

                      onLongPress: () {},
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Text(
                          note.title,
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                      tileColor: noteprovider.getColor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  },
                  separatorBuilder: (context, child) => SizedBox(height: 20),
                  itemCount: noteprovider.getLength(),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        backgroundColor: Color.fromARGB(255, 78, 78, 78),
        elevation: 50,

        shape: CircleBorder(),
        child: Icon(Icons.add_outlined, color: Colors.white, size: 48),
      ),
    );
  }
}
