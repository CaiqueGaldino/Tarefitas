import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {

  List ToDoList = [];
  List Completeds = [];
  //List Categories = [];
  // reference the box
  final _mybox = Hive.box('mybox');

  

// run this if is the first time ever opening the app
void createInitialData(){
ToDoList = [
  ["Crie uma nova task", false,"05/03/1999", "-", 0],
  ["<= Deslise o card ", false,"05/03/1999","-", 3]
];
 Completeds = [];
 /*Categories = [
  ["Pessoal", 1, 0],
  ["Profissional", 2, 0],

 ];*/

}

//load the data from the database
void loadData(){
ToDoList = _mybox.get("TODOLIST");
Completeds = _mybox.get("COMPLETEDS");
//Categories = _mybox.get("CATEGORIES");

}

// update the data base
void updateDatabase(){
  
_mybox.put("TODOLIST", ToDoList);
_mybox.put("COMPLETEDS", Completeds);
//_mybox.put("COMPLETEDS", Categories);


//Completeds = ToDoList.where((o) => o[1] == true).toList();
}


}