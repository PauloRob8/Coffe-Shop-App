
import 'package:CoffeShopApp/models/item.dart';
import 'package:CoffeShopApp/pages/home/bloc/home_bloc.dart';
import 'package:CoffeShopApp/pages/home/home_page.dart';
import 'package:CoffeShopApp/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:neumorphic/neumorphic.dart';

class MockedRepository extends Mock implements Repository {}

void main() {
  final mockRepository = MockedRepository();
  final items = [
    Item.fromJson(
      {
        "name": "Classic Latte",
        "type": "coffee",
        "image": "assets/drawable-hdpi/coffe_cup.png",
        "size": "Small",
        "topping": "Wipped Cream",
        "flavor": "Caramel",
        "favorite": "true",
        "price": "2.50"
      },
    )
  ];
  testWidgets('When build home page, should find the correct widgets', (WidgetTester tester) async {
    when(mockRepository.getallItens()).thenAnswer((_) => Future.value(items));

    await tester.pumpWidget(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(mockRepository),
        child: HomePage(),
      ),
    ));
    await tester.pump();
   
    // Verify that our counter starts at 0.
    expect(find.text("Good Morning, \nJennifer!"), findsOneWidget);
    expect(find.byType(ToggleButtons), findsOneWidget);
    expect(find.byType(NeuCard), findsWidgets);
  });
}
