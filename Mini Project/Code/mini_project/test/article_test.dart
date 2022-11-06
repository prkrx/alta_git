import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project/screen/tagihan_screen/tagihan_screen.dart';


void main() {
  testWidgets("Judul halaman adalah Berita", (tester) async {
    await tester.pumpWidget(
      const TagihanScreen()
    );

    expect(find.text("Berita"), findsOneWidget);
  });
}