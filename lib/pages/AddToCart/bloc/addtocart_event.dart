part of 'addtocart_bloc.dart';

abstract class AddtocartEvent extends Equatable {
  const AddtocartEvent();

}

class IncrementValue extends AddtocartEvent{
  final int value;

  IncrementValue({this.value});
  
  @override
  List<Object> get props => [value];
  
}


class DecrementValue extends AddtocartEvent{
  final int value;

  DecrementValue({this.value});
  
  @override
  List<Object> get props => [value];
  
}