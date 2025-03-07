import 'package:flutter/material.dart';
import 'package:oop/core/theming/styles.dart';

class AlreadyHaveAnAcountText extends StatelessWidget {
  const AlreadyHaveAnAcountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Already have an account yet? ',
        style: TextStyles.font14darkbluemeduim,
        children: <TextSpan>[
          TextSpan(text: 'Sign Up', style: TextStyles.font14mainBlue),
        ],
      ),
    );
  }
}
