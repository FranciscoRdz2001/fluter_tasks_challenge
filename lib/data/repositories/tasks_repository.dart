import 'package:flutter_tasks_challenge/data/network/client/nextline_api_client.dart';
import 'package:flutter_tasks_challenge/data/network/models/task_model.dart';

import '../network/models/api_response_model.dart';

class TasksRepository {
  final NextlineApiClient _api = NextlineApiClient();

  Future<List<TaskModel>?> getTasks() async {
    return await _api.getTasks();
  }

  Future<TaskModel?> getTask(final int id) async {
    return await _api.getTask(id);
  }

  Future<ApiResponseModel?> editTask(TaskModel task) async {
    return await _api.editTask(task);
  }

  Future<ApiResponseModel?> createTask(TaskModel task) async {
    return await _api.createTask(task);
  }

  Future<ApiResponseModel?> deleteTask(TaskModel task) async {
    return await _api.deleteTasks(task);
  }
}
