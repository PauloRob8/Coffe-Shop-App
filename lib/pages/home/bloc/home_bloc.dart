import 'dart:async';

import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

enum HomeTabs { tea, coffee, recentOrders }

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  List<Item> allItems;

  final Repository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    add(LoadItems());
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadItems) {
      allItems = await repository.getallItens();
      changeFilter(HomeTabs.recentOrders.index);
    }
    if (event is ChangePageFilter) {
      yield HomeLoading();
      final tab = getTabByIndex(event.index);

      switch (tab) {
        case HomeTabs.tea:
          List<Item> teaList = getTeaList(allItems);
          yield FilteredItems(tab.index,teaList);
          break;
        case HomeTabs.coffee:
          List<Item> coffeeList = getCoffeeList(allItems);
          yield FilteredItems(tab.index,coffeeList);
          break;
        case HomeTabs.recentOrders:
          yield FilteredItems(tab.index,allItems);
          break;

        default:
      }
    }
    if (event is LikeItem) {
      yield ItemLiked(event.liked);
    }
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
  void changeFilter(int index)=> add(ChangePageFilter(index: index));

  HomeTabs getTabByIndex(int index)=> HomeTabs.values[index]; 
}
