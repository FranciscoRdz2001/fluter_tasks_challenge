import 'package:flutter_tasks_challenge/data/network/models/task_model.dart';

import '../../../../app/types/tabs_types.dart';

class TabModel {
  final TaskTypes type;
  final List<TaskModel>? tasks;

  const TabModel({
    required this.type,
    required this.tasks,
  });
}
