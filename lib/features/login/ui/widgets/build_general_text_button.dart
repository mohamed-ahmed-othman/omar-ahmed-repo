import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oop/core/theming/colors_manager.dart';

class BuildGeneralTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double? buttonHorizontal;
  final double? buttonVertical;
  final double? buttonFontSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final Color? buttonBackgroundColor;
  final Color? buttonTextColor;
  final FontWeight? buttonFontWeight;
  final double? buttonBorderRadius;
  final double? buttonBorderWidth;
  final Color? buttonBorderColor;
  final TextStyle buttonTextStyle;

  const BuildGeneralTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonHorizontal,
    this.buttonVertical,
    this.buttonFontSize,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonBackgroundColor,
    this.buttonTextColor,
    this.buttonFontWeight,
    this.buttonBorderRadius,
    this.buttonBorderWidth,
    this.buttonBorderColor,
    required this.buttonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
            buttonBackgroundColor ?? ColorsManager.mainBlue),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
              horizontal: buttonHorizontal?.w ?? 12.w,
              vertical: buttonVertical?.h ?? 14.h),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonBorderRadius?.w ?? 16.0),
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
        ),
      ),
      child: Text(
        buttonText,
        style: buttonTextStyle,
      ),
    );
  }
}
