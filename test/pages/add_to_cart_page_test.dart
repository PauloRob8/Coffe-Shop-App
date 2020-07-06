import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/addToCart/add_to_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Item item = Item(
    name: "Classic Latte",
    type: "coffee",
    image: "assets/drawable-hdpi/coffee_cup3.png",
    price: 4.50,
    favorite: true,
    size: "Small",
    flavor: "Caramel",
    topping: "None",
  );

  testWidgets('When build the AddToCartPage should return the correct widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AddToCartProvider(
          item: item,
        ),
      ),
    );

    expect(find.text(item.name), findsOneWidget);
    expect(find.text(item.size), findsOneWidget);
    expect(find.text(item.flavor), findsOneWidget);
    expect(find.text(item.topping), findsOneWidget);

    //The amout of items should start at 1
    expect(find.text("1"), findsOneWidget);


  });
}
