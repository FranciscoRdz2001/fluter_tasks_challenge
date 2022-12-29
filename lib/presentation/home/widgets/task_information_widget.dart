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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: resp.hp(1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Title:', style: TextStyles.w700(16)),
          Text(task.title, style: TextStyles.w500(14, grey)),
          SizedBox(height: resp.hp(1)),
          RichText(
            text: TextSpan(
              text: 'Expires in: \n',
              style: TextStyles.w700(16),
              children: List.generate(
                time.length,
                (x) {
                  if (time[x].isNotEmpty && x < time.length - 1) {
                    time[x] += ', ';
                  }
                  return TextSpan(
                    text: time[x],
                    style: TextStyles.w500(14, grey),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
