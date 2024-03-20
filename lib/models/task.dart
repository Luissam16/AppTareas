
class Task {
  String name;
  String description;
  bool isCompleted;
  
  Task({required this.name, required this.description, this.isCompleted = false, DateTime? dueDate});

  get dueDate => null;

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}
