import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/text_styles.dart';

class CustomCheckboxWithLabelWidget extends StatelessWidget {
  final void Function(bool?) onPress;
  final bool isSelected;
  const CustomCheckboxWithLabelWidget({
    super.key,
    required this.isSelected,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Row(
      children: [
        SizedBox(
          height: resp.hp(2.5),
          width: resp.wp(5),
          child: Checkbox(
            activeColor: accent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            value: isSelected,
            onChanged: onPress,
          ),
        ),
        SizedBox(width: resp.wp(1)),
        Text(
          isSelected ? 'Completed' : 'Not completed',
          style: TextStyles.w500(14, grey),
        ),
      ],
    );
  }
}
