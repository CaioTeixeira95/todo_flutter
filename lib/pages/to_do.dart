import 'package:flutter/material.dart';

import 'package:list_view/tasks.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  initState() {
    super.initState();
    if (tasks.isEmpty) {
      for (int i = 0; i < 10; i++) {
        var task = {
          'title': 'Task #${i + 1}',
          'subtitle': 'I\'m the description of task #${i + 1}',
          'checked': false,
        };

        tasks.add(task);
      }
    }
  }

  Card itemBuilder(context, index) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.event_note),
        trailing: Checkbox(
          value: tasks[index]['checked'],
          onChanged: (value) {
            setState(() {
              tasks[index]['checked'] = value;
            });
          },
        ),
        title: Text('${tasks[index]['title']}'),
        subtitle: Text('${tasks[index]['subtitle']}'),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
      ),
      body: ListView.builder(itemCount: tasks.length, itemBuilder: itemBuilder),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var navigator = await Navigator.pushNamed(context, '/new');
          if (navigator) {
            setState(() {});
          }
        },
      ),
    );
  }
}
