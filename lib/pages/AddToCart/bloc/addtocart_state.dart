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
  List<Object> get props => [value];
  
}



class SizeChanged extends AddtocartState{

  final String size;

  SizeChanged(this.size);
  
  @override
  List<Object> get props => [size];

}

class FlavorChanged extends AddtocartState{

  final String flavor;

  FlavorChanged(this.flavor);
  
  @override
  List<Object> get props => [flavor];

}

class ToppingChanged extends AddtocartState{

  final String topping;

  ToppingChanged(this.topping);
  
  @override
  List<Object> get props => [topping];

}