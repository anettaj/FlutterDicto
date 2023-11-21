import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_dicto/main.dart';

class Pdf_viewer extends StatelessWidget {
  const Pdf_viewer({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pdf Viewer'),
          leading: IconButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>MyHomePage()

                  ),
                      (route)=>false
              );
            },
            icon: Icon(
                Icons.arrow_back
            ),
          ),
        ),
        body:SfPdfViewer.network('https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf')

    );
  }
}
