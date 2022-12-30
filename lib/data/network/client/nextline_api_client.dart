import 'dart:convert';

import 'package:flutter_tasks_challenge/app/config/constants.dart';
import 'package:flutter_tasks_challenge/app/types/http_methods.dart';
import 'package:flutter_tasks_challenge/data/network/client/base_client.dart';

import '../models/api_response_model.dart';
import '../models/task_model.dart';

class NextlineApiClient extends BaseClient {
  static const _query = {'token': token};

  Future<List<TaskModel>?> getTasks() async {
    final response = await call(
      '$baseUrl/$tasksEndPoint',
      method: HttpMethods.getD,
      queryParameters: _query,
    );
    if (response.statusCode == 200) {
      final list = List.from((jsonDecode(response.body)));
      return list.map((e) => TaskModel.fromMap(e)).toList();
    }
    return null;
  }

  Future<TaskModel?> getTask(final int id) async {
    final response = await call(
      '$baseUrl/$tasksEndPoint/$id',
      method: HttpMethods.getD,
      queryParameters: _query,
    );
    if (response.statusCode == 200) {
      final list = List.from((jsonDecode(response.body)));
      return list.map((e) => TaskModel.fromMap(e)).toList().first;
    }
    return null;
  }

  Future<ApiResponseModel?> editTask(final TaskModel task) async {
    final response = await call(
      '$baseUrl/$tasksEndPoint/${task.id}',
      method: HttpMethods.put,
      queryParameters: _query,
      body: jsonEncode(task.toMap()),
    );
    final json = jsonDecode(response.body);
    return _getApiResponse(response.statusCode, 201, json['detail']);
  }

  Future<ApiResponseModel?> createTask(final TaskModel task) async {
    final response = await call(
      '$baseUrl/$tasksEndPoint',
      method: HttpMethods.post,
      queryParameters: _query,
      body: jsonEncode(task.toMap()),
    );
    final json = jsonDecode(response.body);
    return _getApiResponse(response.statusCode, 201, json['detail']);
  }

  Future<ApiResponseModel?> deleteTasks(TaskModel task) async {
    final response = await call(
      '$baseUrl/$tasksEndPoint/${task.id}',
      method: HttpMethods.delete,
      queryParameters: _query,
    );
    final json = jsonDecode(response.body);
    return _getApiResponse(response.statusCode, 201, json['detail']);
  }

  ApiResponseModel _getApiResponse(int code, int correctCode, String message) {
    if (code == correctCode) {
      return ApiResponseModel(
        hasErrors: false,
        message: message,
        statusCode: code,
      );
    }
    return ApiResponseModel(
      hasErrors: true,
      message: message,
      statusCode: code,
    );
  }
}
