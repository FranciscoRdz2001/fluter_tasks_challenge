import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/utils/dialogs_util.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/text_styles.dart';

class TaskDetailsHeaderWidget extends StatelessWidget {
  final void Function(String) onNameChangedCallback;
  final String title;
  const TaskDetailsHeaderWidget({
    super.key,
    required this.title,
    required this.onNameChangedCallback,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Center(
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              splashColor: accent,
              highlightColor: lightGrey,
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: accent,
              ),
              onPressed: () => Get.back(),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: resp.hp(1),
                horizontal: resp.wp(1),
              ),
              decoration: BoxDecoration(
                color: lightGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                title.isEmpty ? 'No title' : title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyles.w800(20),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              splashColor: accent,
              highlightColor: lightGrey,
              icon: const Icon(
                Icons.edit,
                color: accent,
              ),
              onPressed: () => DialogsUtil.withTextField(
                title: 'Title',
                initialText: title,
                onSummitCallback: onNameChangedCallback,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
