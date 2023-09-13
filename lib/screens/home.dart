import 'package:flutter/material.dart';
import 'package:tododb/handler/dbHandler.dart';
import 'package:tododb/widgets/todoForm.dart';
import 'package:tododb/widgets/todoList.dart';
import 'package:tododb/widgets/todoitem.dart';

import '../model/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = Databasehandler();
  void addItem(Todo todo) async {
    await db.insertTodo(todo);
    setState(() {});
  }

  void deleteItem(Todo todo) async {
    await db.deleteTodo(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDo",
          style:
              TextStyle(color: Colors.blue[400], fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    "All ToDo",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                TodoList(
                  updateFunction: addItem,
                  deleteFunction: deleteItem,
                )
              ],
            ),
          ),
          TodoForm(
            insertFunction: addItem,
          )
        ],
      ),
    );
  }
}
