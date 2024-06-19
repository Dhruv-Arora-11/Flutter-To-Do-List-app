import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  bool? taskCompleted = false;
  final VoidCallback onLongPress;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
      child: Row(
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              return Checkbox(
                value: taskCompleted,
                onChanged: (newValue) {
                  setState(() {
                    taskCompleted = newValue!;
                  });
                },
              );
            },
          ),
          Expanded(
            child: GestureDetector(
              onLongPress: onLongPress,
              child: Container(
                padding: EdgeInsets.all(25),
                child: Text(taskName),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 13.0,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                alignment: Alignment.centerRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
