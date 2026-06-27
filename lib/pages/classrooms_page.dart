import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class ClassroomsPage extends StatefulWidget {
  const ClassroomsPage({super.key});

  @override
  State<ClassroomsPage> createState() => _ClassroomsPageState();
}

class _ClassroomsPageState extends State<ClassroomsPage> {
  final List<Map<String, dynamic>> classrooms = [
    {
      "name": "Aula 101",
      "capacity": 30,
      "location": "Pabellón A",
      "status": "Disponible",
      "color": Colors.green,
    },
    {
      "name": "Aula 203",
      "capacity": 40,
      "location": "Pabellón B",
      "status": "Ocupada",
      "color": Colors.orange,
    },
    {
      "name": "Laboratorio 1",
      "capacity": 25,
      "location": "Pabellón C",
      "status": "Mantenimiento",
      "color": Colors.red,
    },
    {
      "name": "Laboratorio 2",
      "capacity": 20,
      "location": "Pabellón C",
      "status": "Disponible",
      "color": Colors.green,
    },
  ];

  void _showDetails(Map<String, dynamic> classroom) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(classroom["name"]),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(classroom["location"]),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: Text("Capacidad: ${classroom["capacity"]} estudiantes"),
            ),
            ListTile(
              leading: Icon(Icons.circle, color: classroom["color"], size: 15),
              title: Text(classroom["status"]),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cerrar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: GridView.builder(
        padding: const EdgeInsets.all(18),

        itemCount: classrooms.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: .85,
        ),

        itemBuilder: (context, index) {
          final classroom = classrooms[index];

          return Card(
            elevation: 4,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),

            child: InkWell(
              borderRadius: BorderRadius.circular(18),

              onTap: () => _showDetails(classroom),

              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: classroom["color"].withOpacity(.15),
                      child: Icon(
                        Icons.meeting_room,
                        size: 35,
                        color: classroom["color"],
                      ),
                    ),

                    Text(
                      classroom["name"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),

                    Text(
                      classroom["location"],
                      style: const TextStyle(color: AppColors.textLight),
                    ),

                    Chip(
                      avatar: Icon(
                        Icons.circle,
                        size: 12,
                        color: classroom["color"],
                      ),
                      label: Text(classroom["status"]),
                    ),

                    ElevatedButton.icon(
                      icon: const Icon(Icons.info_outline),
                      label: const Text("Detalles"),
                      onPressed: () => _showDetails(classroom),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
