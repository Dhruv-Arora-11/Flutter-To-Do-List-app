import 'package:flutter/material.dart';
import 'package:dhruv_travel_app/pages/splash_screen.dart';
import 'package:dhruv_travel_app/pages/home_page.dart';
import 'package:dhruv_travel_app/utilities/todotile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash_screen(),
    );
  }
}

void cancelButton(BuildContext context) {
  Navigator.pop(context);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskController = TextEditingController();
  List<TodoTile> todoList = []; // List to hold tasks

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void saveButton() {
    setState(() {
      String taskName = taskController.text;
      taskController.clear();
      todoList.add(
        TodoTile(
          taskName: taskName,
          taskCompleted: false,
          onLongPress: () {
            deleteTask(todoList.length - 1);
          },
        ),
      ); // Add new task to the list
      Navigator.pop(context);
    });
  }

  void addTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 500,
          title: const Text(
            "Add new task",
            style: TextStyle(fontSize: 20),
          ),
          content: Container(
            height: 60,
            width: 120,
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter the task",
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: saveButton,
              child: const Text("Save"),
            ),
            TextButton(
              onPressed: () {
                cancelButton(context);
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTask(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 35,
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 70,
            width: 500,

            color: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(15 , 15 , 0 ,15),
                child: Text(
                  "To-do List",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ...todoList.asMap().entries.map((entry) {
            int index = entry.key;
            TodoTile tile = entry.value;
            return TodoTile(
              taskName: tile.taskName,
              taskCompleted: tile.taskCompleted,
              onLongPress: () {
                deleteTask(index);
              },
            );
          }).toList(), // Spread operator to include all tasks in the list
        ],
      ),
    );
  }
}
