import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/modal.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            builder: (context) => Modal(
              onSave: (taskName) {
                setState(() => todoList.insert(0, [taskName, false]));
                Navigator.of(context).pop();
              },
              onCancel: () => Navigator.of(context).pop(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(const Duration(milliseconds: 500));
            },
            child: todoList.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.warning_rounded,
                            size: 45, color: Colors.amber),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Add some todo",
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return TodoTile(
                        taskName: todoList[index][0],
                        isCompleted: todoList[index][1],
                        onChanged: () => setState(
                          () => todoList[index][1] = !todoList[index][1],
                        ),
                        onDelete: () {
                          setState(() {
                            todoList.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
