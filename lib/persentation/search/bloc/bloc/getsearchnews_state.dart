part of 'getsearchnews_bloc.dart';

@immutable
sealed class GetsearchnewsState {}

final class GetsearchnewsInitial extends GetsearchnewsState {}

final class GetsearchnewsLoading extends GetsearchnewsState {}

final class GetsearchnewsSucces extends GetsearchnewsState {
  final List<ArticleEntity> newsData;
  GetsearchnewsSucces({required this.newsData});
}

final class GetsearchnewsFailed extends GetsearchnewsState {
  final String error;
  GetsearchnewsFailed({required this.error});
}
