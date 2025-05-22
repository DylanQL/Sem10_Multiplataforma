import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Tareas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
      routes: {
        '/registro': (context) => const UserRegistrationScreen(),
        '/menu': (context) => const MenuScreen(),
        '/tareas': (context) => const TaskListScreen(),
        '/registrar-tarea': (context) => const RegisterTaskScreen(),
      },
    );
  }
}

// Primera vista: Welcome Screen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Gestor de Tareas',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registro');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Entrar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

// Segunda vista: User Registration Screen
class UserRegistrationScreen extends StatelessWidget {
  const UserRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Ocupación',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.work),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Continuar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

// Tercera vista: Menu Screen
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
        automaticallyImplyLeading: false, // Quitar el botón de regreso
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Menú',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tareas');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Ver tareas', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registrar-tarea');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Registrar tareas', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

// Cuarta vista: Task List Screen
class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista ficticia de tareas para mostrar
    final List<Map<String, dynamic>> tasks = [
      {'title': 'Comprar víveres', 'date': '23/05/2025', 'priority': 'Alta'},
      {'title': 'Reunión de trabajo', 'date': '24/05/2025', 'priority': 'Alta'},
      {'title': 'Revisar documentos', 'date': '25/05/2025', 'priority': 'Media'},
      {'title': 'Llamar al cliente', 'date': '26/05/2025', 'priority': 'Baja'},
      {'title': 'Enviar informe', 'date': '27/05/2025', 'priority': 'Alta'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.task_alt),
              title: Text(tasks[index]['title']),
              subtitle: Text('Fecha: ${tasks[index]['date']}'),
              trailing: Chip(
                label: Text(tasks[index]['priority']),
                backgroundColor: _getPriorityColor(tasks[index]['priority']),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/registrar-tarea');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  
  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Alta':
        return Colors.red.shade100;
      case 'Media':
        return Colors.orange.shade100;
      case 'Baja':
        return Colors.green.shade100;
      default:
        return Colors.grey.shade100;
    }
  }
}

// Quinta vista: Register Task Screen
class RegisterTaskScreen extends StatelessWidget {
  const RegisterTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Título de la tarea',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Prioridad',
                border: OutlineInputBorder(),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text('Seleccionar prioridad'),
                  items: const [
                    DropdownMenuItem(value: 'Alta', child: Text('Alta')),
                    DropdownMenuItem(value: 'Media', child: Text('Media')),
                    DropdownMenuItem(value: 'Baja', child: Text('Baja')),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Fecha',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Mostrar un diálogo de éxito
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Éxito'),
                    content: const Text('Se registró con éxito la tarea.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('Aceptar'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Guardar Tarea', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
