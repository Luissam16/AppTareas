
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> create(Map<String, dynamic> taskData) async {
    try {
      DocumentReference docRef = await _firestore.collection('tasks').add(taskData);
      return docRef.id; 
    } catch (e) {
      print('Error al agregar la tarea a Firestore: $e');
      return '';
    }
  }
}
