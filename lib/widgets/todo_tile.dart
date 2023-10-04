import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  TodoTile({
    Key? key,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  final String taskName;
  final bool isCompleted;
  VoidCallback onChanged;
  VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        key: Key(taskName),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          extentRatio: 0.2,
          children: [
            SlidableAction(
              flex: 1,
              onPressed: (context) {
                onDelete();
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: ListTile(
          tileColor: Colors.yellow,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: () => onChanged(),
          leading: CupertinoCheckbox(
            value: isCompleted,
            activeColor: Colors.black,
            onChanged: (bool? value) {},
          ),
          title: Text(
            taskName,
            style: TextStyle(
              decoration: isCompleted ? TextDecoration.lineThrough : null,
              color: isCompleted ? Colors.grey : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
