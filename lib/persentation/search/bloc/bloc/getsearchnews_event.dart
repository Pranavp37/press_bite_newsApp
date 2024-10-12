part of 'getsearchnews_bloc.dart';

@immutable
sealed class GetsearchnewsEvent {}

class Getsearchnews extends GetsearchnewsEvent {
  final String inputText;
  Getsearchnews({required this.inputText});
}
