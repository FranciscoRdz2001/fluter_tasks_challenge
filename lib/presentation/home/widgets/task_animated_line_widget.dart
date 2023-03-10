import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';

class TaskAnimatedLineWidget extends StatelessWidget {
  final double height;
  final Color color;
  const TaskAnimatedLineWidget({
    super.key,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: accentGradient.colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
