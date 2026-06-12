import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../widgets/app_logo.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/role_button.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedRole = 'Estudiante';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final List<Map<String, dynamic>> roles = [
    {'name': 'Estudiante', 'icon': Icons.school_outlined, 'color': Colors.blue},
    {'name': 'Docente', 'icon': Icons.person_outline, 'color': Colors.green},
    {
      'name': 'Soporte',
      'icon': Icons.support_agent_outlined,
      'color': Colors.orange,
    },
    {
      'name': 'Admin',
      'icon': Icons.admin_panel_settings_outlined,
      'color': Colors.purple,
    },
  ];

  void login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage(role: selectedRole)),
    );
  }

  void goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(18),
          padding: const EdgeInsets.all(22),
          width: 370,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.black87, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppLogo(),
                const SizedBox(height: 12),

                const Text(
                  'ClassReport',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Reporta incidencias con aulas y laboratorios de forma rápida y sencilla.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),

                const SizedBox(height: 22),

                CustomTextField(
                  controller: emailController,
                  label: 'Correo institucional',
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  controller: passwordController,
                  label: 'Contraseña',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),

                const SizedBox(height: 18),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: OutlinedButton(
                    onPressed: goToRegister,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: Color(0xFFCBD5E1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Seleccionar rol',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: roles.map((role) {
                    final bool isSelected = selectedRole == role['name'];

                    return RoleButton(
                      title: role['name'],
                      icon: role['icon'],
                      color: role['color'],
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedRole = role['name'];
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
