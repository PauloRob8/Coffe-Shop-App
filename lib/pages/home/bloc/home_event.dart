part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}


class AppStarted extends HomeEvent{
  @override
  List<Object> get props => [];
  
}


class ChangePageFilter extends HomeEvent{
  final int index;

  const ChangePageFilter({this.index});

  @override
  List<Object> get props => [index];
  
}

class LikeItem extends HomeEvent{
  final bool liked;

  LikeItem(this.liked);
  
  @override
  List<Object> get props => [liked];

}