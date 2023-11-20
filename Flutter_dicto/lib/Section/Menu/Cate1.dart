import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Menu_view.dart';
import 'package:scaled_list/scaled_list.dart';


class Cate1 extends StatelessWidget {
   Cate1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category 1'),
        leading: IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context)=>Menu_view()

                ),
                    (route)=>false
            );
          },
          icon: Icon(
              Icons.arrow_back
          ),
        ),
      ),
      body: Center(
        child: ScaledList(
          itemCount: categories.length,
          itemColor: (index) {
            return kMixedColors[index % kMixedColors.length];
          },
          itemBuilder: (index, selectedIndex) {
            final category = categories[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // InkWell(
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => category.link(),
                //     ));
                //   },
                //   child:
                  Container(
                    height: selectedIndex == index ? 100 : 80,

                  ),
               // ),
                SizedBox(height: 15),
                Text(
                  category.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: selectedIndex == index ? 25 : 20,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  final List<Color> kMixedColors = [
    Color(0xff71A5D7),
    Color(0xff72CCD4),
    Color(0xffFBAB57),
    Color(0xffF8B993),
    Color(0xff962D17),
    Color(0xffc657fb),
    Color(0xfffb8457),
  ];

  final List<Category> categories = [
    Category(name: "Beef", ),
    Category(name: "Chicken",),
    Category(name: "Dessert",),
    Category(name: "Lamb"),
    Category(name: "Pasta"),
  ];
}

class Category {
  final String name;


  Category({required this.name}) {

  }
}
