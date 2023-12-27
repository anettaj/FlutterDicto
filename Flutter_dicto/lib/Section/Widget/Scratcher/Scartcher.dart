import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class Scratcher extends StatefulWidget {
  const Scratcher({Key?key});

  @override
  State<Scratcher> createState() => _ScratcherState();
}

class _ScratcherState extends State<Scratcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scratcher(
          brushSize: 30,
          threshold: 50,
          color: Colors.red,
          onChange: (value) => print("Scratch progress: $value%"),
          onThreshold: () => print("Threshold reached, you won!"),
          child: Container(
            height: 300,
            width: 300,
            color: Colors.blue,
          ),
        ),
    );
  }

}
