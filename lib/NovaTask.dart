import 'package:flutter/material.dart';
import 'package:tarefas/constants.dart';

class NovaTask extends StatefulWidget {
  //final int bgColor;
  final controller;
  final controllerNote;
  final void Function(int) onSave;
  VoidCallback onCancel;
  NovaTask(
      {super.key,
      // required this.bgColor,
      required this.controller,
      required this.onCancel,
      required this.onSave, this.controllerNote});

  @override
  State<NovaTask> createState() => _NovaTaskState();
}

class _NovaTaskState extends State<NovaTask> {
  bool btselected = true;

  bool btselected1 = false;

  bool btselected2 = false;

  bool btselected3 = false;

  var _cor = 0;

  void alterarCor(int value) {
    _cor = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Paleta[4],
          onPressed: () {
            widget.onSave(_cor);
          },
          child: const Icon(Icons.save_rounded)),
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
              decoration: BoxDecoration(color: Paleta[3]),
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          onPressed: widget.onCancel,
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(
                      height: 30,
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
            top: 150,
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
                      controller: widget.controller,
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
                        IconButton(
                        
                          icon: btselected? Icon(Icons.check) : Icon(Icons.circle),
                          
                          color: Colors.amber,
                          iconSize: 40,
                          onPressed: () {
                            alterarCor(0);
                            setState(() {
                              btselected = true;
                              btselected1 = false;
                              btselected2 = false;
                              btselected3 = false;
                            });
                          
                          },
                        ),
                        IconButton(
                        
                          icon: btselected1? Icon(Icons.check) : Icon(Icons.circle),
                          
                          color: Colors.green,
                          iconSize: 40,
                          onPressed: () {
                            alterarCor(1);
                            setState(() {
                              btselected = false;
                              btselected1 = true;
                              btselected2 = false;
                              btselected3 = false;

                            });
                          
                          },
                        ),
                        IconButton(
                        
                          icon: btselected2? Icon(Icons.check) : Icon(Icons.circle),
                          
                          color: Colors.blue,
                          iconSize: 40,
                          onPressed: () {
                            alterarCor(1);
                            setState(() {
                              btselected = false;
                              btselected1 = false;
                              btselected2 = true;
                              btselected3 = false;

                            });
                          
                          },
                        ),
                        IconButton(
                        
                          icon: btselected3? Icon(Icons.check) : Icon(Icons.circle),
                          
                          color: Colors.red,
                          iconSize: 40,
                          onPressed: () {
                            alterarCor(3);
                            setState(() {
                              btselected = false;
                              btselected1 = false;
                              btselected2 = false;
                              btselected3 = true;

                            });
                          
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Nota',
                    style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: primaryFont),),
                    TextField(
                      controller: widget.controllerNote,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                              fontFamily: primaryFont, color: Colors.black12)),
                              minLines: 5,
                              maxLines: 7,
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
