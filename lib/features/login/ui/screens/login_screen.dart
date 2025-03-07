import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oop/core/helpers/spaces.dart';
import 'package:oop/core/theming/styles.dart';
import 'package:oop/features/login/ui/widgets/build_general_text_button.dart';
import 'package:oop/features/login/ui/widgets/build_general_text_form_field.dart';
import 'package:oop/features/onBoarding/widgets/already_have_an_acount_text.dart';
import 'package:oop/features/onBoarding/widgets/terms_and_conditional_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscure = true;
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const BuildGeneralTextFormField(
                        hintText: 'Email',
                      ),
                      verticalSpace(20),
                      BuildGeneralTextFormField(
                        hintText: 'Password',
                        isobscureText: isObscure,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ),
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
                        onPressed: () {},
                        buttonTextStyle: TextStyles.font16mainBlueWhitesemibold,
                      ),
                      verticalSpace(16),
                      const TermsAndConditionalText(),
                      verticalSpace(60),
                      const AlreadyHaveAnAcountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
