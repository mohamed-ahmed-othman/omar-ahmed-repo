import 'package:flutter/material.dart';
import 'package:oop/core/helpers/spaces.dart';
import 'package:oop/core/theming/colors_manager.dart';
import 'package:oop/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least one lowercase letter', hasLowercase),
        verticalSpace(2),
        buildValidationRow('At least one upercase letter', hasUppercase),
        verticalSpace(2),
        buildValidationRow(
            'At least one specialsharacters', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least one number letter', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 8 character long', hasMinLength),
        verticalSpace(2),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.myGray,
        ),
        horizontalSpace(8),
        Text(
          text,
          style: TextStyles.font14darkbluemeduim.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.myGray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
