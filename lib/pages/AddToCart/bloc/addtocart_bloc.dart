import 'dart:async';

import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/addToCart/bloc/addtocart_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'addtocart_event.dart';
part 'addtocart_state.dart';

class AddtocartBloc extends Bloc<AddtocartEvent, AddtocartState> {
  AddtocartBloc(this.item);

  @override
  AddtocartState get initialState => AddtocartInitial();

  int value = 1;
  final Item item;

  @override
  Stream<AddtocartState> mapEventToState(
    AddtocartEvent event,
  ) async* {
    if (event is IncrementValue) {
      this.value += 1;
      yield AmountChanged(this.value);
    }
    if (event is DecrementValue) {
      if (this.value == 1) {
        yield AmountChanged(this.value);
      } else {
        this.value -= 1;
        yield AmountChanged(this.value);
      }
    }
    if(event is ChangeSize){
      this.item.size = getChangedSize(this.item.size);
      yield SizeChanged(this.item.size);
    }
    if(event is ChangeFlavor){
      this.item.flavor = getChangedFlavor(this.item.flavor, this.item.type);
      yield FlavorChanged(this.item.flavor);
    }
    if(event is ChangeTopping){
      this.item.topping = getChangedTopping(this.item.topping, this.item.type);
      yield ToppingChanged(this.item.topping);
    }
  }

  getChangedSize(String size){
      if(size == "Small"){
        return "Large";
      }
      else{
        return "Small";
      }
    }
  getChangedFlavor(String flavor,String type){
      if(type == "tea"){
        if(flavor == "Lemon"){
          return "Chamomile";
        }
        else
          return "Lemon";
      }
      else{
        if(flavor == "Caramel"){
          return "None";
        }
        else
          return "Caramel";
      }
    }


  getChangedTopping(String topping,String type){
    if(type == "tea"){
        if(topping == "None"){
          return "Aloe Vera";
        }
        else
          return "None";
      }
      else{
        if(topping == "Wipped Cream"){
          return "None";
        }
        else
          return "Wipped Cream";
      }
    }
}
