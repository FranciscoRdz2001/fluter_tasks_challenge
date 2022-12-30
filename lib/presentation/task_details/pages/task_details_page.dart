import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/data/models/task_model.dart';
import 'package:flutter_tasks_challenge/presentation/home/controllers/tasks_controller.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/custom_button_widget.dart';
import 'package:flutter_tasks_challenge/presentation/task_details/widgets/task_data_widget.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';

import '../../../app/config/text_styles.dart';

class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({super.key});

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  final TaskModel? task = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: accent,
        child: const Icon(Icons.check),
        onPressed: () async {
          final TasksController taskController = Get.find();
          if (taskController.isSavingTask.value) return;
          final res = await taskController.editTask(task!);

          if (res == null) {
            Get.showSnackbar(
              GetSnackBar(
                titleText: Text(
                  'Message',
                  style: TextStyles.w800(16),
                ),
                messageText: Text(
                  'Error interno de la aplicación',
                  style: TextStyles.w500(14),
                ),
                backgroundColor: const Color(0xffEB5353),
                duration: const Duration(milliseconds: 2000),
                snackPosition: SnackPosition.TOP,
                borderRadius: 15,
              ),
            );
            return;
          }

          if (!res.hasErrors) {
            Get.offAllNamed('/home');
            await taskController.getAllTasks();
          }
          Get.showSnackbar(
            GetSnackBar(
              titleText: Text(
                'Message',
                style: TextStyles.w800(16),
              ),
              messageText: Text(
                res.message,
                style: TextStyles.w500(14),
              ),
              backgroundColor: !res.hasErrors
                  ? const Color(0xffA0D995)
                  : const Color(0xffEB5353),
              duration: const Duration(milliseconds: 2000),
              snackPosition: SnackPosition.TOP,
              borderRadius: 15,
            ),
          );
        },
      ),
      body: SingleChildScrollView(
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
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
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
                          task!.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
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
                        onChanged: (value) =>
                            setState(() => task!.isCompleted = value!),
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
                title: 'Due date',
                extraWidget: CustomButtonWidget(
                  text: 'Select date',
                  color: accent,
                  onPress: () {},
                ),
                icon: Icons.date_range_rounded,
              ),
              TaskDataWidget(
                title: 'Description',
                subTitle: task!.description ?? 'No description',
                icon: Icons.text_snippet_rounded,
                canEdit: true,
                onSummitCallback: (value) =>
                    setState(() => task!.description = value),
              ),
              TaskDataWidget(
                title: 'Comments',
                subTitle: task!.comments ?? 'No comments',
                icon: Icons.comment,
                canEdit: true,
                onSummitCallback: (value) =>
                    setState(() => task!.comments = value),
              ),
              TaskDataWidget(
                title: 'Tags',
                subTitle: task!.tags == null ? 'No tags' : null,
                extraWidget: task!.tags == null
                    ? null
                    : Chip(
                        label: Text(task!.tags!),
                        labelStyle: TextStyles.w500(12),
                        backgroundColor: middleGrey.withOpacity(0.25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                icon: Icons.tag,
                canEdit: true,
                onSummitCallback: (value) => setState(() => task!.tags = value),
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
    );
  }
}
