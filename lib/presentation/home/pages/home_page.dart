import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/config/text_styles.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/home_announcement_container_widget.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/home_tab_bar_widget.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/tasks_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                  gradient: accentGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: resp.wp(7),
                    vertical: resp.hp(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: resp.hp(4)),
                      Text(
                        'Tasks challenge',
                        style: TextStyles.w800(35, Colors.white),
                      ),
                      SizedBox(height: resp.hp(12.5)),
                      const HomeAnnouncementContainerWidget(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: resp.wp(7),
              ),
              child: Column(
                children: [
                  SizedBox(height: resp.hp(4)),
                  const HomeTabBarWidget(),
                  SizedBox(height: resp.hp(2)),
                  const TasksListWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
