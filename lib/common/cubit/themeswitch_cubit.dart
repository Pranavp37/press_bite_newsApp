import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  void thmeSwich() {
    emit(!state);
  }
}


  // void themeSwithth() {
  //   if (state == ThemeData.light()) {
  //     emit(ThemeData.dark());
  //   } else {
  //     emit(ThemeData.light());
  //   }
  // }
