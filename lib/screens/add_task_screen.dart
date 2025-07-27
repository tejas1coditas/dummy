import 'package:assignment_3/helper_functions/task_helper.dart';
import 'package:assignment_3/models/task_model.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final helper = TaskHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Task'), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 0, 10),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(fontSize: 17),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              height: 144,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 0, 10),
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(fontSize: 17),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Container(
              height: 56,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 0, 10),
                child: TextField(
                  controller: dueDateController,
                  decoration: InputDecoration(
                    hintText: 'Due Date',
                    hintStyle: TextStyle(fontSize: 17),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 400),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  helper.saveTask(
                    context: context,
                    titleController: titleController,
                    descriptionController: descriptionController,
                    dueDateController: dueDateController,
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
