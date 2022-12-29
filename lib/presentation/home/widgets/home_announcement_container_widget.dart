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
      height: resp.hp(25),
      width: resp.width,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: containersBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Padding(
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
                Positioned(
                  bottom: resp.hp(5),
                  right: resp.wp(5),
                  child: Image.asset('assets/images/has_tasks.png'),
                ),
              ],
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
    );
  }
}
