import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import 'classrooms_page.dart';
import 'dashboard_page.dart';
import 'profile_page.dart';
import 'reports_page.dart';

class HomePage extends StatefulWidget {
  final String role;

  const HomePage({super.key, required this.role});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  late final List<Widget> pages = [
    DashboardPage(role: widget.role),
    const ReportsPage(),
    const ClassroomsPage(),
    const ProfilePage(),
  ];

  final List<String> titles = ['Inicio', 'Reportes', 'Aulas', 'Perfil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClassReport - ${titles[selectedIndex]}'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Reportes',
          ),
          NavigationDestination(
            icon: Icon(Icons.apartment_outlined),
            selectedIcon: Icon(Icons.apartment),
            label: 'Aulas',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
