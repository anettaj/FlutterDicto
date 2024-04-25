import 'package:flutter/material.dart';

import '../../Widget_view.dart';

class Color_view extends StatelessWidget {
  const Color_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC69749),
        title: const Text(
          'Color',
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context)=>Widget_card()

                ),
                    (route)=>false
            );
          },
          icon: const Icon(
              Icons.arrow_back
          ),
        ),
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        child: const Text('Color(0xFF252493)',
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}
