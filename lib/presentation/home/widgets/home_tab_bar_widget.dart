import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/presentation/home/controllers/home_tab_controller.dart';
import 'package:flutter_tasks_challenge/presentation/home/data/models/tab_model.dart';
import 'package:flutter_tasks_challenge/presentation/home/widgets/tab_container_widget.dart';
import 'package:get/get.dart';

class HomeTabBarWidget extends GetView<HomeTabController> {
  const HomeTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return SizedBox(
      height: resp.hp(5),
      width: resp.width,
      child: Obx(
        () => Row(
          children: [
            ...List.generate(
              controller.tabs.length,
              (x) {
                final TabModel tab = controller.tabs[x];
                final bool isSelected = controller.isSelected(tab);
                final bool isFinalElement = x == controller.tabs.length - 1;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => controller.onNewSelection(tab),
                    child: TabContainerWidget(
                      tab: tab,
                      rightPadding: isFinalElement ? 0 : resp.wp(2),
                      isSelected: isSelected,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
