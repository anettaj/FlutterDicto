import 'package:flutter/material.dart';

import '../../Popup_view.dart';

class Popup1 extends StatefulWidget {
  const Popup1({super.key});

  @override
  State<Popup1> createState() => _Popup1State();
}

class _Popup1State extends State<Popup1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFFC69749),
        title: const Text('WillPopScope'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Popup_view()),
                    (route) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10,left: 10),
          margin: EdgeInsets.only(top: 10,left: 10),
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Text('''
     WillPopScope(
      onWillPop: () async{
        return await Get.dialog(
            AlertDialog(
              title: Text("Closing the app"),
              content: Text("Are you sure you want to close the app ? "),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Get.back(
                          result: true
                      );
                    },
                    child: Text("close")
                ),
                ElevatedButton(
                    onPressed: (){
                      Get.back();
                    },
                    child: Text("cancel")
                )
              ],
            )
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFC69749),
          title: const Text(
            'Contact us1',
          ),
          leading: IconButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>Form_view()
                  ),
                      (route)=>false
              );
            },
            icon: const Icon(
                Icons.arrow_back
            ),
          ),),
        ),
      );
        '''),
        ),
      ),
    );
  }
}










