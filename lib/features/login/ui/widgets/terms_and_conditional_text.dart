import 'package:flutter/material.dart';
import 'package:oop/core/theming/styles.dart';

class TermsAndConditionalText extends StatelessWidget {
  const TermsAndConditionalText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By continuing, you agree to our\n',
        style: TextStyles.font12GrayRegular,
        children: [
          TextSpan(
            text: 'Terms & Conditions',
            style: TextStyles.font14darkbluemeduim,
          ),
          TextSpan(
            text: ' and ',
            style: TextStyles.font12GrayRegular,
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyles.font14darkbluemeduim,
          ),
        ],
      ),
    );
  }
}
