import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_em/data/database.dart';
import 'package:todo_em/utility/dialog_box.dart';
import 'package:todo_em/utility/todo_til.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _myBox = Hive.box('mybox');

  final _controller = TextEditingController();

  //list of todo tasks

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void cancelTask() {
    _controller.clear();
    Navigator.of(context).pop();
  }

  void saveNewTask() {
    setState(() {
      _controller.text.isNotEmpty
          ? db.toDoList.add([_controller.text, false])
          : null;
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => cancelTask(),
          );
        });
  }

  void deletetask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lime[200],
        appBar: AppBar(
          title: const Text("TO DO"),
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskname: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deletefunction: (context) => deletetask(index),
            );
          },
        ));
  }
}
