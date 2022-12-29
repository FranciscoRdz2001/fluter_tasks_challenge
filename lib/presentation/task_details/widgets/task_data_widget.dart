import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/text_styles.dart';

class TaskDataWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? extraWidget;
  final IconData icon;
  final bool canEdit;
  final bool isRequiredToSave;
  const TaskDataWidget({
    super.key,
    required this.title,
    required this.icon,
    this.subTitle,
    this.extraWidget,
    this.canEdit = false,
    this.isRequiredToSave = false,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: middleGrey),
            SizedBox(width: resp.wp(5)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: title,
                      style: TextStyles.w700(16),
                      children: [
                        TextSpan(
                          text: isRequiredToSave ? ' *' : null,
                          style: TextStyles.w700(
                            16,
                            Colors.red.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (subTitle != null) ...[
                    SizedBox(height: resp.hp(0.5)),
                    Text(
                      subTitle!,
                      style: TextStyles.w500(14, grey),
                    ),
                  ],
                  if (extraWidget != null) ...[
                    SizedBox(height: resp.hp(0.5)),
                    extraWidget!,
                  ],
                ],
              ),
            ),
            if (canEdit) const Icon(Icons.edit, color: middleGrey),
          ],
        ),
        SizedBox(height: resp.hp(3)),
      ],
    );
  }
}
