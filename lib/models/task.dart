
class Task {
  String name;
  String description;
  bool isCompleted;
  DateTime? dueDate;

  Task({
    required this.name,
    required this.description,
    this.isCompleted = false,
    this.dueDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'isCompleted': isCompleted,
      'dueDate': dueDate != null ? dueDate!.toIso8601String() : null,
    };
  }
}
