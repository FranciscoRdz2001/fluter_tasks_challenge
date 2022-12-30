import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_tasks_challenge/app/types/http_methods.dart';
import 'package:http/http.dart' as http;

abstract class BaseClient {
  static const _timeOut = 30000;
  static const _retries = 1;

  late final http.Client _client;

  BaseClient() {
    _client = http.Client();
  }

  @protected
  Future<http.Response> call(
    String url, {
    required HttpMethods method,
    Map<String, String>? headers,
    int? currentTry,
    Map<String, String>? queryParameters,
    String? body,
  }) async {
    int retry = currentTry ?? 0;

    String queryParams = '';
    if (queryParameters != null) {
      queryParams += '?';
      queryParameters.forEach((key, value) => queryParams += '$key=$value&');
    }

    try {
      final uri = Uri.parse('$url$queryParams');
      late final http.Response response;
      switch (method) {
        case HttpMethods.getD:
          response = await _client
              .get(uri, headers: headers)
              .timeout(const Duration(milliseconds: _timeOut));
          break;
        case HttpMethods.delete:
          response = await _client
              .delete(uri, body: body, headers: headers)
              .timeout(const Duration(milliseconds: _timeOut));
          break;
        case HttpMethods.post:
          response = await _client
              .post(uri, body: body, headers: headers)
              .timeout(const Duration(milliseconds: _timeOut));
          break;
        case HttpMethods.put:
          response = await _client
              .put(uri, body: body, headers: headers)
              .timeout(const Duration(milliseconds: _timeOut));
          break;
      }
      return response;
    } on TimeoutException catch (_) {
      if (retry < _retries) {
        retry++;
        return call(url, headers: headers, currentTry: retry, method: method);
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}
