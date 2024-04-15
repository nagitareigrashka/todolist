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

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Меню')),
          body: Row(
            children: [
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }, child: const Text('На главную')),
              const Padding(padding: EdgeInsets.only(left: 15)),
              const Text('Наше простое меню')
            ],
          ),
        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Список дел'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _menuOpen,
              icon: const Icon(Icons.menu_outlined)
          ),
        ],
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
