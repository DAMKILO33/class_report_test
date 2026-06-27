import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../services/auth_service.dart';
import 'forgot_password_page.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _loading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
    });

    await Future.delayed(const Duration(milliseconds: 800));

    final success = AuthService.instance.login(
      correo: _emailController.text.trim(),
      password: _passwordController.text,
    );

    if (!mounted) return;

    setState(() {
      _loading = false;
    });

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(role: AuthService.instance.currentUser!.rol),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Correo o contraseña incorrectos")),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.school, size: 55, color: Colors.white),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "ClassReport",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Inicia sesión para continuar",
                    style: TextStyle(color: AppColors.textLight),
                  ),

                  const SizedBox(height: 35),

                  TextFormField(
                    controller: _emailController,

                    keyboardType: TextInputType.emailAddress,

                    decoration: const InputDecoration(
                      labelText: "Correo",
                      prefixIcon: Icon(Icons.email),
                    ),

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Ingrese su correo";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  TextFormField(
                    controller: _passwordController,

                    obscureText: _obscurePassword,

                    decoration: InputDecoration(
                      labelText: "Contraseña",

                      prefixIcon: const Icon(Icons.lock),

                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese su contraseña";
                      }

                      if (value.length < 6) {
                        return "Mínimo 6 caracteres";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text("¿Olvidaste tu contraseña?"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 52,

                    child: ElevatedButton(
                      onPressed: _loading ? null : _login,

                      child: _loading
                          ? const SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Iniciar sesión",
                              style: TextStyle(fontSize: 17),
                            ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("¿No tienes cuenta?"),

                      TextButton(
                        child: const Text("Registrarse"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Divider(),

                  const SizedBox(height: 10),

                  const Text(
                    "Usuario de prueba",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  const Text("admin@classreport.com"),

                  const Text("Contraseña: 123456"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
