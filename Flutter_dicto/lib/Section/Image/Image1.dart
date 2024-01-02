import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Image_view.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class Image1 extends StatefulWidget {
  @override
  _Image1State createState() => _Image1State();
}

class _Image1State extends State<Image1> {
  final List<String> titles = [
    "RED",
    "YELLOW",
    "CYAN",
    "BLUE",
    "GREY",
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> images = [
      Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vertical Card Pager',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Image_view()),
                (route) => false);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body:
          // SafeArea(
          //   bottom: true,
          //   child:
          Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: VerticalCardPager(
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                titles: titles,
                images: images,
                onPageChanged: (page) {},
                align: ALIGN.CENTER,
                onSelectedItem: (index) {},
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Text('''
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  textStyle: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold
                      ),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {},
                  align: ALIGN.CENTER,
                  onSelectedItem: (index) {},
                ),
              ),
            ),
            
            
                final List<Widget> images = [
      Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ];

final List<String> titles = [
    "RED",
    "YELLOW",
    "CYAN",
    "BLUE",
    "GREY",
  ];

            '''),
                ),
              ),
            ),
          )
        ],
      ),
      // ),
    );
  }
}
