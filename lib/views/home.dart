import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';
import 'package:flutter_application_1/views/add_task.dart';
import 'package:flutter_application_1/views/form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

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
              // Manejar el cambio de estado de la tarea aquí
            },
            onDeletePressed: () {
              // Manejar la eliminación de la tarea aquí
            },
          ),
          TaskListTile(
            task: Task(name: 'Tarea 2'),
            onCheckboxChanged: (isChecked) {
              // Manejar el cambio de estado de la tarea aquí
            },
            onDeletePressed: () {
              // Manejar la eliminación de la tarea aquí
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
        child: Icon(Icons.add),
      ),
    );
  }
}
