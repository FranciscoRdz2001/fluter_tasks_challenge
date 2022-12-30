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
    required this.dueDate,
    required this.comments,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'is_completed': (isCompleted ? 1 : 0).toString(),
      'due_date':
          dueDate == null ? null : DateFormat('yyyy-MM-dd').format(dueDate!),
      'comments': comments,
      'description': description,
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

  List<String> getExpirationTime() {
    if (dueDate == null) return ['No date'];
    final difference = dueDate!.difference(DateTime.now());
    const int daysInYear = 365;
    final double years = difference.inDays / daysInYear;
    final double days = getResidue(years) * daysInYear;
    final double hours = getResidue(days) * 24;
    final double minutes = getResidue(hours) * 60;
    final list = [
      years != 0 ? '${years.floor()} years' : '',
      days != 0 ? ' ${days.floor()} day/s' : '',
      hours != 0 ? ' ${hours.floor()} hour/s' : '',
      minutes != 0 ? ' ${minutes.floor()} minutes/s' : '',
    ];
    return list.where((t) => t.isNotEmpty).toList();
  }

  double getResidue(double value) => value - value.toInt();
  String getDate() =>
      dueDate == null ? 'No date' : DateFormat.yMMMEd().format(dueDate!);
}
