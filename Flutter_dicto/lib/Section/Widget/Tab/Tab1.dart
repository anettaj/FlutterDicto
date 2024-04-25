import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tablets"),
        ],
      ),
    );
  }
}
