import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tarefas/NovaTask.dart';
import 'package:tarefas/Todo_List.dart';
import 'package:tarefas/constants.dart';
import 'package:tarefas/database.dart';
import 'package:tarefas/dialog_box.dart';
import 'package:tarefas/todo_tile.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// reference the hive box
  final _mybox = Hive.box('mybox');

  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // se for a primeira vez abrindo, cria banco em branco
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //já existe um banco
      db.loadData();
      //List<dynamic> FilterList = [];
      // FilterList = db.ToDoList;
    }
    super.initState();
  }

// text controller
  final _controller = TextEditingController();

  //final _bgColor = 3;

  // ChackBox Changed

  void checkBoxChanged(bool? value, int index) {
    DateTime _date = DateTime.now();
    var end = DateFormat('d/M/yy').format(_date).toString();
    
    setState(() {
      if (value == true) {
        db.ToDoList[index][1] = !db.ToDoList[index][1];
        db.ToDoList[index][3] = end;
        db.Completeds.add(db.ToDoList[index]);
        db.ToDoList.removeAt(index);
      } else {
        db.Completeds[index][1] = !db.Completeds[index][1];
        db.Completeds[index][3] = "";
        db.ToDoList.add(db.Completeds[index]);
        db.Completeds.removeAt(index);
      }

      //db.ToDoList[index][1] == true? db.ToDoList[index][3] = end : db.ToDoList[index][3] = " ";
    });
    db.updateDatabase();
  }

// save a new task
  void saveNewTask(int cor) {
    DateTime _date = DateTime.now();
    var start = DateFormat('d/M/yy').format(_date).toString();
    int c = cor;
    setState(() {
      db.ToDoList.add([_controller.text, false, start, " ", c]);

      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // Create a new task

  void CreateNewTask() {
    //Gambiarra com o dialog usado na versão anterior
    showDialog(
      context: context,
      builder: (context) {
        return NovaTask(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          //bgColor: _bgColor,
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    if(filter){
      setState(() {
      db.ToDoList.removeAt(index);
    });
    } else{
      setState(() {
      db.Completeds.removeAt(index);
    });
    }
    
    db.updateDatabase();
  }

  
  var filter = true;
  void FilterToDo() {
    setState(() {
      filter = true;
      
    });
  }

  void FilterCompleteds() {
    setState(() {
      filter = false;
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: const Text(
            'T A R E F I T A S',
            style: TextStyle(fontFamily: primaryFont),
          ),
          centerTitle: true,
          elevation: 5,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: CreateNewTask, child: const Icon(Icons.add)),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 12, left: 12, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          width: 100,
                          decoration: BoxDecoration(
                              color: filter ? Colors.grey : Colors.amber,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color:
                                      filter ? Colors.black54 : Colors.amber)),
                          child: TextButton(
                              onPressed: FilterToDo,
                              child: Text(
                                "A fazer",
                                style: TextStyle(color: Colors.black),
                              ))),
                      Container(
                          width: 100,
                          decoration: BoxDecoration(
                              color: filter ? Colors.amber : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color:
                                      filter ? Colors.amber : Colors.black54)),
                          child: TextButton(
                              onPressed: FilterCompleteds,
                              child: Text(
                                "Completas",
                                style: TextStyle(color: Colors.black),
                              ))),
                    ],
                  )),
            ),
            Expanded(
                flex: 7,
                child: TodoList(
                    FilterList: filter ? db.ToDoList : db.Completeds,
                    checkBoxChanged: checkBoxChanged,
                    deleteTask: deleteTask)),
          ],
        ));
  }
}
