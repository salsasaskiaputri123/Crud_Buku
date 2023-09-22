import 'package:crud_buku/Books/create_book.dart';
import 'package:crud_buku/Books/edit_book.dart';
import 'package:flutter/material.dart';

class Book {
  final String id;
  late final String name;
  late final String author;
  late final String title;
  late final String description;
  late final String category;

  Book({
    required this.id,
    required this.name,
    required this.author,
    required this.title,
    required this.description,
    required this.category,
  });
}

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List<Book> books = [];

  Widget _buildBookItem(BuildContext context, int index) {
    final book = books[index];
    return ListTile(
      title: Text('Name : ${book.name}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Author : ${book.author}'),
          Text('Title : ${book.title}'),
          Text('Description : ${book.description}'),
          Text('Category : ${book.category}'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete Confirmation'),
                    content: Text('Are you sure you want to delete this book?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            books.removeAt(index);
                          });
                          Navigator.of(context).pop();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Book deleted successfully'),
                            ),
                          );
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              final updatedBook = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditBook(book: book),
                ),
              );

              if (updatedBook != null) {
                setState(() {
                  books[index] = updatedBook;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: _buildBookItem,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newBook = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateBook()),
          );

          if (newBook != null) {
            setState(() {
              books.add(newBook);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Title: ${book.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Author: ${book.author}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
