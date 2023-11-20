import 'package:flutter/material.dart';

import '../../Widgets/Size.dart';
import '../../main.dart';
class List1 extends StatelessWidget {
  const List1({super.key});

  @override
  Widget build(BuildContext context) {
    double H= ScreenSize.Height(context);
    double W= ScreenSize.Height(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC69749),
        title: Text(
          'ListTile',
        ),
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
      body:  Container(

        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        height: H*0.35,
        decoration: BoxDecoration(
            color: Colors.grey,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tamil Nadu dental council',
              style: TextStyle(
                  fontSize: 18
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('044 2363 8476'),
            ),
            ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text('tndental107@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text('5-0-3, Arihant Majestic Towers,\n216, 100 Feet Rd, Jai Nagar,\nKoyambedu, Chennai,\nTamil Nadu 600107'),
            ),
          ],
        ),
      ),
    );
  }
}
