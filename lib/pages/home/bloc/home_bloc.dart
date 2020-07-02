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
    List<Item> teaList = getTeaList(allItens);
    List<Item> coffeeList =  getCoffeeList(allItens);

    if (event is AppStarted) {
      this.add(ChangePageFilter(index: this.currentIndex));
    }
    if (event is ChangePageFilter) {
      this.currentIndex = event.index;
      yield HomeFilterChanged(this.currentIndex);
      yield HomeLoading();
      if (this.currentIndex == 2) {
        yield HomeAllItens(allItens);
      }
      if (this.currentIndex == 1) {
        yield HomeFilteredByCoffe(coffeeList);
      }
      if (this.currentIndex == 0) {
        yield HomeFilteredByTea(teaList);
      }
    }
    if (event is LikeItem){
      yield ItemLiked(event.liked);
    }
  }

  getItens() {
    return this.repository.getallItens();
  }

  getCoffeeList(List<Item> allItens) {
    List<Item> filteredList = [];
    for (int i = 0; i < allItens.length; i++) {
      if (allItens[i].type == "coffee") {
        filteredList.add(allItens[i]);
      }
    }
    return filteredList;
  }

  getTeaList(List<Item> allItens) {
    List<Item> filteredList = [];
    for (int i = 0; i < allItens.length; i++) {
      if (allItens[i].type == "tea") {
        filteredList.add(allItens[i]);
      }
    }
    return filteredList;
  }
}


