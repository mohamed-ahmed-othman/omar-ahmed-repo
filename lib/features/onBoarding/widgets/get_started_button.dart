import 'package:flutter/material.dart';
import 'package:oop/core/helpers/extintions.dart';
import 'package:oop/core/routing/routes.dart';
import 'package:oop/core/theming/colors_manager.dart';
import 'package:oop/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorsManager.mainBlue),
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: Text(
        'Get Started',
        style: TextStyles.font16white600weight,
      ),
    );
  }
}
