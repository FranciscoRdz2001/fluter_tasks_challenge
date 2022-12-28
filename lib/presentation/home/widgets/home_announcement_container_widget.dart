import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/config/text_styles.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';

class HomeAnnouncementContainerWidget extends StatelessWidget {
  const HomeAnnouncementContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Container(
      height: resp.hp(30),
      width: resp.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: containersBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: resp.wp(2.5),
                    left: resp.wp(2.5),
                    top: resp.hp(1.25),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: accentGradient,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have 5 pending tasks',
                      style: TextStyles.w500(18),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
