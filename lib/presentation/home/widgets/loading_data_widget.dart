import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/text_styles.dart';

class LoadingDataWidget extends StatelessWidget {
  const LoadingDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Column(
      children: [
        SizedBox(height: resp.hp(2)),
        const CircularProgressIndicator(color: darkAccent),
        SizedBox(height: resp.hp(1)),
        Text('Loading data...', style: TextStyles.w500(20, middleGrey)),
        Opacity(
          opacity: 0.25,
          child: Image.asset(
            'assets/images/jelly-monster-running-on-loading-bar.png',
          ),
        ),
      ],
    );
  }
}
