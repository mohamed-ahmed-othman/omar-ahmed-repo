import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oop/core/theming/colors_manager.dart';
import 'package:oop/core/theming/styles.dart';

class BuildGeneralTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  final TextStyle? style;
  final bool? isobscureText;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final Widget? suffixIcon;
  final String? labelText;
  final bool? isDense;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;

  const BuildGeneralTextFormField(
      {super.key,
      this.contentPadding,
      this.decoration,
      this.style,
      this.isobscureText,
      required this.hintText,
      this.hintStyle,
      this.inputTextStyle,
      this.suffixIcon,
      this.labelText,
      this.isDense,
      this.enabledBorder,
      this.focusedBorder});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isobscureText ?? false,
      decoration: decoration ??
          InputDecoration(
            filled: true,
            fillColor: ColorsManager.moreLightGray,
            hintText: hintText,
            suffixIcon: suffixIcon,
            hintStyle: hintStyle ?? TextStyles.font14lightgrayregular,
            labelText: labelText,
            isDense: isDense ?? true,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: ColorsManager.lighterGray, width: 1.3),
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: ColorsManager.mainBlue, width: 1.3),
                ),
          ),
      style: style ?? TextStyles.font14grayregular,
    );
  }
}
