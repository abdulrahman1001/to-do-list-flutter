
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todecard extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function changeStatus;
  final Function deleteTask; // Add a function for deleting tasks
  final int index;

  const Todecard({
    Key? key,
    required this.vartitle,
    required this.changeStatus,
    required this.deleteTask,
    required this.index,
    required this.doneORnot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  color: doneORnot ? Colors.black : Colors.white,
                  decoration:
                      doneORnot ? TextDecoration.lineThrough : TextDecoration.none,
                  fontSize: 22,
                ),
              ),
              Row(
                children: [
                  Icon(
                    doneORnot ? Icons.check : Icons.close,
                    size: 27,
                    color: doneORnot ? Colors.green[400] : Colors.red,
                  ),
                  SizedBox(width: 20,),
                  IconButton(
                    onPressed: () {
                      // Call the deleteTask function and pass the index
                      deleteTask(index);
                    },
                    icon: Icon(Icons.delete, color: Colors.white, size: 30),
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(11),
          ),
        ),
      ),
    );
  }
}
