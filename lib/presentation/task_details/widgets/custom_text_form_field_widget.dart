import 'package:flutter/material.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/text_styles.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final void Function(String) onAcceptCallback;
  final String initialText;
  final String label;
  final int maxLines;
  late final TextEditingController controller;
  CustomTextFormFieldWidget({
    super.key,
    required this.initialText,
    required this.label,
    required this.maxLines,
    required this.onAcceptCallback,
  }) {
    controller = TextEditingController(text: initialText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: accent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: accent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: accent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        labelText: label,
        labelStyle: TextStyles.w500(14, middleGrey),
      ),
      onFieldSubmitted: (value) {
        onAcceptCallback(value);
      },
    );
  }
}
