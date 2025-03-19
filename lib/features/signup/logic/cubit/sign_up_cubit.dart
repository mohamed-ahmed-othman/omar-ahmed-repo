import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:oop/features/signup/data/model/sign_up_request_body.dart';
import 'package:oop/features/signup/data/repo/sign_up_repo.dart';
import 'package:oop/features/signup/logic/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  final SignUpRepo signUpRepo;
  SignUpCubit(this.signUpRepo) : super(const SignupState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void emitSignUpstate() async {
    emit(const SignupState.signupLoading());
    final response = await signUpRepo.singUp(SignUpRequestBody(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      phone: phoneNumberController.text,
      gender: 0,
      passwordConfirmation: confirmPasswordController.text,
    ));

    response.when(
      success: (signUpResponse) {
        emit(SignupState.signupSuccess(signUpResponse));
      },
      failure: (error) {
        emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
