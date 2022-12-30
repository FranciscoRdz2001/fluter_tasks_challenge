import 'package:flutter/widgets.dart';
import 'package:flutter_tasks_challenge/app/config/app_colors.dart';
import 'package:get/route_manager.dart';

import '../config/text_styles.dart';

class SnackBarsUtil {
  static void forStatus({
    required String message,
    required bool hasError,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        titleText: Text(
          'Message',
          style: TextStyles.w800(16),
        ),
        messageText: Text(
          message,
          style: TextStyles.w500(14),
        ),
        backgroundColor: hasError ? red : green,
        duration: const Duration(milliseconds: 2000),
        snackPosition: SnackPosition.TOP,
        borderRadius: 15,
      ),
    );
  }
}
