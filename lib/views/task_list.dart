import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onTaskCompleted;
  final Function(Task) onTaskDeleted;

  const TaskList({
    Key? key,
    required this.tasks,
    required this.onTaskCompleted,
    required this.onTaskDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Row(
            children: [
              Text(
                task.name,
                style: TextStyle(
                  decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
              if (!task.isCompleted) Icon(Icons.check_circle, color: Colors.green),
            ],
          ),
          subtitle: Text(
            task.description,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (value) {
              onTaskCompleted(task); 
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onTaskDeleted(task); 
            },
          ),
        );
      },
    );
  }
}
