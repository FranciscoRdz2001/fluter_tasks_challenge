import 'package:flutter/material.dart';
import 'package:flutter_tasks_challenge/app/config/text_styles.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color color;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        backgroundColor: MaterialStateColor.resolveWith((states) => color),
      ),
      child: Text(text, style: TextStyles.w500(14, Colors.white)),
    );
  }
}
