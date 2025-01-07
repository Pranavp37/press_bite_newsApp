import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/model/user_model.dart';
import 'package:news_app/domin/usecases/getuserdata_usecase.dart';
import 'package:news_app/service_locator.dart';

part 'get_user_data_event.dart';
part 'get_user_data_state.dart';

class GetUserDataBloc extends Bloc<GetUserDataEvent, GetUserDataState> {
  GetUserDataBloc() : super(GetUserDataInitial()) {
    on<GetUserDataEvent>((event, emit) async {
      emit(GetUserLoading());
      try {
        var data = await s1<GetuserdataUsecase>().call();
        emit(GetUserDataLoaded(model: data!));
      } catch (e) {
        emit(GetUserDataError(error: e.toString()));
      }
    });
  }
}
