import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:oop/core/helpers/extintions.dart';
import 'package:oop/core/routing/routes.dart';

import '../../../../core/theming/styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Already have an account? ',
            style: TextStyles.font14darkbluemeduim,
          ),
          TextSpan(
              text: 'Login',
              style: TextStyles.font14mainBlue,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.loginScreen);
                }),
        ],
      ),
    );
  }
}
