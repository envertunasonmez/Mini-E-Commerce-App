import 'package:flutter/material.dart';
import 'package:mini_e_commerce_app/core/constants/color_constants.dart';
import 'package:mini_e_commerce_app/core/theme/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 48,
    this.borderRadius = 12,
    this.backgroundColor = Colors.blue,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          title,
          style:
              textStyle ??
              AppTextStyles.bodyLarge.copyWith(
                color: ColorConstants.whiteColor,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
    );
  }
}
