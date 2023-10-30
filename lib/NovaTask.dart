import 'package:flutter/material.dart';
import 'package:tarefas/constants.dart';

class NovaTask extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  NovaTask(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onSave,
        child: Icon(Icons.save_rounded)),
      
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
              decoration: BoxDecoration(color: Colors.deepOrange),
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
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
                          icon: Icon(Icons.close_rounded),
                        )),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Criar nova task",
                      style: TextStyle(color: Colors.white70, fontSize: 26, fontFamily: primaryFont),
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.orangeAccent),
              child: Padding(
                padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Titulo",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontFamily: primaryFont),
                    ),
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(border: OutlineInputBorder(),hintText: "'Beber água'", hintStyle: TextStyle(fontFamily: primaryFont, color: Colors.black12)),
                    ),
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
