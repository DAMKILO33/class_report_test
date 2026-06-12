import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 86,
      decoration: BoxDecoration(
        color: const Color(0xFFEAF0FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.meeting_room_outlined, size: 48, color: AppColors.primary),
          Positioned(
            right: 16,
            bottom: 16,
            child: Icon(
              Icons.report_problem_outlined,
              size: 24,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
