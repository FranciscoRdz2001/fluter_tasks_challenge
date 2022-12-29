import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';

import '../../../app/config/text_styles.dart';

class ErrorGettingDataWidget extends StatelessWidget {
  const ErrorGettingDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Column(
      children: [
        SizedBox(height: resp.hp(1)),
        Opacity(
          opacity: 0.25,
          child: Image.asset(
            'assets/images/not_load.png',
          ),
        ),
        SizedBox(height: resp.hp(1)),
        Text(
          'Error getting data.',
          style: TextStyles.w600(20, middleGrey),
        ),
        Text(
          'Please refresh page',
          style: TextStyles.w500(14, middleGrey),
        ),
        SizedBox(height: resp.hp(1)),
      ],
    );
  }
}
