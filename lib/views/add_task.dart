import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController _taskController;
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController();
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nombre de la tarea',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String taskName = _taskController.text.trim();
                if (taskName.isNotEmpty) {
                  Task newTask = Task(name: taskName);
                  setState(() {
                    tasks.add(newTask); 
                  });
                  Navigator.of(context).pop(); 
                }
              },
              child: const Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}
