import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Color/Color.dart';
import 'package:flutter_dicto/Section/Grid/Grid_count.dart';
import 'package:flutter_dicto/Section/Image_view.dart';
import 'package:flutter_dicto/Section/Menu_view.dart';
import 'package:flutter_dicto/Widgets/Size.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dictionary',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Color(0xFF2C3333),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);


  final List<Widget> fancyCards = <Widget>[
    FancyCard(
      title: "Image View",
      link: Image_view(),
    ),
    FancyCard(
      title: "Menu view",
      link:Menu_view(),
    ),
    FancyCard(
      title: "Color",
      link: Color_view(),
    ),
    FancyCard(
      title: "Grid",
      link:  Grid_count(),
    ),
    // FancyCard(
    //   title: "Enjoy your coffee!",
    //   link: Menu_view(),
    // ),
    // FancyCard(
    //
    //   title: "Play with your cat!",
    //   link: Menu_view(),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    double H= ScreenSize.Height(context);
    double W= ScreenSize.Height(context);    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC69749),
        title: Text(
          'Flutter Dicto'
        ),
      ),
      body: StackedCardCarousel(
        items: fancyCards,
      ),
    );
  }
}

class FancyCard extends StatelessWidget {
  const FancyCard({
    Key? key,
    required this.title,
    required this.link,
  }) : super(key: key);

  final String title;
  final Widget  link;


  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.of(context).size.height;
    double W = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => link,
          ));
        },
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/Folder.png',
              fit: BoxFit.fill,
              height: H * 0.4,
            ),
            Positioned(
              top: H / 8,
              left: H / 7,
              right: H / 8,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}