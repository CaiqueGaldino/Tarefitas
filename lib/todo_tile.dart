import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tarefas/constants.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final String? start;
  final String? end;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      this.start,
      this.end,
      required this.onChanged,
      required this.deleFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleFunction,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            Checkbox(
              
              splashRadius: Checkbox.width,
              shape: CircleBorder(),
              checkColor: Colors.amber,
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskName,
                  style: TextStyle(
                    fontFamily: primaryFont,
                      fontSize: 16,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none
                          ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      start.toString(),
                      style: const TextStyle(
                        fontFamily: primaryFont,
                        fontSize: 10,
                      ),
                    ),
                    Text("   "),
                    Text(
                      end.toString(),
                      style: const TextStyle(
                        fontFamily: primaryFont,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
