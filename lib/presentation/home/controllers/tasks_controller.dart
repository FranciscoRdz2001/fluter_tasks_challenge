import 'package:flutter_tasks_challenge/data/network/models/task_model.dart';
import 'package:flutter_tasks_challenge/data/repositories/tasks_repository.dart';
import 'package:flutter_tasks_challenge/presentation/home/controllers/home_tab_controller.dart';
import 'package:get/get.dart';

import '../../../data/network/models/api_response_model.dart';

class TasksController extends GetxController {
  final TasksRepository _repository = TasksRepository();
  Rx<List<TaskModel>?> tasks = Rx([]);
  Rx<List<TaskModel>?> completedTasks = Rx([]);
  Rx<List<TaskModel>?> notCompletedTasks = Rx([]);
  RxBool isLoading = RxBool(false);
  RxBool isSavingTask = RxBool(false);

  @override
  void onInit() async {
    getAllTasks();
    super.onInit();
  }

  Future<void> getAllTasks() async {
    isLoading.value = true;
    tasks.value = await _repository.getTasks();
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

  Future<TaskModel?> getTask(final int id) async {
    final task = _repository.getTask(id);
    return task;
  }

  Future<ApiResponseModel?> deleteTask(final TaskModel task) async {
    final res = await _repository.deleteTask(task);
    await getAllTasks();
    return res;
  }

  Future<ApiResponseModel?> editTask(final TaskModel task) async {
    return await _repository.editTask(task);
  }

  Future<ApiResponseModel?> createTask(final TaskModel task) async {
    final res = _repository.createTask(task);
    await getAllTasks();
    return res;
  }
}
