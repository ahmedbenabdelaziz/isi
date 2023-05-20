part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoded extends LoginState {}

class LoginEnsegniantSuccessed extends LoginState {}

class LoginStudentSuccessed extends LoginState {}

class LoginError extends LoginState {
  final String EmailErrr;
  final String passwordError;
  LoginError({required this.EmailErrr, required this.passwordError});
}

class PasswordError extends LoginState {
  final String passwordError;
  PasswordError({required this.passwordError});}

class EmailError extends LoginState {
  final String EmailErrr;
  EmailError({required this.EmailErrr});}