import 'package:flutter/material.dart';
import 'screens/todo_list_screen.dart';
import 'services/todo_data_service_mock.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dependency Injection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
        ),),
      home: TodoListScreen(dataService: TodoDataServiceMock()),
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
    );
//       ),
//     );
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
