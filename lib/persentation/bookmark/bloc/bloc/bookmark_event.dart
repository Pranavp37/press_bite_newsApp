part of 'bookmark_bloc.dart';

@immutable
sealed class BookmarkEvent {}

class GetnewsDataEvent extends BookmarkEvent {}

class DelectdataFrommSqfliteEvent extends BookmarkEvent {
  final int id;
  DelectdataFrommSqfliteEvent({required this.id});
}
