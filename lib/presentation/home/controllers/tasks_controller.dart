import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/data/datasources/tasks_remote_data_source.dart';
import 'package:flutter_tasks_challenge/data/models/task_model.dart';
import 'package:flutter_tasks_challenge/presentation/home/controllers/home_tab_controller.dart';
import 'package:get/get.dart';

class TasksController extends GetxController {
  final TasksRemoteDataSourceImpl dataSource = TasksRemoteDataSourceImpl();
  Rx<List<TaskModel>?> tasks = Rx([]);
  Rx<List<TaskModel>?> completedTasks = Rx([]);
  Rx<List<TaskModel>?> notCompletedTasks = Rx([]);
  RxBool isLoading = RxBool(false);

  @override
  void onInit() async {
    getAllTasks();
    super.onInit();
  }

  Future<void> getAllTasks() async {
    isLoading.value = true;
    tasks.value = await dataSource.getTasks();
    if (tasks.value != null) {
      completedTasks.value = tasks.value!.where((t) => t.isCompleted).toList();
      notCompletedTasks.value =
          tasks.value!.where((t) => !t.isCompleted).toList();
      final HomeTabController tabsController = Get.find();
      tabsController.initTabs(
        completedTasks: completedTasks.value,
        notCompletedTasks: notCompletedTasks.value,
      );
    }
    isLoading.value = false;
  }
}