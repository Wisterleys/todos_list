

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:twoto_do_list/widgets/widgets.dart';

import '../../model/todo_mock.dart';
import '../../repositories/repositories.dart';

class TodoListPage extends StatefulWidget{
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController todoController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  List<Todo> todos =[];
  late Todo del;
  late int index;
@override
void initState(){
  super.initState();

  todoRepository.getTodoList().then((value){
    print("rodou");
    setState((){
      todos = value;
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        title: todoController.text,
                        date: DateTime.now(), 
                      );
                      todos.add(todo);
                      todoRepository.saveTodoList(todos);
                      setState(() {
                        todos;
                        todoController.text = '';
                      });
                  }, 
                  child: Icon(Icons.add))
                  ],
                ),
                SizedBox(height: 16,),
                Flexible(
                  child: ListView(
                  shrinkWrap: true,
                  children: [
                  for (Todo todo in todos)
                    TodoListItem(todo:todo,itemDelete: itemDelete,itemDes: itemDes,),
                  ],
                ), 
                ),
                Row(
                  children: [
                    Text("Total ${todos.length}"),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      onPressed: (){
                        modalClean();                  
                      },
                      child: Text("Limpar tudo"),
                      ), 
                  ],
                )
              ],
            ) ,
              )
        
      );
    
  }

  void itemDelete(Todo todo){
    index = todos.indexOf(todo);
    del = todo;
    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveTodoList(todos);
  }
  void itemDes(){
    
    setState(() {
      todos.insert(index, del);
    });
    todoRepository.saveTodoList(todos);
  }
  void modalClean(){
    showDialog(
    context: context,
      builder: (context)=>AlertDialog(
      title: Text("Deletar tudo?"),
      content: Text("Tem certeza que deseja deletar todas as tarefas?"),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
            
              setState(() {
                todos.clear();
              });
              todoRepository.saveTodoList(todos);
          }, 
          child: Text("Limpar tudo", style: TextStyle(color: Colors.red))
        ),
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
            
          }, 
          child: Text("Cancelar", style: TextStyle(color: Color.fromARGB(255, 42, 6, 206)))
        ),
      ],
      ),
    );
  }
}