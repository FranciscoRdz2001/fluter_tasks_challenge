import 'package:flutter_tasks_challenge/presentation/home/controllers/home_tab_controller.dart';
import 'package:flutter_tasks_challenge/presentation/home/controllers/tasks_controller.dart';
import 'package:get/get.dart';

class HomePageBindings implements Bindings {
  const HomePageBindings();
  @override
  void dependencies() {
    Get.put(HomeTabController());
    Get.put(TasksController());
  }
}
