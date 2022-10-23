import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task1/screens/home_page.dart';
import 'package:task1/screens/contact_create.dart';

void main() {
  testWidgets('Home Page bukan title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    
    await tester.pumpWidget(AppBar(title: const ContactCreate()));

    expect(find.text('Contact Create'), findsOneWidget);
  });
}
