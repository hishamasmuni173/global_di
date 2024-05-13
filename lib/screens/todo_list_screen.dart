import 'package:flutter/material.dart';

import '../models/todo.dart';
//import '../services/todo_data_service_mock.dart';

class TodoListScreen extends StatefulWidget {
 // const TodoListScreen({super.key});

  final dataService;

  const TodoListScreen({super.key, this.dataService});

  @override
  // ignore: library_private_types_in_public_api
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late List<Todo> _todos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        //future: todoDataService.getTodoList(),
        future: widget.dataService.getTodoList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _todos = snapshot.data!;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo List'),
      ),
      body: ListView.separated(
        itemCount: _todos.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) {
          final _todo = _todos[index];
          return ListTile(
            title: Text(_todo.title,
                style: TextStyle(
                    decoration: _todo.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)),
            subtitle: Text('id: ${_todo.id}'),
            onTap: () async {
              //Update the status at the database
//              Todo updatedTodo = await todoDataService.updateTodoStatus(
              Todo updatedTodo = await widget.dataService.updateTodoStatus(  
                  id: _todos[index].id,
                  status: !_todos[index]
                      .completed); // Get the current status from UI and toggle it
              setState(() => _todos[index].completed = updatedTodo
                  .completed); // Update UI using the updated todo from database
            },
            onLongPress: () async {
//              await todoDataService.deleteTodo(
              await widget.dataService.deleteTodo(  
                  id: _todos[index].id); // Delete todo at the database
              setState(() => _todos.removeAt(index)); // Update UI
            },
          );
        },
      ),
      floatingActionButton: AddTodoButton(
          dataService: widget.dataService, state: this, todos: _todos),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching todo... Please wait'),
          ],
        ),
      ),
    );
  }
}


class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key, 
    this.dataService,
    this.state,
    this.todos,
  });

  final dataService;
  final state;
  final todos;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        final newTodo = await dataService.createTodo(
          todo: Todo(title: 'New Task', id: todos.length++),
        ); // Update server. Id for the new Todo will be given by the server

        state.setState(() => todos.add(newTodo)); // Update UI
      },
    );
  }
}
