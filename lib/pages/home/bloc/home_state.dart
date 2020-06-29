part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState{
  const HomeLoading();
  @override
  List<Object> get props => [];

}

class HomeFilteredByCoffe extends HomeState{
  const HomeFilteredByCoffe();
  @override
  List<Object> get props => [];
}

class HomeFilteredByTea extends HomeState{
  const HomeFilteredByTea();
  
  @override
  List<Object> get props => [];

}