import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:flutter_tasks_challenge/app/config/text_styles.dart';
import 'package:flutter_tasks_challenge/app/utils/responsive_util.dart';
import 'package:flutter_tasks_challenge/presentation/home/data/models/tab_model.dart';

class HomeTabBarWidget extends StatelessWidget {
  final List<TabModel> tabs;
  const HomeTabBarWidget({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    return SizedBox(
      height: resp.hp(5),
      width: resp.width,
      child: Row(
        children: [
          ...List.generate(
            tabs.length,
            (x) {
              final TabModel tab = tabs[x];
              final bool isSelected = tab.isSelected;
              final bool isFinalElement = x == tabs.length - 1;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: isFinalElement ? 0 : resp.wp(2),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          tab.name,
                          style: TextStyles.w600(
                            16,
                            isSelected ? black : grey.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(height: resp.hp(0.5)),
                        Container(
                          height: resp.hp(0.8),
                          decoration: BoxDecoration(
                            color: isSelected ? accent : lightGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
