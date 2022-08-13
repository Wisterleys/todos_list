import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/todo_mock.dart';

class TodoListItem extends StatelessWidget {
  TodoListItem({Key? key, required this.todo,required this.itemDelete}) : super(key: key);
  final Todo todo;
  void Function(Todo todo) itemDelete;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          todo.title,
          todo.date,
        ],
      ),
    ), 
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          icon: Icons.delete,
          onTap: (){
            itemDelete(todo);
          },
        )
      ],
      );
  }
}