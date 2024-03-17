import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';
import 'package:flutter_application_1/views/add_task.dart';
import 'package:flutter_application_1/views/form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: ListView(
        children: [
          TaskListTile(
            task: Task(name: 'Tarea 1'),
            onCheckboxChanged: (isChecked) {
            },
            onDeletePressed: () {
            },
          ),
          TaskListTile(
            task: Task(name: 'Tarea 2'),
            onCheckboxChanged: (isChecked) {
            },
            onDeletePressed: () {
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
