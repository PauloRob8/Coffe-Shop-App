import 'package:CoffeShopApp/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:CoffeShopApp/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    var container = find.byWidget(Row());
    // Verify that our counter starts at 0.
    expect(container, findsNWidgets(3));

  });
}