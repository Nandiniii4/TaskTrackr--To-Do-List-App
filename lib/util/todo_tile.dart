import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override 
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 5),
      child: Container(
        //padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.purple[300]),
            Text(
              taskName,
              style: TextStyle(fontSize: 17.5,decoration: taskCompleted ? TextDecoration.lineThrough: TextDecoration.none),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                if(deleteFunction != null) {
                  deleteFunction!(context);
                }
              },
              child: Icon(Icons.delete, )
            ),
          ],)
      ),
    );
  }
}