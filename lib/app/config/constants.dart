import 'package:flutter/painting.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';

const String baseUrl = 'https://ecsdevapi.nextline.mx/vdev/tasks-challenge';
const String token =
    'e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd';
const Map<String, String> headers = {
  'Authorization': 'Bearer $token',
  "Content-Type": "application/json; charset=utf-8",
};

const String tasksEndPoint = 'tasks';
List<BoxShadow> shadows = [
  BoxShadow(
    color: black.withOpacity(0.12),
    blurRadius: 24,
    offset: const Offset(0, 8),
  )
];
