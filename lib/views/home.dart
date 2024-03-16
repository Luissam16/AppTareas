import 'package:flutter/material.dart';

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
          ListTile(
            title: const Text('Tarea 1'),
            onTap: () {
              
            },
          ),
          ListTile(
            title: const Text('Tarea 2'),
            onTap: () {
  
            },
          ),
        
        ],
      ),
    );
  }
}
