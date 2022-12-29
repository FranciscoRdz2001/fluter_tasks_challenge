import 'package:flutter_tasks_challenge/app/types/tabs_types.dart';
import 'package:flutter_tasks_challenge/presentation/home/data/models/tab_model.dart';
import 'package:get/get.dart';

import '../../../data/models/task_model.dart';

class HomeTabController extends GetxController {
  RxList<TabModel> tabs = RxList([]);
  Rx<TabModel?> selectedTab = Rx(null);

  @override
  void onInit() {
    initTabs(completedTasks: null, notCompletedTasks: null);
    super.onInit();
  }

  void initTabs({
    required List<TaskModel>? completedTasks,
    required List<TaskModel>? notCompletedTasks,
  }) {
    tabs.value = [
      TabModel(type: TaskTypes.completed, tasks: completedTasks),
      TabModel(type: TaskTypes.notCompleted, tasks: notCompletedTasks),
    ];

    if (selectedTab.value == null) {
      selectedTab.value = tabs.first;
    } else {
      switch (selectedTab.value!.type) {
        case TaskTypes.completed:
          selectedTab.value =
              TabModel(type: TaskTypes.completed, tasks: completedTasks);
          break;
        case TaskTypes.notCompleted:
          selectedTab.value =
              TabModel(type: TaskTypes.notCompleted, tasks: notCompletedTasks);
      }
    }
    selectedTab.value ??= tabs.first;
  }

  bool isSelected(TabModel tab) => tab.type == selectedTab.value!.type;

  void onNewSelection(TabModel tab) {
    if (tab != selectedTab.value) {
      selectedTab.value = tab;
    }
  }
}
