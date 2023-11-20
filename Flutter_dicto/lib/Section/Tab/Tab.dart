import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Tab/Tab1.dart';
import 'package:flutter_dicto/Section/Tab/Tab2.dart';
import 'package:flutter_dicto/Section/Tab/Tab3.dart';

class Tab_view1 extends StatelessWidget {
  const Tab_view1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120), // Set the preferred height
          child: AppBar(
            title: Text('TSDC-Rules'),
            backgroundColor: Color(0xFF252493),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(90), // Set the preferred height of TabBar
              child: Container(
                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TabBar(
                    indicatorWeight: 20,
                    labelColor: Color(0xFF252493),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF252493), // Set the underline color
                          width: 2.0, // Set the underline width
                        ),
                      ),
                    ),
                    tabs: [
                      Text('Tab1'),
                      Text('Tab2'),
                      Text('Tab3'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Tab1(),
            Tab2(),
            Tab3()
          ],
        ),
      ),
    );
  }
}
