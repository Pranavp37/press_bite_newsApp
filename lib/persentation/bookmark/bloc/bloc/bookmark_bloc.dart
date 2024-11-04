import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domin/entities/article_entity.dart';
import 'package:news_app/domin/usecases/delectnews_sqflite.dart';
import 'package:news_app/domin/usecases/getnews_sqflite.dart';
import 'package:news_app/service_locator.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(BookmarkInitial()) {
    on<GetnewsDataEvent>((event, emit) async {
      emit(BookmarkLoading());
      try {
        List<ArticleEntity> data = await s1<GetnewsSqfliteUsecase>().call();

        emit(BookmarkSuccess(newsData: data));
      } catch (e) {
        emit(BookmarkFailed(error: e.toString()));
        log(e.toString());
      }
    });
       on<DelectdataFrommSqfliteEvent>((event, emit) {
      try {
        s1<DelectnewsSqfliteUsecase>().call(parms: event.id);
        emit(DelectdataSucces());
      } catch (e) {
        emit(DelectdataFailed(e.toString()));
      }
    });
  }
}
