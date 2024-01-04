import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tarefas/constants.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final String? start;
  final String? end;
  final int bgColor;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleFunction;
  final String? note;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      this.start,
      this.end,
      required this.bgColor,
      required this.onChanged,
      required this.deleFunction, this.note});

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
              color:Paleta[1], borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3)
                )
              ],),
              
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
            Container(
              decoration: BoxDecoration(
                color: ColorsList[bgColor],
                shape: BoxShape.circle
              ),
              alignment: Alignment.centerRight,
              height: 30,
              width: 30,
            )
          ]),
        ),
      ),
    );
  }
}
