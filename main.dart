import 'package:flutter/material.dart';
import 'package:flutter_application_1/counter.dart';

import 'to.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class _TodoAppState extends State<TodoApp> {
  List<Task> allTasks = [];

  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }
  delete(int index){
    setState(() {
     allTasks.removeAt(index);
    });
  }

  addnewtask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

  final myController = TextEditingController();

  int calculateCompletedTasks() {
    int completedTasks = 0;

    allTasks.forEach((item) {
      if (item.status) {
        completedTasks++;
      }
    });

    return completedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Container(
                  padding: EdgeInsets.all(22),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 50,
                        decoration: InputDecoration(hintText: "Add new Task"),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                        onPressed: () {
                          addnewtask();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(fontSize: 22),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "TO DO APP",
          style: TextStyle(
              fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions:[ IconButton(onPressed: (){
          setState(() {
            allTasks.clear();
          });
          
        },icon: Icon(Icons.delete_forever,size: 40,)),]
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
              allTodos: allTasks.length,
              allCompleted: calculateCompletedTasks(),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 22),
                color: Color.fromARGB(255, 55, 63, 82),
                child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todecard(
                      vartitle: allTasks[index].title,
                      doneORnot: allTasks[index].status,
                      changeStatus: changeStatus,
                      index: index,
                      deleteTask: delete,
                   
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
