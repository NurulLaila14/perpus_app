// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:perpus_app/core/routes/app_router.dart';
import 'package:perpus_app/models/book_model.dart';
import 'package:perpus_app/views/books/book_detail_view.dart';
import 'package:perpus_app/widgets/book_card.dart';

void main() {
  testWidgets('opens the selected book details', (WidgetTester tester) async {
    const book = BookModel(
      id: 1,
      title: 'Flutter Dasar',
      author: 'A. Penulis',
      publisher: 'Penerbit',
      isbn: '9781234567890',
      publishedYear: 2025,
      stock: 3,
      description: 'Buku pengantar Flutter.',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BookCard(book: book, onEdit: () {}, onDelete: () {}),
        ),
        routes: {AppRoutes.bookDetail: (_) => const BookDetailView(book: book)},
      ),
    );

    await tester.tap(find.text('Flutter Dasar'));
    await tester.pumpAndSettle();

    expect(find.text('Detail Buku'), findsOneWidget);
    expect(find.text('9781234567890'), findsOneWidget);
    expect(find.text('Buku pengantar Flutter.'), findsOneWidget);
  });
}
