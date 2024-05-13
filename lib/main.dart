import 'package:flutter/material.dart';
import 'screens/todo_list_screen.dart';
import 'todo_inherited_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoInheritedWidget(
      child: MaterialApp(
        title: 'Dependency Injection',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
          ),
        ),
        home: const TodoListScreen(),
      ),
    );
  }
}


// void main() => runApp(
//       MaterialApp(
//         title: 'Dependency Injection',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(primarySwatch: Colors.green),
//         home: const TodoListScreen(),
//       ),
//     );
