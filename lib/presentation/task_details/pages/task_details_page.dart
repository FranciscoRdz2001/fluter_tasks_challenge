import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/app/utils/snackbars_util.dart';
import 'package:flutter_tasks_challenge/data/network/models/task_model.dart';
import 'package:flutter_tasks_challenge/presentation/home/controllers/tasks_controller.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/custom_button_widget.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import '../widgets/widgets.dart';

class TaskDetailsPage extends StatefulWidget {
  final TaskModel? task;
  const TaskDetailsPage({
    super.key,
    this.task,
  });

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  late final TaskModel task;
  late final bool isEditingMode;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      task = widget.task!;
      return;
    }
    final arguments = Get.arguments;
    isEditingMode = arguments != null;
    task = arguments ?? TaskModel(id: -1, title: '', isCompleted: false);
  }

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
          final res = await (isEditingMode
              ? taskController.editTask(task)
              : taskController.createTask(task));

          if (res == null) {
            SnackBarsUtil.forStatus(
              message: 'Error interno en la aplicación.',
              hasError: true,
            );
            return;
          }

          if (!res.hasErrors) {
            Get.offAllNamed('/home');
            await taskController.getAllTasks();
          }
          SnackBarsUtil.forStatus(
            message: res.message,
            hasError: res.hasErrors,
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
              TaskDetailsHeaderWidget(
                title: task.title,
                onNameChangedCallback: (t) => setState(() => task.title = t),
              ),
              SizedBox(height: resp.hp(5)),
              TaskDataWidget(
                title: 'Status',
                isRequiredToSave: true,
                hideSubtitle: true,
                icon: Icons.check,
                extraWidget: CustomCheckboxWithLabelWidget(
                  isSelected: task.isCompleted,
                  onPress: (value) => setState(() => task.isCompleted = value!),
                ),
              ),
              TaskDataWidget(
                title: 'Due date',
                subTitle: task.getDate(),
                icon: Icons.date_range_rounded,
                extraWidget: CustomButtonWidget(
                  text: 'Select date',
                  color: accent,
                  onPress: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate == null) return;
                    setState(() {
                      task.dueDate = pickedDate;
                    });
                  },
                ),
              ),
              TaskDataWidget(
                title: 'Description',
                subTitle: task.description,
                originalValue: task.description,
                icon: Icons.text_snippet_rounded,
                canEdit: true,
                onSummitCallback: (value) =>
                    setState(() => task.description = value),
              ),
              TaskDataWidget(
                title: 'Comments',
                subTitle: task.comments,
                originalValue: task.comments,
                icon: Icons.comment,
                canEdit: true,
                onSummitCallback: (value) =>
                    setState(() => task.comments = value),
              ),
              TaskDataWidget(
                title: 'Tags',
                subTitle: task.tags == null ? 'No Tags' : null,
                hideSubtitle: task.tags != null,
                originalValue: task.tags,
                icon: Icons.tag,
                canEdit: true,
                extraWidget:
                    task.tags == null ? null : TagChipWidget(title: task.tags!),
                onSummitCallback: (value) => setState(() => task.tags = value),
              ),
              if (task.createdAt != null)
                TaskDataWidget(
                  title: 'Creation date',
                  icon: Icons.date_range_rounded,
                  subTitle: task.createdAt == null
                      ? 'No date'
                      : DateFormat.yMMMEd().format(task.createdAt!),
                ),
              if (task.updatedAt != null)
                TaskDataWidget(
                  title: 'Last update',
                  icon: Icons.date_range_rounded,
                  subTitle: task.updatedAt == null
                      ? 'No date'
                      : DateFormat.yMMMEd().format(task.updatedAt!),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
