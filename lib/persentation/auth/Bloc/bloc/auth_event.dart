part of 'auth_bloc.dart';

class AuthEvent {}

class AuthSignUpEvent extends AuthEvent {
  UserModel userModel;
  AuthSignUpEvent({required this.userModel});
}

class AuthSignInEvent extends AuthEvent {
  UserModel userModel;
  AuthSignInEvent({required this.userModel});
}
