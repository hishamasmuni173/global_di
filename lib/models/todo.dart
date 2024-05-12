class Todo {
  int id;
  String title;
  bool completed;

  Todo({required this.id, required this.title, this.completed = false});
  Todo.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'], title: json['title'], completed: json['completed']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'completed': completed};
}
