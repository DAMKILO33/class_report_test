import 'package:flutter/material.dart';

class RoleButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const RoleButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon),

        label: Text(title),

        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
