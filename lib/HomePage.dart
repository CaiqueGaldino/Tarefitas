import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tarefas/NovaTask.dart';
import 'package:tarefas/constants.dart';
import 'package:tarefas/database.dart';
import 'package:tarefas/dialog_box.dart';
import 'package:tarefas/todo_tile.dart';

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
    }
    super.initState();
  }

// text controller
  final _controller = TextEditingController();

  // ChackBox Changed

  void checkBoxChanged(bool? value, int index) {
    DateTime _date = DateTime.now();
    var end = _date.day.toString() + "/" + _date.month.toString() + "/" + _date.year.toString();
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
      db.ToDoList[index][1] == true? db.ToDoList[index][3] = end : db.ToDoList[index][3] = " ";
      
    });
    db.updateDatabase();
  }

// save a new task
  void saveNewTask() {
    DateTime _date = DateTime.now();
    var start = _date.day.toString() + "/" + _date.month.toString() + "/" + _date.year.toString();
    setState(() {
      db.ToDoList.add([_controller.text, false,start, " "]);
      
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
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          title: const Text('T A R E F I T A S', style: TextStyle(fontFamily: primaryFont),),
          centerTitle: true,
          elevation: 5,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: CreateNewTask,
            child: const Icon(Icons.add)),
        body: Column(

          children: [
            Expanded(
              flex: 1,
              child: const Padding(
                padding: EdgeInsets.only(top: 20, right: 12, left: 12, bottom: 12),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Pesquisar"),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: db.ToDoList.length,
                  itemBuilder: (context, index) {
                    
                    return ToDoTile(
                      taskName: db.ToDoList[index][0],
                      taskCompleted: db.ToDoList[index][1],
                      start: db.ToDoList[index][2].toString(),
                      end: db.ToDoList[index][3].toString(),
                      onChanged: (value) => checkBoxChanged(value, index),
                      deleFunction: (context) => deleteTask(index),
                    );
                  }),
            ),
          ],
        ));
  }
}
