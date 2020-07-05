part of 'cart_cubit.dart';

@immutable
abstract class CartState {
  final List<Item> list;

  CartState(this.list);
}

class CartInitial extends CartState {
  CartInitial() : super([]);
}

class UpdatedList extends CartState {
  final List<Item> list;

  UpdatedList(this.list) : super(list);
}
