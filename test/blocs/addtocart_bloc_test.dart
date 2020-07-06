

import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/addToCart/bloc/addtocart_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  AddtocartBloc addtocartBloc;
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

  setUp(() {
    addtocartBloc = AddtocartBloc(item);
  });
  tearDown(() {
    addtocartBloc.close();
  });

  test("Bloc should increment the value to 2", () async {
    addtocartBloc.add(IncrementValue());
    expect(addtocartBloc, emitsInOrder([AddtocartInitial(),AmountChanged(2)]));


  });
  test("Bloc decrement event should not decrement less then one", () async {
    addtocartBloc.add(DecrementValue());
    expect(addtocartBloc, emitsInOrder([AddtocartInitial(),AmountChanged(1)]));
  });

  test("Bloc changeSize event should change the size of the item", () async {
    addtocartBloc.add(ChangeSize(item.size));
    expect(addtocartBloc, emitsInOrder([AddtocartInitial(),SizeChanged("Large")]));
  });

  test("Bloc changeFlavor event should change the flavor of the item", () async {
    addtocartBloc.add(ChangeFlavor(item.flavor));
    expect(addtocartBloc, emitsInOrder([AddtocartInitial(),FlavorChanged("None")]));
  });

  test("Bloc changeTopping event should change the topping of the item", () async {
    addtocartBloc.add(ChangeTopping(item.topping));
    expect(addtocartBloc, emitsInOrder([AddtocartInitial(),ToppingChanged("Wipped Cream")]));
  });
}