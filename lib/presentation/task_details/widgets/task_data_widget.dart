import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/utils/dialogs_util.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/config/text_styles.dart';

class TaskDataWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool canEdit;
  final bool isRequiredToSave;
  final String? subTitle;
  final String? originalValue;
  final Widget? extraWidget;
  final bool hideSubtitle;
  final void Function(String)? onSummitCallback;
  const TaskDataWidget({
    super.key,
    required this.title,
    required this.icon,
    this.subTitle,
    this.extraWidget,
    this.onSummitCallback,
    this.originalValue,
    this.canEdit = false,
    this.isRequiredToSave = false,
    this.hideSubtitle = false,
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
                  if (!hideSubtitle) ...[
                    SizedBox(height: resp.hp(0.5)),
                    Text(
                      subTitle == null || subTitle!.isEmpty
                          ? 'No $title'
                          : subTitle!,
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
            if (canEdit)
              IconButton(
                highlightColor: lightGrey.withOpacity(0.8),
                splashColor: accent.withOpacity(0.25),
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.edit, color: accent),
                onPressed: () {
                  DialogsUtil.withTextField(
                    title: title,
                    initialText: originalValue ?? '',
                    onSummitCallback: onSummitCallback,
                  );
                },
              ),
          ],
        ),
        SizedBox(height: resp.hp(3)),
      ],
    );
  }
}
