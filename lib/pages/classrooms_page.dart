import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class ClassroomsPage extends StatelessWidget {
  const ClassroomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final classrooms = [
      'Aula 101',
      'Aula 203',
      'Laboratorio 1',
      'Laboratorio 2',
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(18),
      itemCount: classrooms.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.meeting_room_outlined,
                size: 40,
                color: AppColors.primary,
              ),
              const SizedBox(height: 10),
              Text(
                classrooms[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text('Disponible', style: TextStyle(color: Colors.green)),
            ],
          ),
        );
      },
    );
  }
}
