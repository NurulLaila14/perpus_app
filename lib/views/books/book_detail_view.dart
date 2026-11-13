import 'package:flutter/material.dart';

import '../../models/book_model.dart';

class BookDetailView extends StatelessWidget {
  final BookModel book;

  const BookDetailView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Buku')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(book.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          _DetailRow(label: 'Penulis', value: book.author),
          if (book.publisher != null)
            _DetailRow(label: 'Penerbit', value: book.publisher!),
          _DetailRow(label: 'ISBN', value: book.isbn),
          _DetailRow(label: 'Tahun terbit', value: '${book.publishedYear}'),
          _DetailRow(label: 'Stok', value: '${book.stock}'),
          if (book.description != null && book.description!.isNotEmpty) ...[
            const Divider(height: 32),
            Text('Deskripsi', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(book.description!),
          ],
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: Theme.of(context).textTheme.titleSmall),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
