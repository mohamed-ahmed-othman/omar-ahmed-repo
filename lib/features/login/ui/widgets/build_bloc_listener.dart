import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop/core/helpers/extintions.dart';
import 'package:oop/core/routing/routes.dart';
import 'package:oop/core/theming/colors_manager.dart';
import 'package:oop/core/theming/styles.dart';
import 'package:oop/features/login/logic/cubit/login_cubit.dart';
import 'package:oop/features/login/logic/cubit/login_state.dart';

class BuildBlocListener extends StatelessWidget {
  const BuildBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Error || current is Success,
      listener: (context, state) {
        // if (state is Loading) {
        //   show loading dialog
        // } else if (state is Error) {
        //   show error dialog
        // } else if (state is Success) {
        //   navigate to home screen
        // }
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),
            );
          },
          success: (responseData) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            setUpErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
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
}
