part of 'addtocart_bloc.dart';

abstract class AddtocartState extends Equatable {
  const AddtocartState();
}

class AddtocartInitial extends AddtocartState {
  @override
  List<Object> get props => [];
}

class AmountChanged extends AddtocartState{
  final int value;

  AmountChanged(this.value);

  @override
  List<Object> get props => [];

}

class ValueIncremented extends AddtocartState{
  final int value;

  ValueIncremented(this.value);
  
  @override
  List<Object> get props => [value];
  
}

class ValueDecremented extends AddtocartState{
  final int value;

  ValueDecremented(this.value);
  
  @override
  List<Object> get props => [value];
  
}