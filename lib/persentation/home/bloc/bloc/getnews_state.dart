part of 'getnews_bloc.dart';

@immutable
sealed class GetnewsState {}

final class GetnewsInitial extends GetnewsState {}

final class GetnewsLoading extends GetnewsState {}

final class GetnewsSuccess extends GetnewsState {
  final List<ArticleEntity> newsData;
  GetnewsSuccess({required this.newsData});
}

final class GetnewsFailed extends GetnewsState {
  final String error;
  
  GetnewsFailed({required this.error});
}
