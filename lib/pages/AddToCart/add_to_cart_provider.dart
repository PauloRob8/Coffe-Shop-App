import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/AddToCart/add_to_cart_page.dart';
import 'package:CoffeShopApp/pages/AddToCart/bloc/addtocart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartProvider extends StatelessWidget {
  final Item item;

  const AddToCartProvider({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddtocartBloc(item),
      child: AddToCart(item: item,),
    );
  }
}