import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domin/entities/article_entity.dart';
import 'package:news_app/domin/usecases/getnews_usecase.dart';
import 'package:news_app/service_locator.dart';

part 'getnews_event.dart';
part 'getnews_state.dart';

class GetnewsBloc extends Bloc<GetnewsEvent, GetnewsState> {
  GetnewsBloc() : super(GetnewsInitial()) {
    on<GetnewsfechedEvent>((event, emit) async {
      emit(GetnewsLoading());
      try {
        List<ArticleEntity> data = await s1<GetnewsUsecase>().call();
        emit(GetnewsSuccess(newsData: data));
      } catch (e) {
        log('$e');
        emit(GetnewsFailed(error: e.toString()));
      }
    });
  }
}
