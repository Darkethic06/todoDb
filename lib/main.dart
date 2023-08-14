import 'package:flutter/material.dart';
import 'package:tododb/handler/dbHandler.dart';
import 'package:tododb/model/todo.dart';
import 'package:tododb/screens/home.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // var db = Databasehandler();
  // await db.insertTodo(Todo(
  //     todoText: 'Class at 9', creationDate: DateTime.now(), isDone: false));
  // print(await db.getTodo());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
