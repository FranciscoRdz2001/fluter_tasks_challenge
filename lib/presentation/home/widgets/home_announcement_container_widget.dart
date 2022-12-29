import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/config/text_styles.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/presentation/home/controllers/tasks_controller.dart';
import 'package:get/get.dart';

class HomeAnnouncementContainerWidget extends GetView<TasksController> {
  const HomeAnnouncementContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Container(
      height: resp.hp(25),
      width: resp.width,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: containersBackgroundColor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Obx(
        () {
          final hasErrors = controller.tasks.value == null;
          int notCompletedTasksQuantity = 0;
          if (!hasErrors) {
            notCompletedTasksQuantity =
                controller.notCompletedTasks.value!.length;
          }
          late final String imageName;
          late final String message;

          if (notCompletedTasksQuantity == 0 ||
              controller.isLoading.value ||
              hasErrors) {
            imageName = 'no_tasks';
            message = "No tasks";
          } else {
            imageName = 'has_tasks';
            message = "You have $notCompletedTasksQuantity task not completed";
          }
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: resp.wp(2.5),
                        left: resp.wp(2.5),
                        top: resp.hp(1.25),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: accentGradient,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: resp.hp(5),
                      right: resp.wp(5),
                      child: Image.asset('assets/images/$imageName.png'),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: TextStyles.w500(18),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
