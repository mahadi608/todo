import 'package:flutter/material.dart';
import 'package:todo_em/utility/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

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
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "save",
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 6,
                ),
                MyButton(
                  text: "cancel",
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
