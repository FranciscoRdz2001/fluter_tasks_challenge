import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/config/constants.dart';
import 'package:flutter_tasks_challenge/data/models/task_model.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/task_animated_line_widget.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/task_date_widget.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/task_information_widget.dart';

import '../../../app/utils/responsive_util.dart';

class TaskContainerWidget extends StatelessWidget {
  final TaskModel task;
  final ValueNotifier<double> height = ValueNotifier(0);
  final Color color;
  final GlobalKey testKey = GlobalKey();

  TaskContainerWidget({
    super.key,
    required this.color,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (testKey.currentContext == null) return;
      final RenderObject? renderBoxRed =
          testKey.currentContext?.findRenderObject();
      final size = renderBoxRed!.paintBounds;
      height.value = size.size.height;
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: lightGrey.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15),
            boxShadow: shadows,
          ),
          child: InkWell(
            splashColor: color,
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            onLongPress: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: resp.wp(3),
                vertical: resp.hp(1.5),
              ),
              child: Column(
                key: testKey,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TaskDateWidget(date: task.getDate()),
                      ),
                      SizedBox(width: resp.wp(2)),
                      ValueListenableBuilder(
                        valueListenable: height,
                        builder: (context, value, child) {
                          return TaskAnimatedLineWidget(
                            height: value,
                            color: color,
                          );
                        },
                      ),
                      SizedBox(width: resp.wp(2)),
                      Expanded(
                        flex: 30,
                        child: TaskInformationWidget(
                          task: task,
                        ),
                      ),
                      SizedBox(width: resp.wp(1)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: resp.hp(1.5)),
      ],
    );
  }
}
