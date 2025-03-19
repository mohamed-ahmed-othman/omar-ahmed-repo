import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop/core/helpers/app_regex.dart';
import 'package:oop/core/helpers/spaces.dart';
import 'package:oop/core/widgets/password_validations.dart';

import '../../logic/cubit/login_cubit.dart';
import '../../../../core/widgets/build_general_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscure = true;
  late TextEditingController passwordController;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        final password = passwordController.text;
        hasLowercase = AppRegex.hasLowercase(password);
        hasUppercase = AppRegex.hasUppercase(password);
        hasSpecialCharacters = AppRegex.hasSpecialCharacters(password);
        hasNumber = AppRegex.hasNumber(password);
        hasMinLength = AppRegex.hasMinLength(password);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          BuildGeneralTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'Email',
            validator: (String? value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(20),
          BuildGeneralTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          verticalSpace(20),
          PasswordValidations(
            hasLowercase: hasLowercase,
            hasUppercase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
