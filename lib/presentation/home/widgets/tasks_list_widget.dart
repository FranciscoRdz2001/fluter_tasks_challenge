import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/config/text_styles.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/presentation/home/controllers/home_tab_controller.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/task_container_widget.dart';
import 'package:get/get.dart';

class TasksListWidget extends GetView<HomeTabController> {
  const TasksListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Obx(
      () {
        final hasData = controller.selectedTab.value!.data.isNotEmpty;
        return Column(
          children: [
            if (hasData)
              ...List.generate(
                controller.selectedTab.value!.data.length,
                (index) => TaskContainerWidget(
                  color: colors[Random().nextInt(colors.length - 1)],
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
