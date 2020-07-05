import 'package:CoffeShopApp/models/item.dart';
import 'package:cubit/cubit.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addItemToCart(Item item){
    final newList = [...state.list,item];
    emit(UpdatedList(newList));

  }
  double get getPrice{
    final totalPrice = state.list.fold<double>(0.0,(prev, item) => prev + item.price);
    return totalPrice;
  } 
}
