import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane (
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.amber,
            borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              ///CheckBox
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
                ),
        
              ///Task 1
              Text(taskName,
              style: TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.w500, 
                decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none)),
            ],
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            )
            ),
        ),
      ),
    );
  }
}
