import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tasks_challenge/app/config/constants.dart';
import 'package:flutter_tasks_challenge/data/models/task_model.dart';
import 'package:http/http.dart' as http;

abstract class TasksRemoteDataSource {
  Future<List<TaskModel>?> getTasks();
  Future<List<TaskModel>?> editTask();
  Future<List<TaskModel>?> deleteTasks();
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
}
