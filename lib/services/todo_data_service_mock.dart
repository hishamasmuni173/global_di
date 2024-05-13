import '../models/todo.dart';
import 'todo_data_service.dart';

final _todosDatabase = <Todo>[
  Todo(id: 1, title: 'Complete Assignment 1', completed: false),
  Todo(id: 2, title: 'Plan for next vacation', completed: true),
  Todo(id: 3, title: 'Plan for task 3', completed: true),
];

int _nextId = 3;

// class TodoDataServiceMock {
//   static final TodoDataServiceMock _instance =
//       TodoDataServiceMock._constructor();
//   factory TodoDataServiceMock() {
//     return _instance;
//   }
//   TodoDataServiceMock._constructor();

class TodoDataServiceMock implements TodoDataService {
  Future<List<Todo>> getTodoList() async {
    return [..._todosDatabase];
  }

  Future<Todo> updateTodoStatus({int? id, bool? status}) async {
    final matchedTodo = _todosDatabase.firstWhere((todo) => todo.id == id);
    matchedTodo.completed = status!;
    return matchedTodo;
  }

  Future<Todo> createTodo({Todo? todo}) async {
    todo!.id = _nextId++;
    _todosDatabase.add(todo);
    return todo;
  }

  Future deleteTodo({int? id}) async {
    _todosDatabase.removeWhere((todo) => todo.id == id);
  }
}

//final todoDataService = TodoDataServiceMock();
