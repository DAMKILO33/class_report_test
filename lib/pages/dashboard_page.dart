import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../widgets/info_card.dart';

class DashboardPage extends StatelessWidget {
  final String role;

  const DashboardPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            'Bienvenido, rol seleccionado: $role',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 18),

        const InfoCard(
          icon: Icons.report_problem_outlined,
          title: 'Reportar incidencia',
          description:
              'Permite registrar problemas en aulas, laboratorios o equipos.',
        ),

        const InfoCard(
          icon: Icons.timer_outlined,
          title: 'Seguimiento rápido',
          description: 'Muestra el estado de los reportes enviados.',
        ),

        const InfoCard(
          icon: Icons.people_outline,
          title: 'Roles del sistema',
          description:
              'Estudiante, docente, soporte y administrador pueden usar la app.',
        ),
      ],
    );
  }
}
