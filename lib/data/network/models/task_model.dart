import 'package:flutter_tasks_challenge/app/config/constants.dart';
import 'package:intl/intl.dart';

class TaskModel {
  final int id;
  String title;
  bool isCompleted;
  DateTime? dueDate;
  String? comments;
  String? description;
  String? tags;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.dueDate,
    this.comments,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'is_completed': isCompleted ? 1 : 0,
      'due_date':
          dueDate == null ? null : DateFormat('yyyy-MM-dd').format(dueDate!),
      'comments': comments,
      'description': description,
      'token': token,
      'tags': tags,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'] ?? '',
      isCompleted: map['is_completed'] == 1,
      dueDate: map['due_date'] != null ? DateTime.parse(map['due_date']) : null,
      comments: map['comments'],
      description: map['description'],
      tags: map['tags'],
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at']!)
          : map['created_at'],
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at']!)
          : map['updated_at'],
    );
  }

  String getExpirationTime() {
    if (dueDate == null) return 'No date';
    final difference = dueDate!.difference(DateTime.now());
    final days = difference.inDays;
    final hours = difference.inHours - difference.inDays * 24;
    final minutes = difference.inMinutes - difference.inHours * 60;

    return '${_checkTime(days, 'day')}${_checkTime(hours, 'hour')}${_checkTime(minutes, 'minute')}';
  }

  String _checkTime(int time, String label) {
    if (time == 0) return '';
    final finalLabel = time.abs() > 1 ? '${label}s' : label;
    return '$time $finalLabel ';
  }

  double getResidue(double value) => value - value.toInt();
  String getDate() =>
      dueDate == null ? 'No date 2' : DateFormat.yMMMEd().format(dueDate!);
}
