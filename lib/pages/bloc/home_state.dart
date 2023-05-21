import 'package:equatable/equatable.dart';
import 'package:imdb_app/shared/models/filme_model.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}

class HomeStateLoaded extends HomeState {
  final List<FilmModel> list;

  HomeStateLoaded({required this.list});
}

class HomeStateEmptyList extends HomeState {
  final List<FilmModel> list;
  HomeStateEmptyList({required this.list});
}
