import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Menu_view.dart';
import 'package:scaled_list/scaled_list.dart';

class Cate1 extends StatelessWidget {
  Cate1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category 1'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Menu_view()),
                (route) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
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
                      const SizedBox(height: 15),
                      Text(
                        category.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: selectedIndex == index ? 25 : 20,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.white,
                child: const Text('''
          Column(
          children: [
            Center(
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
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => category.link(),
                          ));
                        },
                        child:
                      Container(
                        height: selectedIndex == index ? 100 : 80,
                      ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        category.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: selectedIndex == index ? 25 : 20,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),



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
    Category(
      name: "Beef",
    ),
    Category(
      name: "Chicken",
    ),
    Category(
      name: "Dessert",
    ),
    Category(name: "Lamb"),
    Category(name: "Pasta"),
  ];
}

class Category {
  final String name;

  Category({required this.name}) {}
}


                '''),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Color> kMixedColors = [
    const Color(0xff71A5D7),
    const Color(0xff72CCD4),
    const Color(0xffFBAB57),
    const Color(0xffF8B993),
    const Color(0xff962D17),
    const Color(0xffc657fb),
    const Color(0xfffb8457),
  ];

  final List<Category> categories = [
    Category(
      name: "Beef",
    ),
    Category(
      name: "Chicken",
    ),
    Category(
      name: "Dessert",
    ),
    Category(name: "Lamb"),
    Category(name: "Pasta"),
  ];
}

class Category {
  final String name;

  Category({required this.name});
}
