part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  
  const HomeInitial();
  @override
  List<Object> get props => [];
}

class HomeFilterChanged extends HomeState{
  final int currentIndex;

  const HomeFilterChanged(this.currentIndex);
  
  @override
  List<Object> get props => [currentIndex];

}

class HomeAllItens extends HomeState{
  final List<Item> list;
  HomeAllItens(this.list);
  @override
  List<Object> get props => [list];
  
}

class HomeLoading extends HomeState{
  const HomeLoading();
  @override
  List<Object> get props => [];

}

class HomeFilteredByCoffe extends HomeState{
  final List<Item> list;
  
  const HomeFilteredByCoffe(this.list);
  @override
  List<Object> get props => [list];
}

class HomeFilteredByTea extends HomeState{
  final List<Item> list;
  const HomeFilteredByTea(this.list);
  
  @override
  List<Object> get props => [list];

}