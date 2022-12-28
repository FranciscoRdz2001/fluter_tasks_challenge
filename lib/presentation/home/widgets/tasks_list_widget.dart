import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/task_container_widget.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          5,
          (index) => TaskContainerWidget(
            color: colors[Random().nextInt(colors.length - 1)],
          ),
        )
      ],
    );
  }
}
