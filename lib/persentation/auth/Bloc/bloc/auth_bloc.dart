import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/user_model.dart';
import 'package:news_app/domin/usecases/signin_usecase.dart';
import 'package:news_app/domin/usecases/signup_usecase.dart';
import 'package:news_app/service_locator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthSignInInitial()) {
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthSignUpLoading());
      try {
        await s1<SignupUsecase>().call(parms: event.userModel);
        emit(AuthSignUpSuccess());
      } catch (e) {
        emit(AuthSignUpError(error: e.toString()));
      }
    });

    on<AuthSignInEvent>(
      (event, emit) async {
        emit(AuthSignInLoading());
        try {
          await s1<SigninUsecase>().call(parms: event.userModel);
          emit(AuthSignInSuccess());
        } catch (e) {
          emit(
            AuthSignInError(
              error: e.toString(),
            ),
          );
        }
      },
    );
  }
}
