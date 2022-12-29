import 'package:flutter/painting.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';

const String baseUrl = 'https://ecsdevapi.nextline.mx/vdev/tasks-challenge';
const String tasksEndPoint = 'tasks';
List<BoxShadow> shadows = [
  BoxShadow(
    color: black.withOpacity(0.12),
    blurRadius: 24,
    offset: const Offset(0, 8),
  )
];
