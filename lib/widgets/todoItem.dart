import 'package:flutter/material.dart';
import 'package:tododb/model/todo.dart';

class TodoItem extends StatefulWidget {
  final int id;
  final String todoText;
  final DateTime creationDate;
  final Function updateFunction;
  final Function deleteFunction;
  bool isDone;

  TodoItem(
      {required this.id,
      required this.todoText,
      required this.creationDate,
      required this.isDone,
      required this.updateFunction,
      required this.deleteFunction});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    var localTdodo = Todo(
        id: widget.id,
        todoText: widget.todoText,
        creationDate: widget.creationDate,
        isDone: widget.isDone);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: Checkbox(
          onChanged: (bool? value) {
            setState(() {
              widget.isDone = value!;
            });
            localTdodo.isDone = value!;
            widget.updateFunction(localTdodo);
          },
          value: widget.isDone,
        ),
        tileColor: Colors.white70,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        title: Text(
          widget.todoText,
          style: TextStyle(
              decoration: widget.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: IconButton(
            onPressed: () {
              widget.deleteFunction(localTdodo);
            },
            icon: Icon(Icons.delete, color: Colors.blue)),
      ),
    );
  }
}
