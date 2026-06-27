import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class DashboardPage extends StatelessWidget {
  final String role;

  const DashboardPage({super.key, required this.role});

  Widget buildCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(.15),
              child: Icon(icon, color: color, size: 30),
            ),

            const SizedBox(height: 15),

            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textLight),
            ),
          ],
        ),
      ),
    );
  }

  Widget quickButton(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(.15),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(text),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("$text seleccionado")));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),

      children: [
        Container(
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ),
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                "Bienvenido 👋",
                style: TextStyle(color: Colors.white70),
              ),

              const SizedBox(height: 8),

              Text(
                role,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Sistema de Reporte de Incidencias",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        const Text(
          "Resumen",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 15),

        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.1,

          children: [
            buildCard(
              icon: Icons.report_problem,
              title: "Reportes",
              value: "12",
              color: Colors.red,
            ),

            buildCard(
              icon: Icons.check_circle,
              title: "Resueltos",
              value: "8",
              color: Colors.green,
            ),

            buildCard(
              icon: Icons.meeting_room,
              title: "Aulas",
              value: "24",
              color: Colors.blue,
            ),

            buildCard(
              icon: Icons.people,
              title: "Usuarios",
              value: "58",
              color: Colors.orange,
            ),
          ],
        ),

        const SizedBox(height: 30),

        const Text(
          "Accesos rápidos",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        quickButton(
          context,
          icon: Icons.add_circle_outline,
          text: "Registrar incidencia",
        ),

        quickButton(
          context,
          icon: Icons.history,
          text: "Historial de reportes",
        ),

        quickButton(
          context,
          icon: Icons.meeting_room_outlined,
          text: "Ver aulas",
        ),

        quickButton(context, icon: Icons.person_outline, text: "Mi perfil"),
      ],
    );
  }
}
