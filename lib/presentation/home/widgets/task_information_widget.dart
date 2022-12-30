import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/data/models/task_model.dart';

import '../../../app/config/text_styles.dart';

class TaskInformationWidget extends StatelessWidget {
  final TaskModel task;
  const TaskInformationWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    final time = task.getExpirationTime();
    print(time);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: resp.hp(1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title:', style: TextStyles.w700(16)),
          Text(task.title, style: TextStyles.w500(14, grey)),
          SizedBox(height: resp.hp(1)),
          if (task.description != null) ...[
            Text('Description:', style: TextStyles.w700(16)),
            Text(task.description!, style: TextStyles.w500(14, grey)),
            SizedBox(height: resp.hp(1)),
          ],
          if (task.tags != null) ...[
            Text('Tags:', style: TextStyles.w700(16)),
            Text(task.tags!, style: TextStyles.w500(14, grey)),
            SizedBox(height: resp.hp(1)),
          ],
          Text(
            'Expires in:',
            style: TextStyles.w700(16),
          ),
          Text(
            task.getExpirationTime(),
            style: TextStyles.w500(14, grey),
          ),
        ],
      ),
    );
  }
}
