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
  Future<ApiResponseModel?> createTask(final TaskModel task);
  Future<ApiResponseModel?> deleteTasks(TaskModel task);
}

class TasksRemoteDataSourceImpl extends TasksRemoteDataSource {
  @override
  Future<ApiResponseModel?> deleteTasks(TaskModel task) async {
    try {
      final url = Uri.parse('$baseUrl/$tasksEndPoint/${task.id}?token=$token');
      debugPrint(url.toString());
      final headers = {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json; charset=utf-8",
      };
      final response = await http.delete(
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
  Future<ApiResponseModel?> editTask(TaskModel task) async {
    try {
      final url = Uri.parse('$baseUrl/$tasksEndPoint/${task.id}?token=$token');
      debugPrint(url.toString());
      final headers = {
        'Authorization': 'Bearer $token',
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
      final url = Uri.parse('$baseUrl/$tasksEndPoint?token=$token');
      final headers = {'Authorization': 'Bearer $token'};
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
      final url = Uri.parse('$baseUrl/$tasksEndPoint/$id?token=$token');
      debugPrint(url.toString());
      final headers = {'Authorization': 'Bearer $token'};
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

  @override
  Future<ApiResponseModel?> createTask(TaskModel task) async {
    try {
      final url = Uri.parse('$baseUrl/$tasksEndPoint');
      debugPrint(url.toString());
      final headers = {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json; charset=utf-8",
      };
      final response = await http.post(
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
}
