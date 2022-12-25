import 'package:flutter/material.dart';
import 'package:todo_em/utility/my_button.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lime[300],
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                focusColor: Colors.black12,
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "save",
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 6,
                ),
                MyButton(
                  text: "cancel",
                  onPressed: onCancel,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
