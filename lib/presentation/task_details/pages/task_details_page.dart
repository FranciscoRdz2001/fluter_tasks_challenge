import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/data/models/task_model.dart';
import 'package:flutter_tasks_challenge/presentation/task_details/widgets/task_data_widget.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';

import '../../../app/config/text_styles.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({super.key});

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  final TaskModel? task = Get.arguments;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..addListener(animationListener);
    _animation = Tween<double>(begin: 1, end: 0).animate(_controller);
    _controller.forward();
  }

  void animationListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    final value = _animation.value;
    final size = resp.height * value;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Opacity(
            opacity: 1 - value,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: resp.wp(7),
                  vertical: resp.hp(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              splashColor: accent,
                              highlightColor: lightGrey,
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: accent,
                              ),
                              onPressed: () => Get.back(),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Center(
                              child: Text(
                                'Tasks challenge',
                                maxLines: 1,
                                style: TextStyles.w800(20),
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              splashColor: accent,
                              highlightColor: lightGrey,
                              icon: const Icon(
                                Icons.edit,
                                color: accent,
                              ),
                              onPressed: () => Get.back(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: resp.hp(5)),
                    TaskDataWidget(
                      title: 'Status',
                      isRequiredToSave: true,
                      extraWidget: Row(
                        children: [
                          SizedBox(
                            height: resp.hp(2.5),
                            width: resp.wp(5),
                            child: Checkbox(
                              activeColor: accent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              value: task!.isCompleted,
                              onChanged: (value) => task!.isCompleted = value!,
                            ),
                          ),
                          SizedBox(width: resp.wp(1)),
                          Text(
                            task!.isCompleted ? 'Completed' : 'Not completed',
                            style: TextStyles.w500(14, grey),
                          ),
                        ],
                      ),
                      icon: Icons.check,
                    ),
                    TaskDataWidget(
                      title: 'Description',
                      subTitle: task!.description ?? 'No description',
                      icon: Icons.text_snippet_rounded,
                      canEdit: true,
                    ),
                    TaskDataWidget(
                      title: 'Due date',
                      subTitle: task!.getDate(),
                      icon: Icons.date_range_rounded,
                      canEdit: true,
                    ),
                    TaskDataWidget(
                      title: 'Comments',
                      subTitle: task!.comments ?? 'No comments',
                      icon: Icons.comment,
                      canEdit: true,
                    ),
                    TaskDataWidget(
                      title: 'Tags',
                      subTitle: task!.tags ?? 'No tags',
                      icon: Icons.tag,
                      canEdit: true,
                    ),
                    TaskDataWidget(
                      title: 'Creation date',
                      subTitle: task!.createdAt == null
                          ? 'No date'
                          : DateFormat.yMMMEd().format(task!.createdAt!),
                      icon: Icons.date_range_rounded,
                    ),
                    TaskDataWidget(
                      title: 'Last update',
                      subTitle: task!.updatedAt == null
                          ? 'No date'
                          : DateFormat.yMMMEd().format(task!.updatedAt!),
                      icon: Icons.date_range_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: value,
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  gradient: accentGradient,
                  borderRadius: BorderRadius.circular(100 * (1 - value)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
