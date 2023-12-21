part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<NewsItem> news;

  HomeLoadedSuccessState({required this.news,});
}

class HomeErrorState extends HomeState{}
