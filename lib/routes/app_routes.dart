import 'package:flutter/material.dart';

import '../pages/cart_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';

class AppRoutes {
  static const String root = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String cart = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage(role: ''));
      case cart:
        return MaterialPageRoute(builder: (_) => const CartPage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Ruta no encontrada'))),
        );
    }
  }
}
