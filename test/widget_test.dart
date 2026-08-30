import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodapp/main.dart';

void main() {
  testWidgets('App boots and shows the FoodApp splash screen', (tester) async {
    await tester.pumpWidget(const FoodApp());
    expect(find.text('FoodApp'), findsOneWidget);
    expect(find.byIcon(Icons.restaurant_menu), findsOneWidget);
  });
}
