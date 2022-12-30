import 'package:flutter_tasks_challenge/data/network/models/task_model.dart';

abstract class ApiRepository {
  Future<List<TaskModel>> getTasks();
}
