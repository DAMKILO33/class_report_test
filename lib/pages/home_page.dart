import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../services/auth_service.dart';
import 'classrooms_page.dart';
import 'dashboard_page.dart';
import 'login_page.dart';
import 'notifications_page.dart';
import 'profile_page.dart';
import 'reports_page.dart';

class HomePage extends StatefulWidget {
  final String role;

  const HomePage({super.key, required this.role});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      DashboardPage(role: widget.role),
      const ReportsPage(),
      const ClassroomsPage(),
      const ProfilePage(),
    ];
  }

  void _logout() {
    AuthService.instance.logout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthService.instance.currentUser;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("ClassReport"),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: AppColors.primary),

              accountName: Text(user?.nombre ?? "Usuario"),

              accountEmail: Text(user?.correo ?? ""),

              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: AppColors.primary),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Inicio"),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });

                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.report),
              title: const Text("Reportes"),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });

                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.class_),
              title: const Text("Aulas"),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });

                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Perfil"),
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });

                Navigator.pop(context);
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Cerrar sesión",
                style: TextStyle(color: Colors.red),
              ),
              onTap: _logout,
            ),
          ],
        ),
      ),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _pages[_currentIndex],
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: "Inicio",
          ),

          NavigationDestination(
            icon: Icon(Icons.report_outlined),
            selectedIcon: Icon(Icons.report),
            label: "Reportes",
          ),

          NavigationDestination(
            icon: Icon(Icons.meeting_room_outlined),
            selectedIcon: Icon(Icons.meeting_room),
            label: "Aulas",
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],

        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
