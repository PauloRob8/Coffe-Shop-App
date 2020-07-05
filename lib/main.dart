import 'package:CoffeShopApp/pages/Cart/cubit/cart_cubit.dart';
import 'package:CoffeShopApp/pages/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CubitProvider<CartCubit>(
      create: (context) => CartCubit(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: InitialPage(),
      ),
    );
  }
}
