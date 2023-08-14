import 'package:flutter/material.dart';
import 'package:tododb/widgets/todoList.dart';
import 'package:tododb/widgets/todoitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Expanded(
                    child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 20),
                      child: Text(
                        "All ToDo",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    TodoList()
                  ],
                ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(right: 15, left: 15, bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Add New Task", border: InputBorder.none),
                ),
              )),
              ElevatedButton(
                onPressed: () {},
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
          )
        ],
      ),
    );
  }
}
