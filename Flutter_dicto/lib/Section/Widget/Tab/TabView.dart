import 'package:flutter/material.dart';

import '../../../Widgets/Size.dart';
import 'Tab1.dart';
import 'Tab2.dart';
import 'Tab3.dart';
class Tab_view2 extends StatefulWidget {
  const Tab_view2({super.key});

  @override
  State<Tab_view2> createState() => _Tab_view2State();
}

class _Tab_view2State extends State<Tab_view2> {
  @override
  Widget build(BuildContext context) {
    double H = ScreenSize.Height(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: //Categories Section

          DefaultTabController(
            length: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  labelColor: Color(0xFF000000),
                  unselectedLabelColor: Colors.grey,
                  labelPadding: EdgeInsets.only(left: 12,right: 12),
                  indicatorColor: Color(0xFF000000),
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2.0),
                      insets: EdgeInsets.symmetric(horizontal:20.0)
                  ),
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.only(left: 19),
                      child: Tab(text: 'Camera Bag'),
                    ),
                    Tab(text: 'Lens Filter'),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Tab(text: 'Lens'),
                    ),
                  ],
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: H * 0.24,
                  child: TabBarView(
                    children: [
                      Tab1(),
                      Tab2(),
                      Tab3()
                    ],
                  ),
                ),
              ],
            ),
          ),

      ),
    );
  }
}
