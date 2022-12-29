import 'package:intl/intl.dart';

class TaskModel {
  final int id;
  final String title;
  final bool isCompleted;
  final DateTime dueDate;

  const TaskModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.dueDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'is_completed': isCompleted,
      'due_date': dueDate.millisecondsSinceEpoch,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      isCompleted: map['is_completed'] == 1,
      dueDate: DateTime.parse(map['due_date']),
    );
  }

  List<String> getExpirationTime() {
    final difference = dueDate.difference(DateTime.now());
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
  String getDate() => DateFormat.yMMMEd().format(dueDate);
}
