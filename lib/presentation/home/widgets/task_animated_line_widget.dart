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
        duration: const Duration(milliseconds: 350),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
