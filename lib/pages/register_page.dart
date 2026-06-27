import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombreController = TextEditingController();

  final TextEditingController _correoController = TextEditingController();

  final TextEditingController _telefonoController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _rol = "Estudiante";

  bool _obscure = true;

  @override
  void dispose() {
    _nombreController.dispose();
    _correoController.dispose();
    _telefonoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _registrar() {
    if (!_formKey.currentState!.validate()) return;

    final registrado = AuthService.instance.register(
      nombre: _nombreController.text.trim(),
      correo: _correoController.text.trim(),
      telefono: _telefonoController.text.trim(),
      rol: _rol,
      password: _passwordController.text,
    );

    if (registrado) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario registrado correctamente")),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ese correo ya está registrado")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text("Crear cuenta")),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              children: [
                const SizedBox(height: 20),

                const CircleAvatar(
                  radius: 45,
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.person_add, color: Colors.white, size: 45),
                ),

                const SizedBox(height: 30),

                TextFormField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: "Nombre completo",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ingrese su nombre";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 18),

                TextFormField(
                  controller: _correoController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Correo",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ingrese un correo";
                    }

                    if (!value.contains("@")) {
                      return "Correo inválido";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                TextFormField(
                  controller: _telefonoController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Teléfono",
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),

                const SizedBox(height: 18),

                DropdownButtonFormField<String>(
                  value: _rol,

                  decoration: const InputDecoration(
                    labelText: "Rol",
                    prefixIcon: Icon(Icons.badge),
                  ),

                  items: const [
                    DropdownMenuItem(
                      value: "Estudiante",
                      child: Text("Estudiante"),
                    ),

                    DropdownMenuItem(value: "Docente", child: Text("Docente")),

                    DropdownMenuItem(value: "Soporte", child: Text("Soporte")),

                    DropdownMenuItem(
                      value: "Administrador",
                      child: Text("Administrador"),
                    ),
                  ],

                  onChanged: (value) {
                    setState(() {
                      _rol = value!;
                    });
                  },
                ),

                const SizedBox(height: 18),

                TextFormField(
                  controller: _passwordController,

                  obscureText: _obscure,

                  decoration: InputDecoration(
                    labelText: "Contraseña",

                    prefixIcon: const Icon(Icons.lock),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Mínimo 6 caracteres";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.person_add),
                    label: const Text(
                      "Registrarme",
                      style: TextStyle(fontSize: 17),
                    ),
                    onPressed: _registrar,
                  ),
                ),

                const SizedBox(height: 15),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ya tengo una cuenta"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
