import 'package:flutter/material.dart';

import 'services/todo_data_service_mock.dart';

class TodoInheritedWidget extends InheritedWidget {
  TodoInheritedWidget({super.key, required this.child}) : super(child: child);

  @override
  final Widget child;
  final dataService = TodoDataServiceMock();

  static TodoInheritedWidget of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<TodoInheritedWidget>()
        as TodoInheritedWidget);
  }

  @override
  bool updateShouldNotify(TodoInheritedWidget oldWidget) {
    return true;
  }
}