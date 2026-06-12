import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          CircleAvatar(radius: 45, child: Icon(Icons.person, size: 48)),
          SizedBox(height: 14),
          Text(
            'Usuario ClassReport',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Esta ventana muestra información básica del usuario y su rol dentro del sistema.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
