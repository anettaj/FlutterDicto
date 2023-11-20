import 'package:flutter/material.dart';

class Color_view extends StatelessWidget {
  const Color_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color'),
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        child: Text('Color(0xFF252493)',
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}
