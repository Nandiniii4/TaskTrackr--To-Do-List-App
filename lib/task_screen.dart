import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasktrackr_todolist/data/database.dart';
import 'package:tasktrackr_todolist/util/dialog_box.dart';
import 'package:tasktrackr_todolist/util/todo_tile.dart';

class TaskScreen extends StatefulWidget{
  const TaskScreen({super.key});

  @override 
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>{
  final _controller = TextEditingController();
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    //if this first time opening the app, then we display the user a message
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  //checkbox was clicked
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //add new task-save it
  void addNewTask() {
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onAdd: addNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text("TaskTrackr", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 12,
        centerTitle: true,
        shadowColor: Colors.grey[100],
      ),

      //new task button
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple[200],
        icon: Icon(Icons.add),
        label: const Text('New Task'),
        onPressed: createNewTask,
      ),

      //list of to do
      body: Padding(
        padding: const EdgeInsets.only(top:25.0),
        child: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index){
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}