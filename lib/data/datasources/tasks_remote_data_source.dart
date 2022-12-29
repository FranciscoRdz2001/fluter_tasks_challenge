import 'package:flutter_tasks_challenge/data/models/task_model.dart';
import 'package:http/http.dart' as http;

abstract class TasksRemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<List<TaskModel>> editTask();
  Future<List<TaskModel>> deleteTasks();
}

class TasksRemoteDataSourceImpl extends TasksRemoteDataSource {
  @override
  Future<List<TaskModel>> deleteTasks() async {
    return [];
  }

  @override
  Future<List<TaskModel>> editTask() async {
    return [];
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    return [];
  }
}
