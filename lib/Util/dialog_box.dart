import 'package:flutter/material.dart';
import 'package:to_do_app/Util/my_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  final VoidCallback onSave;
  final VoidCallback oncancel;

   DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.oncancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[300],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Get user input

            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task over here.",
              ),
            ),

            // buttons => Save + Cancel button
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              //save button
              MyButton(text: "Save", onPressed: onSave,),

              const SizedBox(width: 8),

              //cancel button
              MyButton(text: "Cancel", onPressed: oncancel),

            ],)

          ],
        ),
      ),
    );
  }
}
