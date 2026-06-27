import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.instance.currentUser;

    return Scaffold(
      backgroundColor: AppColors.background,

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          const SizedBox(height: 20),

          const Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, color: Colors.white, size: 60),
            ),
          ),

          const SizedBox(height: 20),

          Center(
            child: Text(
              user?.nombre ?? "Usuario",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 5),

          Center(
            child: Text(
              user?.correo ?? "",
              style: const TextStyle(color: AppColors.textLight),
            ),
          ),

          const SizedBox(height: 30),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.badge, color: AppColors.primary),
                  title: const Text("Rol"),
                  subtitle: Text(user?.rol ?? ""),
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.phone, color: AppColors.primary),
                  title: const Text("Teléfono"),
                  subtitle: Text(user?.telefono ?? ""),
                ),

                const Divider(height: 1),

                ListTile(
                  leading: const Icon(Icons.numbers, color: AppColors.primary),
                  title: const Text("Código"),
                  subtitle: Text(user?.codigo ?? ""),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          ElevatedButton.icon(
            icon: const Icon(Icons.edit),
            label: const Text("Editar perfil"),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Función disponible en la siguiente versión."),
                ),
              );
            },
          ),

          const SizedBox(height: 15),

          OutlinedButton.icon(
            icon: const Icon(Icons.lock_reset),
            label: const Text("Cambiar contraseña"),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Cambio de contraseña próximamente."),
                ),
              );
            },
          ),

          const SizedBox(height: 15),

          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.logout),
            label: const Text("Cerrar sesión"),
            onPressed: () {
              AuthService.instance.logout();

              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
