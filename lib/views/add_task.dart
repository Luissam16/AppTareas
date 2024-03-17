// lib/views/add_task_screen.dart

import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskName = ''; // Variable para almacenar el nombre de la tarea

    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Tarea'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre de la Tarea',
              ),
              onChanged: (value) {
                taskName = value; // Actualizar el nombre de la tarea cuando cambie el texto
              },
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implementar la lógica para cancelar la creación de la tarea
                    Navigator.pop(context); // Regresar a la pantalla anterior
                  },
                  child: Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implementar la lógica para guardar la tarea
                    if (taskName.isNotEmpty) {
                      // Validar que el nombre de la tarea no esté vacío
                      // Aquí puedes agregar la lógica para guardar la tarea
                      Navigator.pop(context); // Regresar a la pantalla anterior
                    }
                  },
                  child: Text('Aceptar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
