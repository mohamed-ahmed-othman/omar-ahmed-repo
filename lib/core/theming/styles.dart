import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oop/core/theming/colors_manager.dart';

class TextStyles {
  static TextStyle font24black700weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle font20black700weight = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle font18black700weight = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle font16white600weight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle font14grayregular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.myGray,
  );
  static TextStyle font32bluebold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.normal,
    color: ColorsManager.mainBlue,
  );
}
