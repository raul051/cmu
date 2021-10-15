import 'package:cmu/src/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomePage ...', (WidgetTester tester) async {
    final addField = find.byKey(ValueKey("addField"));

    await tester.pumpWidget(MaterialApp(home: HomePage()));
    await tester.tap(addField);
    await tester.pump();

    expect("ButtonGestionUsers", findsOneWidget);
  });
}