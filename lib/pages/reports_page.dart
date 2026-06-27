import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final List<Map<String, dynamic>> reports = [
    {
      "title": "Proyector no funciona",
      "classroom": "Aula 101",
      "status": "Pendiente",
      "color": Colors.orange,
      "icon": Icons.report_problem,
    },
    {
      "title": "Silla rota",
      "classroom": "Aula 203",
      "status": "En proceso",
      "color": Colors.blue,
      "icon": Icons.build,
    },
    {
      "title": "Foco quemado",
      "classroom": "Laboratorio 1",
      "status": "Resuelto",
      "color": Colors.green,
      "icon": Icons.check_circle,
    },
  ];

  void _newReport() {
    showDialog(
      context: context,
      builder: (context) {
        final titleController = TextEditingController();

        return AlertDialog(
          title: const Text("Nuevo Reporte"),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: "Descripción"),
          ),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text("Guardar"),
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  setState(() {
                    reports.add({
                      "title": titleController.text,
                      "classroom": "Aula General",
                      "status": "Pendiente",
                      "color": Colors.orange,
                      "icon": Icons.report_problem,
                    });
                  });

                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      floatingActionButton: FloatingActionButton(
        onPressed: _newReport,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: reports.length,

        itemBuilder: (context, index) {
          final report = reports[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 15),

            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: (report["color"] as Color).withOpacity(.15),
                child: Icon(report["icon"], color: report["color"]),
              ),

              title: Text(
                report["title"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(report["classroom"]),

                  const SizedBox(height: 5),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: (report["color"] as Color).withOpacity(.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      report["status"],
                      style: TextStyle(
                        color: report["color"],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Reporte: ${report["title"]}")),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
