import 'package:crud_buku/Books/list_book.dart';
import 'package:flutter/material.dart';

class EditBook extends StatefulWidget {
  final Book book;

  EditBook({required this.book});

  @override
  _EditBookState createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.book.name;
    authorController.text = widget.book.author;
    titleController.text = widget.book.title;
    descriptionController.text = widget.book.description;
    categoryController.text = widget.book.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Book'),
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
                final updatedName = nameController.text;
                final updatedAuthor = authorController.text;
                final updatedTitle = titleController.text;
                final updatedDescription = descriptionController.text;
                final updatedCategory = categoryController.text;

                if (updatedName.isNotEmpty &&
                    updatedAuthor.isNotEmpty &&
                    updatedTitle.isNotEmpty &&
                    updatedDescription.isNotEmpty &&
                    updatedCategory.isNotEmpty) {
                  final updatedBook = Book(
                    name: updatedName,
                    author: updatedAuthor,
                    title: updatedTitle,
                    description: updatedDescription,
                    category: updatedCategory,
                    id: widget.book.id,
                  );

                  Navigator.pop(context, updatedBook);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text('edit successful'),
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
