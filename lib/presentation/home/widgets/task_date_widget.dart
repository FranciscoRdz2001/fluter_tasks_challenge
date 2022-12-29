import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';

import '../../../app/config/text_styles.dart';

class TaskDateWidget extends StatelessWidget {
  final String date;
  const TaskDateWidget({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Column(
      children: [
        Text(
          'Due Date',
          style: TextStyles.w700(16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: resp.hp(0.5)),
        Text(
          date,
          textAlign: TextAlign.center,
          style: TextStyles.w500(14, grey),
        ),
      ],
    );
  }
}
