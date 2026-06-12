import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            const Text(
              'Crear cuenta en ClassReport',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 18),

            CustomTextField(
              controller: nameController,
              label: 'Nombre completo',
              icon: Icons.person_outline,
            ),

            const SizedBox(height: 12),

            CustomTextField(
              controller: emailController,
              label: 'Correo institucional',
              icon: Icons.email_outlined,
            ),

            const SizedBox(height: 18),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registro simulado correctamente'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
