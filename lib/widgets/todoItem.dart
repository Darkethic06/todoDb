import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final int id;
  final String todoText;
  final DateTime creationDate;
  bool isDone;

  TodoItem(
      {required this.id,
      required this.todoText,
      required this.creationDate,
      required this.isDone});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        leading: Icon(
          Icons.check_box,
          color: Colors.blue,
        ),
        tileColor: Colors.white70,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        title: Text(
          widget.todoText,
          // style: TextStyle(
          //     decoration: widget.isDone
          //         ? TextDecoration.lineThrough
          //         : TextDecoration.none),
        ),
        trailing: IconButton(
            onPressed: () {}, icon: Icon(Icons.delete, color: Colors.blue)),
      ),
    );
  }
}
