import 'package:crud_buku/Books/list_book.dart';
import 'package:flutter/material.dart';

class CreateBook extends StatefulWidget {
  @override
  _CreateBookState createState() => _CreateBookState();
}

class _CreateBookState extends State<CreateBook> {
  final nameController = TextEditingController();
  final authorController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final author = authorController.text;
                final title = titleController.text;
                final description = descriptionController.text;
                final category = categoryController.text;

                if (name.isNotEmpty &&
                    author.isNotEmpty &&
                    title.isNotEmpty &&
                    description.isNotEmpty &&
                    category.isNotEmpty) {
                  final newBook = Book(
                    id: UniqueKey().toString(),
                    name: name,
                    author: author,
                    title: title,
                    description: description,
                    category: category,
                  );
                  Navigator.pop(context, newBook);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text('Book created successfully!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
