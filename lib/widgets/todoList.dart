import 'package:flutter/widgets.dart';
import 'package:tododb/widgets/todoItem.dart';

import '../handler/dbHandler.dart';

class TodoList extends StatelessWidget {
  final Function updateFunction;
  final Function deleteFunction;
  TodoList(
      {required this.updateFunction, required this.deleteFunction, super.key});
  var db = Databasehandler();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: db.getTodo(),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            var data = snapshot.data;
            var dataLength = data!.length;
            return dataLength == 0
                ? const Center(
                    child: Text("No data found"),
                  )
                : ListView.builder(
                    itemBuilder: (context, i) => TodoItem(
                      id: data[i].id,
                      todoText: data[i].todoText,
                      creationDate: data[i].creationDate,
                      isDone: data[i].isDone,
                      updateFunction: updateFunction,
                      deleteFunction: deleteFunction,
                    ),
                    itemCount: dataLength,
                  );
          }),
    );
  }
}
