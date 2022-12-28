import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:intl/intl.dart';

import '../../../app/config/text_styles.dart';

class TaskDateWidget extends StatelessWidget {
  const TaskDateWidget({super.key});

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
          '${DateFormat.yMMMEd().format(DateTime.now())} ',
          textAlign: TextAlign.center,
          style: TextStyles.w500(14),
        ),
      ],
    );
  }
}
