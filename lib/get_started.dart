import 'package:flutter/material.dart';
import 'package:tasktrackr_todolist/task_screen.dart';

class GetStarted extends StatefulWidget{
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('TaskTrackr',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold,),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Simplify Your Day: Manage Tasks Effortlessly',
                style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500,color: Color(0xFF424242),),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(33.0),
              child: SizedBox(
                width: 200.0,
                height: 55.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple[300],
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>TaskScreen()));
                  },
                  child: Text('Lets Start',
                    style: TextStyle(fontSize: 17.0,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}