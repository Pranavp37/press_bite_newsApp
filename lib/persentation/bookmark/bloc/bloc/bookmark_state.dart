part of 'bookmark_bloc.dart';

@immutable
sealed class BookmarkState {}

final class BookmarkInitial extends BookmarkState {}

final class BookmarkLoading extends BookmarkState {}

final class BookmarkSuccess extends BookmarkState {
  final List<ArticleEntity> newsData;
  BookmarkSuccess({required this.newsData});
}

final class BookmarkFailed extends BookmarkState {
  final String error;

  BookmarkFailed({required this.error});
}

final class DelectdataSucces extends BookmarkState {
  
}

final class DelectdataFailed extends BookmarkState {
  final String error;
  DelectdataFailed(this.error);
}
