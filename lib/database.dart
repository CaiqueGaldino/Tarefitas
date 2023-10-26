import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {

  List ToDoList = [];
  List Completeds = [];
  // reference the box
  final _mybox = Hive.box('mybox');

// run this if is the first time ever opening the app
void createInitialData(){
ToDoList = [
  ["Crie uma nova task", false,"05/03/1999", "-" ],
  ["Deslise o card delete essa task", false,"05/03/1999","-"]
];


}

//load the data from the database
void loadData(){
ToDoList = _mybox.get("TODOLIST");

}

// update the data base
void updateDatabase(){
  
_mybox.put("TODOLIST", ToDoList);

//Completeds = ToDoList.where((o) => o[1] == true).toList();
}


}