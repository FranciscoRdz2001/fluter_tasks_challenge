import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/task_animated_line_widget.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/task_date_widget.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/task_information_widget.dart';

import '../../../app/utils/responsive_util.dart';

class TaskContainerWidget extends StatelessWidget {
  final ValueNotifier<double> height = ValueNotifier(0);
  final Color color;
  final GlobalKey testKey = GlobalKey();

  TaskContainerWidget({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      final RenderObject? renderBoxRed =
          testKey.currentContext?.findRenderObject();
      final size = renderBoxRed!.paintBounds;
      height.value = size.size.height;
    });

    return Column(
      children: [
        SizedBox(
          key: testKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(flex: 8, child: TaskDateWidget()),
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
                    const Expanded(flex: 30, child: TaskInformationWidget()),
                    SizedBox(width: resp.wp(1)),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: resp.hp(2.5)),
      ],
    );
  }
}
