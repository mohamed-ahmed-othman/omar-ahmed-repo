import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop/core/helpers/app_regex.dart';
import 'package:oop/features/signup/logic/cubit/sign_up_cubit.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/widgets/build_general_text_form_field.dart';
import '../../../../core/widgets/password_validations.dart';

class AllTextFormFieldInScreen extends StatefulWidget {
  const AllTextFormFieldInScreen({super.key});

  @override
  State<AllTextFormFieldInScreen> createState() =>
      _AllTextFormFieldInScreenState();
}

class _AllTextFormFieldInScreenState extends State<AllTextFormFieldInScreen> {
  bool isObscure = true;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setUpPasswordControllerListenerForSignUp();
  }

  void setUpPasswordControllerListenerForSignUp() {
    passwordController.addListener(() => setState(() {
          final password = passwordController.text;
          hasLowercase = AppRegex.hasLowercase(password);
          hasMinLength = AppRegex.hasMinLength(password);
          hasNumber = AppRegex.hasNumber(password);
          hasSpecialCharacters = AppRegex.hasSpecialCharacters(password);
          hasUppercase = AppRegex.hasUppercase(password);
        }));
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          BuildGeneralTextFormField(
            hintText: "Name",
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().length <= 3) {
                return "Please enter a valid name";
              }
            },
          ),
          verticalSpace(20),
          BuildGeneralTextFormField(
            hintText: "Phone Number",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.hasNumber(value)) {
                return "Please enter a valid phone number";
              }
              return null;
            },
          ),
          verticalSpace(20),
          BuildGeneralTextFormField(
            //  controller: context.read<SignUpCubit>().,
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
            controller: context.read<SignUpCubit>().passwordController,
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
                return 'Please enter valid password';
              }
              return null;
            },
          ),
          BuildGeneralTextFormField(
            controller: context.read<SignUpCubit>().confirmPasswordController,
            hintText: 'Confirm password',
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
              if (value == null ||
                  value.isEmpty ||
                  value !=
                      context.read<SignUpCubit>().passwordController.text) {
                return 'Please enter the same password';
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
