import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:twoto_do_list/widgets/TodoListItem.dart';

import '../../model/todo_mock.dart';

class TodoListPage extends StatefulWidget{
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController todoController = TextEditingController();

  List<Todo> todos =[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Lista de tarefas"),
            )
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                   Expanded(child: TextField(
                  controller: todoController,
                  decoration: InputDecoration(
                    labelText: "Digite seu item",
                    prefix: Icon(Icons.save)
                  ),
                ),
                ),
                ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.all(25)
                  ),
                  onPressed: (){
                      Todo todo = Todo(
                        title: Text(todoController.text),
                        date: Text(DateFormat('dd/mm/yyyy').format(DateTime.now())), 
                      );
                      todos.add(todo);
                      setState(() {
                        todos;
                        todoController.text = '';
                      });
                  }, 
                  child: Icon(Icons.add))
                  ],
                ),
                SizedBox(height: 16,),
                ListView(
                  shrinkWrap: true,
                  children: [
                  for (Todo todo in todos)
                    TodoListItem(todo:todo),
                  ],
                ),
                Row(
                  children: [
                    Text("Total ${todos.length}"),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      onPressed: (){
                        todos.clear();
                        setState(() {
                          todos;
                        });
                      },
                      child: Text("Limpar tudo"),
                      ), 
                  ],
                )
              ],
            ) ,
              )
        
      ),

    );
    
  }
}