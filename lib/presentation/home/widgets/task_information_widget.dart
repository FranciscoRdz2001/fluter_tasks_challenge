import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';

import '../../../app/config/text_styles.dart';

class TaskInformationWidget extends StatelessWidget {
  const TaskInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: resp.hp(1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Test Task Title', style: TextStyles.w700(16)),
          SizedBox(height: resp.hp(1)),
          Text('Expires in: ', style: TextStyles.w500(14)),
        ],
      ),
    );
  }
}
