import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task.dart';

class TaskListTile extends StatelessWidget {
  final Task task;
  final void Function(bool?)? onCheckboxChanged;
  final VoidCallback? onDeletePressed;

  const TaskListTile({super.key, 
    required this.task,
    this.onCheckboxChanged,
    this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        task.description, 
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: onCheckboxChanged,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDeletePressed,
      ),
    );
  }
}
