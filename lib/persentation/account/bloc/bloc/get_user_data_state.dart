part of 'get_user_data_bloc.dart';

class GetUserDataState {}

class GetUserDataInitial extends GetUserDataState {}

class GetUserLoading extends GetUserDataState {}

class GetUserDataLoaded extends GetUserDataState {
  UserModel model;
  GetUserDataLoaded({required this.model});
}

class GetUserDataError extends GetUserDataState {
  String? error;
  GetUserDataError({this.error});
}
