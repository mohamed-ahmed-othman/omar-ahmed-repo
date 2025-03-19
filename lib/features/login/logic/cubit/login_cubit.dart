import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop/features/login/data/models/login_request_body.dart';
import 'package:oop/features/login/data/repository/login_repo.dart';
import 'package:oop/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    ));
    response.when(success: (loginResponseBody) {
      emit(
        LoginState.success(loginResponseBody),
      );
    }, failure: (error) {
      emit(
        LoginState.error(error: error.apiErrorModel.message ?? ''),
      );
    });
  }
}
