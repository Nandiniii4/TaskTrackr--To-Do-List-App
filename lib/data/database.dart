import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [];
  }

  //load the data from db
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  //update the db
  void updateDatabase() {
    _myBox.put("TODOLIST",toDoList);
  }

}