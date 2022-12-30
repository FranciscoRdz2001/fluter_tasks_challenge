import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/text_styles.dart';
import 'custom_text_form_field_widget.dart';

class TaskDataWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? extraWidget;
  final IconData icon;
  final bool canEdit;
  final bool isRequiredToSave;
  final void Function(String)? onSummitCallback;
  const TaskDataWidget({
    super.key,
    required this.title,
    required this.icon,
    this.subTitle,
    this.extraWidget,
    this.canEdit = false,
    this.isRequiredToSave = false,
    this.onSummitCallback,
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
            if (canEdit)
              IconButton(
                highlightColor: lightGrey.withOpacity(0.8),
                splashColor: accent.withOpacity(0.25),
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.edit, color: accent),
                onPressed: () {
                  Get.defaultDialog(
                    titlePadding: EdgeInsets.only(top: resp.hp(2)),
                    title: 'Set $title',
                    titleStyle: TextStyles.w500(14, grey),
                    content: Column(
                      children: [
                        CustomTextFormFieldWidget(
                          initialText: subTitle ?? '',
                          label: title,
                          maxLines: 5,
                          onAcceptCallback: (value) {
                            Get.back();
                            if (onSummitCallback != null) {
                              onSummitCallback!(value);
                            }
                          },
                        )
                      ],
                    ),
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
