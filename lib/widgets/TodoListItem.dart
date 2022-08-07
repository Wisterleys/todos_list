import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:slidable_bar/slidable_bar.dart';

import '../model/todo_mock.dart';

class TodoListItem extends StatelessWidget {
  TodoListItem({Key? key, required this.todo}) : super(key: key);
  
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                todo.title,
                todo.date,
              ],
            ),
            ),
        ],
      ),
    ),
      );
  }
}