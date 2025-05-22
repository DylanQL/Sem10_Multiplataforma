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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5C6BC0),
          primary: const Color(0xFF5C6BC0),
          secondary: const Color(0xFF26A69A),
          tertiary: const Color(0xFF7986CB),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF5C6BC0), width: 2),
          ),
        ),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.tertiary.withOpacity(0.6),
            ],
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.task_alt,
                    size: 80,
                    color: Color(0xFF5C6BC0),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Gestor de Tareas',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF303F9F),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Organiza tus actividades diarias',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registro');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      backgroundColor: const Color(0xFF5C6BC0),
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.login),
                    label: const Text('Entrar', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Registro de Usuario',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.4),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person_add_alt_1,
                          size: 60,
                          color: Color(0xFF5C6BC0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              '¡Bienvenido!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF303F9F),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Por favor completa tus datos para continuar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 25),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Nombre',
                                hintText: 'Ingresa tu nombre completo',
                                prefixIcon: Icon(Icons.person, color: Color(0xFF5C6BC0)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Ocupación',
                                hintText: 'Ingresa tu ocupación actual',
                                prefixIcon: Icon(Icons.work, color: Color(0xFF5C6BC0)),
                              ),
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/menu');
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                backgroundColor: const Color(0xFF5C6BC0),
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              icon: const Icon(Icons.arrow_forward),
                              label: const Text('Continuar', style: TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Menú Principal',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false, // Quitar el botón de regreso
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF5C6BC0),
              const Color(0xFF7986CB).withOpacity(0.7),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.format_list_bulleted,
                      size: 70,
                      color: Color(0xFF5C6BC0),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Menú',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    '¿Qué deseas hacer hoy?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 60),
                  _buildMenuOption(
                    context: context,
                    icon: Icons.list_alt,
                    title: 'Ver tareas',
                    subtitle: 'Revisa tus tareas pendientes',
                    route: '/tareas',
                    color: const Color(0xFF26A69A),
                  ),
                  const SizedBox(height: 20),
                  _buildMenuOption(
                    context: context,
                    icon: Icons.add_task,
                    title: 'Registrar tareas',
                    subtitle: 'Añade una nueva tarea',
                    route: '/registrar-tarea',
                    color: const Color(0xFF7E57C2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildMenuOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required String route,
    required Color color,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 32,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ],
          ),
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
      {
        'title': 'Comprar víveres',
        'date': '23/05/2025',
        'priority': 'Alta',
        'description': 'Ir al supermercado y comprar alimentos para la semana',
        'icon': Icons.shopping_cart,
      },
      {
        'title': 'Reunión de trabajo',
        'date': '24/05/2025',
        'priority': 'Alta',
        'description': 'Reunión con el equipo para discutir el nuevo proyecto',
        'icon': Icons.people,
      },
      {
        'title': 'Revisar documentos',
        'date': '25/05/2025',
        'priority': 'Media',
        'description': 'Revisar y firmar los documentos pendientes',
        'icon': Icons.description,
      },
      {
        'title': 'Llamar al cliente',
        'date': '26/05/2025',
        'priority': 'Baja',
        'description': 'Llamada de seguimiento con el cliente sobre su pedido',
        'icon': Icons.phone,
      },
      {
        'title': 'Enviar informe',
        'date': '27/05/2025',
        'priority': 'Alta',
        'description': 'Finalizar y enviar el informe mensual',
        'icon': Icons.assignment,
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Mis Tareas',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100, bottom: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.checklist_rounded,
                      size: 32,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${tasks.length} tareas pendientes',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar tarea...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: _getPriorityBackgroundColor(tasks[index]['priority']),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                tasks[index]['icon'] ?? Icons.task_alt,
                                color: _getPriorityIconColor(tasks[index]['priority']),
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tasks[index]['title'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    tasks[index]['description'] ?? '',
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  tasks[index]['date'],
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Chip(
                              label: Text(
                                tasks[index]['priority'],
                                style: TextStyle(
                                  color: _getPriorityIconColor(tasks[index]['priority']),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: _getPriorityBackgroundColor(tasks[index]['priority']),
                              padding: EdgeInsets.zero,
                              labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: -2),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/registrar-tarea');
        },
        icon: const Icon(Icons.add),
        label: const Text('Nueva tarea'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
  
  Color _getPriorityBackgroundColor(String priority) {
    switch (priority) {
      case 'Alta':
        return Colors.red.shade50;
      case 'Media':
        return Colors.orange.shade50;
      case 'Baja':
        return Colors.green.shade50;
      default:
        return Colors.grey.shade50;
    }
  }
  
  Color _getPriorityIconColor(String priority) {
    switch (priority) {
      case 'Alta':
        return Colors.red;
      case 'Media':
        return Colors.orange;
      case 'Baja':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

// Quinta vista: Register Task Screen
class RegisterTaskScreen extends StatefulWidget {
  const RegisterTaskScreen({super.key});

  @override
  State<RegisterTaskScreen> createState() => _RegisterTaskScreenState();
}

class _RegisterTaskScreenState extends State<RegisterTaskScreen> {
  String? _selectedPriority;
  String _selectedDate = '22/05/2025'; // Fecha actual por defecto
  String? _selectedIcon;
  final List<Map<String, dynamic>> _iconOptions = [
    {'name': 'Trabajo', 'icon': Icons.work},
    {'name': 'Estudio', 'icon': Icons.school},
    {'name': 'Hogar', 'icon': Icons.home},
    {'name': 'Compras', 'icon': Icons.shopping_cart},
    {'name': 'Salud', 'icon': Icons.favorite},
    {'name': 'Ocio', 'icon': Icons.sports_esports},
    {'name': 'Otro', 'icon': Icons.more_horiz},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Nueva Tarea',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Detalles de la tarea',
                              style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5C6BC0),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Título de la tarea',
                                prefixIcon: Icon(Icons.title),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const TextField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                labelText: 'Descripción',
                                alignLabelWithHint: true,
                                prefixIcon: Icon(Icons.description),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Categoría con iconos
                            const Text(
                              'Categoría',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                                child: Row(
                                  children: _iconOptions.map((option) => 
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedIcon = option['name'] as String;
                                              });
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: _selectedIcon == option['name'] 
                                                    ? Theme.of(context).colorScheme.primary 
                                                    : Colors.grey.shade200,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                option['icon'] as IconData,
                                                color: _selectedIcon == option['name'] 
                                                    ? Colors.white 
                                                    : Colors.black54,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            option['name'] as String,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Prioridad como chips
                            const Text(
                              'Prioridad',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 10,
                              children: [
                                _buildPriorityChip('Alta', Colors.red),
                                _buildPriorityChip('Media', Colors.orange),
                                _buildPriorityChip('Baja', Colors.green),
                              ],
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                // Simulamos seleccionar una fecha
                                setState(() {
                                  _selectedDate = '24/05/2025';
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today, color: Color(0xFF5C6BC0)),
                                    const SizedBox(width: 10),
                                    const Text('Fecha de vencimiento'),
                                    const Spacer(),
                                    Text(
                                      _selectedDate,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5C6BC0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Mostrar un diálogo de éxito con animación
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF4CAF50),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.check, color: Colors.white),
                                ),
                                const SizedBox(width: 10),
                                const Text('¡Tarea registrada!'),
                              ],
                            ),
                            content: const Text(
                              'Se ha registrado con éxito la nueva tarea en el sistema.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Crear otra'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5C6BC0),
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('Aceptar'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: const Color(0xFF5C6BC0),
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.save),
                      label: const Text('Guardar Tarea', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriorityChip(String label, Color color) {
    final isSelected = _selectedPriority == label;
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : color,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedColor: color,
      backgroundColor: color.withOpacity(0.1),
      checkmarkColor: Colors.white,
      onSelected: (bool selected) {
        setState(() {
          _selectedPriority = selected ? label : null;
        });
      },
    );
  }
}

