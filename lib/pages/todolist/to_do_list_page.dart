import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({Key? key}) : super(key: key);
  TextEditingController todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Lista de tarefas"),
            )
            ),
            body: Column(
              children: [
                Row(
                  children: [
                   Expanded(child: TextField(
                  controller: todoController,
                  decoration: InputDecoration(
                    labelText: "Digite seu item",
                    prefix: Icon(Icons.abc_rounded)
                  ),
                ),
                ),
                ElevatedButton(
                  onPressed: (){}, 
                  child: Icon(Icons.add))
                  ],
                ),
                SizedBox(height: 16,),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: Text('Lista 1'),
                      subtitle: Text("Testando"),
                    )
                  ],
                ),
              ],
            ) ,
        

      ),

    );
  }
}