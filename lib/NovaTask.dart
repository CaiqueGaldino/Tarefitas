import 'package:flutter/material.dart';
import 'package:tarefas/constants.dart';

class NovaTask extends StatelessWidget {
  //final int bgColor;
  final controller;
  final void Function(int) onSave;
  VoidCallback onCancel;

  var _cor = 0;

  void alterarCor(int value){
    _cor = value;
  }
  NovaTask(
      {super.key,
     // required this.bgColor,
      required this.controller,
      required this.onCancel,
      required this.onSave});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            
            onSave(_cor);
          }, child: const Icon(Icons.save_rounded)),
      body: Stack(
        fit: StackFit.loose,
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(color: Colors.deepOrange),
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Colors.white70),
                        child: IconButton(
                          onPressed: onCancel,
                          icon: const Icon(Icons.close_rounded),
                        )),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "Criar nova task",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 26,
                          fontFamily: primaryFont),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.orangeAccent),
              child: Padding(
                padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Titulo",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: primaryFont),
                    ),
                    TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        
                          border: OutlineInputBorder(),
                          hintText: "'Nova Tarefa'",
                          hintStyle: TextStyle(
                              fontFamily: primaryFont, color: Colors.black12)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(onPressed: ()=>alterarCor(0), icon: Icon(Icons.circle), color: Colors.amber,iconSize: 40,splashRadius: 10),
                        IconButton(onPressed: ()=>alterarCor(1), icon: Icon(Icons.circle), color: Colors.green,iconSize: 40,splashRadius: 10),
                        IconButton(onPressed: ()=>alterarCor(2), icon: Icon(Icons.circle), color: Colors.blue,iconSize: 40,splashRadius: 10),
                        IconButton(onPressed: ()=>alterarCor(3), icon: Icon(Icons.circle), color: Colors.red,iconSize: 40,splashRadius: 10),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
