import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class ProfilePage extends StatelessWidget {
  final String role;
  final VoidCallback onLogout;

  const ProfilePage({super.key, required this.role, required this.onLogout});

  void showAction(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final displayRole = role.isEmpty ? 'Administrador' : role;

    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Column(
          children: [
            const CircleAvatar(
              radius: 38,
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              child: Icon(Icons.person, size: 42),
            ),
            const SizedBox(height: 12),
            Text(
              displayRole,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'admin@classreport.com',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _ProfileTile(
          icon: Icons.badge_outlined,
          title: 'Rol',
          subtitle: displayRole,
        ),
        const Divider(height: 1),
        const _ProfileTile(
          icon: Icons.phone_outlined,
          title: 'Telefono',
          subtitle: '999999999',
        ),
        const Divider(height: 1),
        const _ProfileTile(
          icon: Icons.tag,
          title: 'Codigo',
          subtitle: 'ADM001',
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 46,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Editar perfil'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () => showAction(context, 'Edicion de perfil simulada'),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 46,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.lock_reset_outlined),
            label: const Text('Cambiar contrasena'),
            onPressed: () => showAction(
              context,
              'Solicitud de cambio de contrasena enviada',
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 46,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('Cerrar sesion'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: onLogout,
          ),
        ),
      ],
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
