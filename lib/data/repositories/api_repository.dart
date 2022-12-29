import 'package:flutter_tasks_challenge/data/models/task_model.dart';

abstract class ApiRepository {
  Future<List<TaskModel>> getTasks();
}
