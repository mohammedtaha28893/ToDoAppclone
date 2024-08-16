import 'package:flutter/material.dart';
import 'package:food/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:food/utilities/dialoge_box.dart';
import 'package:food/utilities/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  State<HomePage> createState() => _HomePageState ();
}

class _HomePageState extends State<HomePage> {

  //refrence the hive box
  final _mybox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {

    if(_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }


  /// text controller
  final _controller = TextEditingController();




/// checkbox was tapped
  void checkBoxChanged (bool? value, int index) {
    setState(() {
      db.ToDoList [index][1] = !db.ToDoList[index][1];
    });
    db.updateDataBase();
  }


///save new task
  void saveNewTask (){
    setState(() {
      db.ToDoList.add([
        _controller.text, false
      ]);
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  ///create new task
  void createNewTask () {
    showDialog(
      context: context,
       builder: (context) {
        return DialogeBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
       }
      );
  }

  ///delete task
  void deleteTask (int index) {
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 95, 197),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 115, 255),
        title: Text("To Do App",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,),
        elevation: 100,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: CircleBorder(),
        child: Icon(Icons.add),
        ),

      body: ListView.builder(
          itemCount: db.ToDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile (
              taskName: db.ToDoList[index][0],
              taskCompleted: db.ToDoList[index][1],
              onChanged: (value) => checkBoxChanged (value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
      ),
    );
  }
}
