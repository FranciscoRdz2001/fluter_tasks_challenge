import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/config/text_styles.dart';
import 'package:flutter_tasks_challenge/app/utils/dialogs_util.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/presentation/home/controllers/home_tab_controller.dart';
import 'package:flutter_tasks_challenge/presentation/home/controllers/tasks_controller.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/custom_button_widget.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/error_getting_data_widget.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/loading_data_widget.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/task_container_widget.dart';
import 'package:get/get.dart';

class TasksListWidget extends GetView<HomeTabController> {
  const TasksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    final TasksController tasks = Get.find();
    return Obx(
      () {
        final errorGettingTasks = controller.selectedTab.value!.tasks == null;
        bool hasData = false;
        if (!errorGettingTasks) {
          hasData = controller.selectedTab.value!.tasks!.isNotEmpty;
        }
        return Column(
          children: [
            if (tasks.isLoading.value)
              const LoadingDataWidget()
            else if (errorGettingTasks)
              const ErrorGettingDataWidget()
            else if (hasData)
              ...List.generate(
                controller.selectedTab.value!.tasks!.length,
                (x) => TaskContainerWidget(
                  task: controller.selectedTab.value!.tasks![x],
                  color: colors[Random().nextInt(colors.length - 1)],
                  onLongPress: () {
                    final task = controller.selectedTab.value!.tasks![x];
                    DialogsUtil.withActions(
                      firstText: 'Are you sure you want to delete',
                      coloredText: task.title,
                      finalText: 'task?',
                      actions: [
                        CustomButtonWidget(
                          text: 'Aceptar',
                          color: const Color(0xff90B77D),
                          onPress: () async {
                            Get.back();
                            await tasks.deleteTask(task);
                          },
                        ),
                        CustomButtonWidget(
                          text: 'Cancelar',
                          color: const Color(0xffE64848),
                          onPress: () => Get.back(),
                        ),
                      ],
                    );
                  },
                ),
              )
            else ...[
              SizedBox(height: resp.hp(1.5)),
              Text('No tasks in list', style: TextStyles.w500(20, middleGrey)),
            ]
          ],
        );
      },
    );
  }
}
