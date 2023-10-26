import 'package:flutter/material.dart';
import 'package:tarefas/botao.dart';

class DialogBox extends StatelessWidget {
  final controler;

  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, required this.controler, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amberAccent,
      content: SizedBox(
        height: 120,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controler,
            decoration: InputDecoration(border: OutlineInputBorder(),
            hintText: "Nova Tarefa"),
            
          ),
Row(mainAxisAlignment: MainAxisAlignment.end,
  children: [
  Botao(text: "Add", onPressed: onSave),
  SizedBox(width: 10,),
  Botao(text: "Cancelar", onPressed: onCancel),
],)
        ],),
      ),
    );
  }
}