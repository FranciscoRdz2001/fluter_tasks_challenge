import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tasks_challenge/app/config/constants.dart';
import 'package:flutter_tasks_challenge/data/models/api_response_model.dart';
import 'package:flutter_tasks_challenge/data/models/task_model.dart';
import 'package:http/http.dart' as http;

abstract class TasksRemoteDataSource {
  Future<List<TaskModel>?> getTasks();
  Future<TaskModel?> getTask(final int id);
  Future<ApiResponseModel?> editTask(final TaskModel task);
  Future<List<TaskModel>?> deleteTasks(TaskModel task);
}

class TasksRemoteDataSourceImpl extends TasksRemoteDataSource {
  @override
  Future<List<TaskModel>> deleteTasks(TaskModel task) async {
    return [];
  }

  @override
  Future<ApiResponseModel?> editTask(TaskModel task) async {
    try {
      final url = Uri.parse('$baseUrl/$tasksEndPoint/${task.id}');
      debugPrint(url.toString());
      final headers = {
        'Authorization':
            'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
        "Content-Type": "application/json; charset=utf-8",
      };
      final response = await http.put(
        url,
        body: jsonEncode(task.toMap()),
        headers: headers,
      );
      final json = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return ApiResponseModel(
          hasErrors: false,
          message: json['detail'],
          statusCode: response.statusCode,
        );
      }
      return ApiResponseModel(
        hasErrors: true,
        message: json['detail'],
        statusCode: response.statusCode,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<List<TaskModel>?> getTasks() async {
    try {
      final url = Uri.parse('$baseUrl/$tasksEndPoint');
      final headers = {
        'Authorization':
            'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd'
      };
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final list = List.from((jsonDecode(response.body)));
        return list.map((e) => TaskModel.fromMap(e)).toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<TaskModel?> getTask(int id) async {
    try {
      final url = Uri.parse('$baseUrl/$tasksEndPoint/$id');
      debugPrint(url.toString());
      final headers = {
        'Authorization':
            'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd'
      };
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final list = List.from((jsonDecode(response.body)));
        return list.map((e) => TaskModel.fromMap(e)).toList().first;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
