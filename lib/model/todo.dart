import 'dart:async';

class Todo {
  int? id;
  final String todoText;
  DateTime creationDate;
  bool isDone;

  Todo(
      {this.id,
      required this.todoText,
      required this.creationDate,
      required this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todoText': todoText,
      'creationDate': creationDate.toString(),
      'isDone': isDone ? 1 : 0
    };
  }

  @override
  String toString() {
    return 'Todo(id:$id, todoText:$todoText, creationDate: $creationDate, isDone: $isDone )';
  }
}
