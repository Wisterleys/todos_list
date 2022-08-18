import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../model/todo_mock.dart';

class TodoListItem extends StatelessWidget {
  TodoListItem({Key? key, required this.todo,required this.itemDelete,required this.itemDes}) : super(key: key);
  final Todo todo;
  void Function(Todo todo) itemDelete;
  void Function() itemDes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          icon: Icons.delete,
          caption: "Deletar",
          onTap: (){
            itemDelete(todo);
            var title = todo.title;
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 5),
                content: Text(
                  'Atarefa  $title foi removida com sucesso!',
                style: TextStyle(color: Colors.red),
                ),
                action: SnackBarAction(
                  label: "Desfazer",
                  onPressed: (){
                    itemDes();
                  },
                  ),
                )
              );
          },
        )
      ],
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(todo.title),
            Text(DateFormat('dd/mm/yyyy').format(todo.date)),
          ],
        ),
      ),
      ),
    );
  }
}