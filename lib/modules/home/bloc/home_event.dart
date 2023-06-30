part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeEventStarted extends HomeEvent {}

class HomeEventSubmit extends HomeEvent {
  HomeEventSubmit({this.name, this.description, this.imageUrl});
  final String? name;
  final String? description;
  final String? imageUrl;
}
