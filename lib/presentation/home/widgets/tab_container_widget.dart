import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/types/tabs_types.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/presentation/home/data/models/tab_model.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/text_styles.dart';

class TabContainerWidget extends StatelessWidget {
  final TabModel tab;
  final double rightPadding;
  final bool isSelected;
  const TabContainerWidget({
    super.key,
    required this.tab,
    required this.rightPadding,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Padding(
      padding: EdgeInsets.only(
        right: rightPadding,
      ),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              tab.type.convertToText(),
              style: TextStyles.w600(
                16,
                isSelected ? black : grey.withOpacity(0.5),
              ),
            ),
            SizedBox(height: resp.hp(0.5)),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: resp.hp(0.8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: isSelected
                    ? accentGradient
                    : const LinearGradient(colors: [lightGrey, lightGrey]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
