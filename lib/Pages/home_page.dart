import 'package:flutter/material.dart';
import 'package:to_do_app/Util/dialog_box.dart';
import 'package:to_do_app/Util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;

  // List to do task
  List<List<dynamic>> toDoList = [
    ["Make Tutorials", false],
    ["Do Code", false],
  ];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  // checkedbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !(toDoList[index][1] as bool);
    });
  }

  //Save new task
  void SaveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        onSave: SaveNewTask,
        oncancel: ()=> Navigator.of(context).pop(),
      ),
    );
  }

  //delete task

  void deleteTask(int index){
   setState(() {
     toDoList.removeAt(index);
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: const Text('TO DO'),
        elevation: 0,
        backgroundColor: Colors.white60,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0].toString(),
            taskCompleted: toDoList[index][1] as bool,
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context)=>deleteTask(index),
          );
        },
      ),
    );
  }
}
