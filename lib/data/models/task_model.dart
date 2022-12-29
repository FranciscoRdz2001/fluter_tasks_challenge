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
      'isCompleted': isCompleted,
      'dueDate': dueDate.millisecondsSinceEpoch,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      isCompleted: map['isCompleted'],
      dueDate: DateTime.parse(map['due_date']),
    );
  }

  String getExpiresTime() {
    // final DateTime.now
    return '';
  }
}
