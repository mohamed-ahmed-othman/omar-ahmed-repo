import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oop/core/widgets/build_general_text_button.dart';
import 'package:oop/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:oop/features/signup/ui/widgets/all_text_form_field_in_screen.dart';
import 'package:oop/features/signup/ui/widgets/already_have_an_account.dart';
import 'package:oop/features/signup/ui/widgets/build_sign_up_bloc_listener.dart';
import 'package:oop/features/signup/ui/widgets/terms_and_conditional_text_for_sign_up.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/theming/styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24bluebold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14grayregular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const AllTextFormFieldInScreen(),
                    BuildGeneralTextButton(
                      buttonText: "Create Account",
                      onPressed: () => validateThenDoSignUp(context),
                      buttonTextStyle: TextStyles.font16mainBlueWhitesemibold,
                    ),
                    verticalSpace(16),
                    const TermsAndConditionalTextForSignUp(),
                    verticalSpace(25),
                    const AlreadyHaveAnAccount(),
                    const BuildSignUpBlocListener(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpstate();
    }
  }
}
