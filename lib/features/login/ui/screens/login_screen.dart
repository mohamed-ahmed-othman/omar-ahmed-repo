import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oop/core/helpers/spaces.dart';
import 'package:oop/core/theming/styles.dart';
import 'package:oop/features/login/logic/cubit/login_cubit.dart';
import 'package:oop/core/widgets/build_general_text_button.dart';
import 'package:oop/features/login/ui/widgets/dont_have_an_acount.dart';
import 'package:oop/features/login/ui/widgets/terms_and_conditional_text.dart';

import '../widgets/build_bloc_listener.dart';
import '../widgets/email_and_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyles.font24bluebold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14grayregular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpace(20),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        //  textAlign: TextAlign.end,
                        'Forgot Password?',
                        style: TextStyles.font14mainBlue,
                      ),
                    ),
                    verticalSpace(40),
                    BuildGeneralTextButton(
                      buttonText: 'Login',
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                      buttonTextStyle: TextStyles.font16mainBlueWhitesemibold,
                    ),
                    verticalSpace(16),
                    const TermsAndConditionalText(),
                    verticalSpace(60),
                    const DontHaveAnAcount(),
                    const BuildBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}
