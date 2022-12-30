import 'package:flutter/material.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/text_styles.dart';

class TagChipWidget extends StatelessWidget {
  final String title;
  const TagChipWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(title),
      labelStyle: TextStyles.w500(12),
      backgroundColor: middleGrey.withOpacity(0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
