import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Widget_view.dart';
import 'Tab1.dart';
import 'Tab2.dart';
import 'Tab3.dart';

class Tab_view1 extends StatelessWidget {
  const Tab_view1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120), // Set the preferred height
          child: AppBar(
            backgroundColor: const Color(0xFFC69749),
            title: const Text('Tab bar'),
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

            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(90), // Set the preferred height of TabBar
              child: Container(
                color: Colors.white,

                child: const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TabBar(
                    indicatorWeight: 20,
                    labelColor: Color(0xFFC69749),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFC69749), // Set the underline color
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
        body: const TabBarView(
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
