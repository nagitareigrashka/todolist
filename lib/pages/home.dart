import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  late String _userToDo;
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(['Buy milk', 'Wash dishes', 'Купить картошку']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Список дел'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(
                      title: Text(todoList[index]),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  todoList.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.delete_sweep,
                                color: Colors.deepOrangeAccent,
                              ),
                          ),
                  ),
                ),
                onDismissed: (direction){
                  //if(direction == DismissDirection.startToEnd)
                  setState(() {
                    todoList.removeAt(index);
                  });
                },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Добавить элемент'),
                content: TextField(
                  onChanged: (String value) {
                    _userToDo = value;
                  },
                ),
                actions: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      todoList.add(_userToDo);
                    });
                    Navigator.of(context).pop();
                  }, child: const Text('Добавить'))
                ],
              );
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
      ),
    );
  }
}
