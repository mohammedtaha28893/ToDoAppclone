import 'package:flutter/material.dart';
import 'package:food/utilities/my_button.dart';

class DialogeBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogeBox(
    {
      super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel
      }
    );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //backgroundColor: const Color.fromARGB(255, 161, 199, 255),
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          ///get user input
          
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task.",
            ),
          ),

          ///buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Save", onPressed: onSave),

              const SizedBox(width: 8,),

              MyButton(text: "Cancel", onPressed: onCancel)
            ],
          )
          ],
        ),
      ),
    );
  }
}