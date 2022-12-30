import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../presentation/home/widgets/error_getting_data_widget.dart';
import '../../presentation/home/widgets/loading_data_widget.dart';
import '../../presentation/task_details/widgets/custom_text_form_field_widget.dart';
import '../config/app_colors.dart';
import '../config/text_styles.dart';

class DialogsUtil {
  static Future withActions({
    required String firstText,
    required List<Widget> actions,
    String? coloredText,
    String? finalText,
    bool? withImage = true,
  }) {
    return Get.defaultDialog(
      titlePadding: const EdgeInsets.only(top: 20),
      title: '',
      actions: actions,
      content: Column(
        children: [
          if (withImage != null && withImage) ...[
            Container(
              decoration: const BoxDecoration(
                color: containersBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Image.asset('assets/images/delete_task.png'),
            ),
            const SizedBox(height: 20),
          ],
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: firstText,
              style: TextStyles.w500(16),
              children: [
                TextSpan(
                  text: ' $coloredText ',
                  style: TextStyles.w800(16, accent),
                ),
                TextSpan(
                  text: finalText,
                  style: TextStyles.w500(16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> loading() {
    return Get.defaultDialog(
      titlePadding: const EdgeInsets.only(top: 20),
      barrierDismissible: false,
      title: '',
      content: const LoadingDataWidget(
        showImage: false,
        fontColor: grey,
      ),
    );
  }

  static Future<void> error() {
    return Get.defaultDialog(
      titlePadding: const EdgeInsets.only(top: 20),
      title: '',
      content: const ErrorGettingDataWidget(
        fontColor: grey,
        showSubtitle: false,
      ),
    );
  }

  static Future<void> withTextField({
    required String title,
    required String initialText,
    void Function(String)? onSummitCallback,
  }) {
    return Get.defaultDialog(
      titlePadding: const EdgeInsets.only(top: 20),
      title: 'Set $title',
      titleStyle: TextStyles.w500(14, grey),
      content: Column(
        children: [
          CustomTextFormFieldWidget(
            initialText: initialText,
            label: title,
            maxLines: 5,
            onAcceptCallback: (value) {
              Get.back();
              if (onSummitCallback != null) {
                onSummitCallback(value);
              }
            },
          )
        ],
      ),
    );
  }
}
