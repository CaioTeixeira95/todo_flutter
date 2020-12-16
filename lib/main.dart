import 'package:flutter/material.dart';

import 'package:list_view/pages/to_do.dart';
import 'package:list_view/pages/new_to_do.dart';

main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'To Do',
      initialRoute: '/',
      routes: {
        '/': (context) => ToDoPage(),
        '/new': (context) => NewToDoPage(),
      },
    );
  }
}
