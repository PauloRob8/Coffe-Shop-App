part of 'addtocart_bloc.dart';

abstract class AddtocartEvent extends Equatable {
  const AddtocartEvent();

}


class IncrementValue extends AddtocartEvent{
  
  @override
  List<Object> get props => [];
  
}


class DecrementValue extends AddtocartEvent{

  @override
  List<Object> get props => [];
  
}

class ChangeSize extends AddtocartEvent{
  
  final String size;

  ChangeSize(this.size);
  
  @override
  List<Object> get props => [size];

}

class ChangeFlavor extends AddtocartEvent{
  final String flavor;

  ChangeFlavor(this.flavor);
  @override
  List<Object> get props => [flavor];
  
}

class ChangeTopping extends AddtocartEvent{
  final String topping;

  ChangeTopping(this.topping);
  @override
  List<Object> get props =>[topping];
  
}
