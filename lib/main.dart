import 'package:flutter/material.dart';
import 'screens/todo_list_screen.dart';
import 'dependencies.dart' as di;

void main() {
  di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dependency Injection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
        ),
      ),
      home: const TodoListScreen(),
    );
  }
}
