import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';
import 'package:flutter_application_1/views/add_task.dart';
import 'package:flutter_application_1/views/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];
  List<Task> completedTasks = [];
  List<Task> deletedTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenid@ a tu lista de tareas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: tasks.isEmpty ? _buildEmptyTasksMessage() : TaskList(
              tasks: tasks,
              onTaskCompleted: _handleTaskCompleted,
              onTaskDeleted: _handleTaskDeleted,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddTaskScreen()),
                  ).then((newTask) {
                    if (newTask != null) {
                      setState(() {
                        tasks.add(newTask);
                      });
                    }
                  });
                },
                child: const Icon(Icons.add),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (completedTasks.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('No tienes tareas completadas'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cerrar'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ListView.builder(
                          itemCount: completedTasks.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(completedTasks[index].name),
                              subtitle: Text(completedTasks[index].description),
                            );
                          },
                        );
                      },
                    );
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text('Completadas'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (deletedTasks.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('No tienes tareas eliminadas'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cerrar'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ListView.builder(
                          itemCount: deletedTasks.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(deletedTasks[index].name),
                              subtitle: Text(deletedTasks[index].description),
                            );
                          },
                        );
                      },
                    );
                  }
                },
                icon: const Icon(Icons.delete),
                label: const Text('Eliminadas'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyTasksMessage() {
    return const Center(
      child: Text(
        'No hay tareas para mostrar',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  void _handleTaskCompleted(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
      if (task.isCompleted) {
        completedTasks.add(task);
        tasks.remove(task);
      } else {
        completedTasks.remove(task);
        tasks.add(task);
      }
    });
  }

  void _handleTaskDeleted(Task task) {
    setState(() {
      deletedTasks.add(task);
      tasks.remove(task);
    });
  }
}
