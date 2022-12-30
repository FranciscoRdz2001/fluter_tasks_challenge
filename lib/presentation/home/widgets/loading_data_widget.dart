import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/text_styles.dart';

class LoadingDataWidget extends StatelessWidget {
  final Color fontColor;
  const LoadingDataWidget({
    super.key,
    this.fontColor = middleGrey,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Column(
      children: [
        SizedBox(height: resp.hp(2)),
        const CircularProgressIndicator(color: darkAccent),
        SizedBox(height: resp.hp(2)),
        Text('Loading data...', style: TextStyles.w500(20, fontColor)),
      ],
    );
  }
}
