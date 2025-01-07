part of 'auth_bloc.dart';

class AuthState {}

final class AuthSignUpInitial extends AuthState {}

final class AuthSignUpLoading extends AuthState {}

final class AuthSignUpSuccess extends AuthState {}

final class AuthSignUpError extends AuthState {
  String error;
  AuthSignUpError({required this.error});
}

final class AuthSignInInitial extends AuthState {}

final class AuthSignInLoading extends AuthState {}

final class AuthSignInSuccess extends AuthState {}

final class AuthSignInError extends AuthState {
  String error;
  AuthSignInError({required this.error});
}
