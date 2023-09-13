import 'package:flutter/material.dart';
import 'package:tododb/model/todo.dart';

class TodoForm extends StatelessWidget {
  final Function insertFunction;
  TodoForm({required this.insertFunction, super.key});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
                hintText: "Add New Task", border: InputBorder.none),
          ),
        )),
        ElevatedButton(
          onPressed: () {
            var mytodo = Todo(
                todoText: textEditingController.text,
                creationDate: DateTime.now(),
                isDone: false);
            insertFunction(mytodo);
          },
          child: Text(
            "+",
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue[500],
              minimumSize: Size(60, 60),
              elevation: 10),
        )
      ]),
    );
  }
}
