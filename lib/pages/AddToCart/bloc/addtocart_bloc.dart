import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'addtocart_event.dart';
part 'addtocart_state.dart';

class AddtocartBloc extends Bloc<AddtocartEvent, AddtocartState> {
  @override
  AddtocartState get initialState => AddtocartInitial();

  int value = 1;

  @override
  Stream<AddtocartState> mapEventToState(
    AddtocartEvent event,
  ) async* {
    if(event is IncrementValue){
      yield AmountChanged(this.value);
      this.value += event.value;
      yield ValueIncremented(this.value);
    }
  }
}
