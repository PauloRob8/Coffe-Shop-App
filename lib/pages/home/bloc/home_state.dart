part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  
  const HomeInitial();
  @override
  List<Object> get props => [];
}

class FilteredItems extends HomeState{
  final int currentIndex;
  final List<Item> items;
  const FilteredItems(this.currentIndex,this.items);
  
  @override
  List<Object> get props => [currentIndex,items];

  @override
  String toString() => "$currentIndex\n$items";
  
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

class ItemLiked extends HomeState{
  final bool liked;

  ItemLiked(this.liked);
  
  @override
  List<Object> get props => [liked];
  
}