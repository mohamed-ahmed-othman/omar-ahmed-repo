import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oop/core/helpers/extintions.dart';
import 'package:oop/core/routing/routes.dart';
import 'package:oop/core/theming/styles.dart';

class DontHaveAnAcount extends StatelessWidget {
  const DontHaveAnAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Dont have an account? ',
            style: TextStyles.font14darkbluemeduim,
          ),
          TextSpan(
              text: 'Sign Up',
              style: TextStyles.font14mainBlue,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.signUpScreen);
                }),
        ],
      ),
    );
  }
}
