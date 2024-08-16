import 'package:hive/hive.dart';

class ToDoDataBase {

  List ToDoList = [];

  //refrence the hive box
  final _mybox = Hive.box('myBox');

  ///first time ever opening the app
  void createInitialData() {
    ToDoList = [
      ["Task 1", false],
      ["Task 2", false]
    ];
  }

  ///Load the data from database
  void loadData () {
    ToDoList = _mybox.get("TODOLIST");
  }

  ///Update the database
  void updateDataBase () {
    _mybox.put("TODOLIST", ToDoList);
  }

}