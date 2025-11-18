import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:leaptech_plus/features/login/data/models/user_model.dart';
import 'package:leaptech_plus/features/login/data/repo/login_repo_impl.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;
  final LoginRepoImpl _loginRepo;

  Future login() async {
    emit(LoginLoadingState());
    var response = await _loginRepo.login(
        email: emailController.text, password: passwordController.text);
    response.fold(
      (failure) {
        emit(LoginFailureState(failure.errorMessage));
      },
      (user) {
        emit(LoginSuccessState(user));
      },
    );
  }

  void toggleObsecureText() {
    isObsecure = !isObsecure;
    emit(ToggleObsecureTextState());
  }
}
