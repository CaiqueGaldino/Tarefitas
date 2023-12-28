import 'package:flutter/material.dart';
import 'package:tarefas/database.dart';
import 'todo_tile.dart';

class TodoList extends StatelessWidget {

  final List<dynamic> FilterList;
  final void Function (bool?, int) checkBoxChanged;
  final void Function(int)deleteTask;
const TodoList({ Key? key, required this.FilterList, required this.checkBoxChanged, required this.deleteTask }) : super(key: key);



  @override
  Widget build(BuildContext context){
    return ListView.builder(
                  shrinkWrap: true,
                  itemCount: FilterList.length,
                  itemBuilder: (context, index) {
                    return ToDoTile(
                      taskName: FilterList[index][0],
                      taskCompleted: FilterList[index][1],
                      start: FilterList[index][2].toString(),
                      end: FilterList[index][3].toString(),
                      bgColor: FilterList[index][4],
                      onChanged: (value) => checkBoxChanged(value, index),
                      deleFunction: (context) => deleteTask(index),
                    );
                  });
  }
  

}

