import 'package:flutter/material.dart';
import 'package:tasktrackr_todolist/util/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onAdd;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[100],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get new task input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            //button -> add task + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //add button
                MyButton(text: "Add", onPressed:onAdd),

                const SizedBox(width: 8,),

                //cancel button
                MyButton(text: "Cancel", onPressed:onCancel),

              ],
            ),

          ],
        ),
      )
    );
  }
}