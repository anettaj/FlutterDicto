import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Widget_view.dart';

class Expansion_card extends StatefulWidget {
  const Expansion_card({super.key});

  @override
  State<Expansion_card> createState() => _Expansion_cardState();
}

class _Expansion_cardState extends State<Expansion_card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFC69749),
          title: const Text('Expansion text'),
          leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Widget_card()),
                  (route) => false);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: ExpansionTile(
                  title: const Text(
                    'Title',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                        wordSpacing: 2),
                  ),
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: const Text(
                        'Expanded Text',
                        textAlign: TextAlign.justify,
                        style: TextStyle(letterSpacing: 0.1, wordSpacing: 3),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: const Text('''
      Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border.all(
                      width: 1,
                      color: Colors.grey
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ExpansionTile(
                title: Text('Title',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      wordSpacing: 2
                  ),
                ),
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text('Expanded Text',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          letterSpacing: 0.1,
                          wordSpacing: 3
                      ),
                    ),
                  )
                ],
              ),
            ),
                        '''),
                ),
              )
            ],
          ),
        ));
  }
}
