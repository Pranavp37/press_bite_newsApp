import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domin/entities/article_entity.dart';
import 'package:news_app/domin/usecases/getsearch_news_usecase.dart';
import 'package:news_app/service_locator.dart';

part 'getsearchnews_event.dart';
part 'getsearchnews_state.dart';

class GetsearchnewsBloc extends Bloc<GetsearchnewsEvent, GetsearchnewsState> {
  GetsearchnewsBloc() : super(GetsearchnewsInitial()) {
    on<Getsearchnews>((event, emit) async {
      emit(GetsearchnewsLoading());
      try {
        List<ArticleEntity> data =
            await s1<GetsearchNewsUsecase>().call(parms: event.inputText);
        emit(GetsearchnewsSucces(newsData: data));
      } catch (e) {
        log(e.toString());
        emit(GetsearchnewsFailed(error: e.toString()));
      }
    });
  }
}
