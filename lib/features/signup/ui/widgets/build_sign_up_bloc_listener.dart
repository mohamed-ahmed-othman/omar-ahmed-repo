import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop/core/helpers/extintions.dart';
import 'package:oop/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:oop/features/signup/logic/cubit/sign_up_state.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/styles.dart';

class BuildSignUpBlocListener extends StatelessWidget {
  const BuildSignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupError,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            showDialog(
              context: context,
              builder: (context) => const CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),
            );
          },
          signupSuccess: (data) {
            context.pop();
            showSuccessDialog(context);
          },
          signupError: (error) {
            setUpErrorState(context, error);
          },
        );
      },
      child: Container(),
    );
  }

  void setUpErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        title: const Text('Error'),
        content: Text(
          error,
          style: TextStyles.font14darkbluemeduim,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Got It'),
          ),
        ],
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                disabledForegroundColor: Colors.grey,
              ),
              onPressed: () {
                context.pushNamed(Routes.loginScreen);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }
}
