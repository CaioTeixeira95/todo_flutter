import 'package:flutter/material.dart';

import 'package:list_view/tasks.dart';

class NewToDoPage extends StatefulWidget {
  @override
  _NewToDoPageState createState() => _NewToDoPageState();
}

class _NewToDoPageState extends State<NewToDoPage> {
  showSnackBar(String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        action: SnackBarAction(
          label: 'close',
          onPressed: () {},
        ),
      ),
    );
  }

  handleSave(String title, String subtitle) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (title.isNotEmpty && subtitle.isNotEmpty) {
      tasks.add({
        'title': title,
        'subtitle': subtitle,
        'checked': false,
      });
      showSnackBar('Task successfully added!');
      Navigator.pop(context, true);
    } else {
      showSnackBar('Please, enter with a title and description');
    }
  }

  @override
  Widget build(BuildContext context) {
    var _titleController = TextEditingController();
    var _subtitleController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('New To Do')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _subtitleController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.save),
            label: Text('Save'),
            onPressed: () =>
                handleSave(_titleController.text, _subtitleController.text),
          ),
        ],
      ),
    );
  }
}
