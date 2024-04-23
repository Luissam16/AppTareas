import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/TaskController.dart';
import 'package:flutter_application_1/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController _taskController;
  late TextEditingController _descriptionController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _taskController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
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
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la descripción de la tarea',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'Seleccione la fecha de entrega'
                        : 'Fecha de entrega: ${_selectedDate!.toString().substring(0, 10)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Seleccionar fecha'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String taskName = _taskController.text.trim();
                String description = _descriptionController.text.trim();
                if (taskName.isNotEmpty && description.isNotEmpty) {
                  Task newTask = Task(
                    name: taskName,
                    description: description,
                    dueDate: _selectedDate,
                    isCompleted: false,
                  );
                  print('Adding task: $newTask');
                  
                  // método create de TaskController para agregar la tarea a Firestore
                  String taskId = await TaskController().create(newTask.toMap());
                  if (taskId.isNotEmpty) {
                    print('Task added successfully with ID: $taskId');
                    Navigator.of(context).pop(newTask);
                  } else {
                    print('Failed to add task to Firestore');
                  }
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
