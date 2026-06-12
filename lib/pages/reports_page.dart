import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = [
      'Proyector no enciende - Aula 203',
      'PC sin internet - Laboratorio 2',
      'Aire acondicionado con falla - Aula 105',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(18),
      itemCount: reports.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(
              Icons.warning_amber_outlined,
              color: Colors.orange,
            ),
            title: Text(reports[index]),
            subtitle: const Text('Estado: pendiente de revisión'),
            trailing: const Icon(Icons.chevron_right),
          ),
        );
      },
    );
  }
}
