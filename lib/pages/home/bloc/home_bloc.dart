import 'dart:async';

import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  Item item1 = Item();
  Item item2 = Item();
  Item item3 = Item();

  int currentIndex = 2;

  final Repository repository;

  HomeBloc(this.repository);

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    List<Item> allItens = await getItens();
    if(event is AppStarted ){
      this.add(ChangePageFilter(index: this.currentIndex));
    }
    if(event is ChangePageFilter){
      this.currentIndex = event.index;
      yield HomeFilterChanged(this.currentIndex);
      yield HomeLoading();
      if(this.currentIndex == 2){
        yield HomeAllItens(allItens);
      }
      if(this.currentIndex == 1){
        yield HomeFilteredByCoffe(allItens);
      }
      if(this.currentIndex== 0){
        yield HomeFilteredByTea(allItens);
      }
    }
  }

  getItens(){
   return this.repository.getallItens();
  }

  filterTea(){
    
  }

}
