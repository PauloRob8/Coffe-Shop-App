part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class LoadItems extends HomeEvent{
 
}

class ChangePageFilter extends HomeEvent{
  final int index;

  const ChangePageFilter({this.index});
  
}

class LikeItem extends HomeEvent{
  final bool liked;

  LikeItem(this.liked);

}