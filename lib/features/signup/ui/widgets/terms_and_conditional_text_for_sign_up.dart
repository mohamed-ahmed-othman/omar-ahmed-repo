import 'package:flutter/material.dart';
import 'package:oop/core/theming/styles.dart';

class TermsAndConditionalTextForSignUp extends StatelessWidget {
  const TermsAndConditionalTextForSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By logging, you agree to our\n',
        style: TextStyles.font14grayregular,
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
