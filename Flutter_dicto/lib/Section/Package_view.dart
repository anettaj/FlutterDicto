import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Package/Gap_package.dart';
import 'package:flutter_dicto/Section/Package/Scartcher.dart';
import 'package:flutter_dicto/Widgets/Size.dart';
import 'package:flutter_dicto/main.dart';
import './Package/DayAndNight.dart';
import 'Package/Animation1.dart';

class Package_view extends StatelessWidget {
  Package_view({super.key});

  final List<Widget> fancyCards = <Widget>[
    FancyCard(
      color: const Color(0xFFffd22b),
      title: "Gap.dart",
      link: () => const Gap_package(),
      image: 'assets/Package/gap.png',
    ),
    FancyCard(
      color: const Color(0xFFfeb204),
      title: "scratcher.dart",
      link: () => const ScratcherCard(),
      image: 'assets/Package/Scratcher.gif',
    ),
    // FancyCard(
    //   color: const Color(0xFFff8503),
    //   title: "webview_flutter.dart",
    //   link: () => WebViewExample(),
    //   image: 'assets/Package/webview_flutter.jpg',
    // ),
    FancyCard(
      color: const Color(0xFFd53600),
      title: "day_night_switch.dart",
      link: () =>const DayAndNight(),
      image: 'assets/Package/DayNight.gif',
    ),
    FancyCard(
      color:const Color(0xFFffd22b),
      title: "widget_and_text_animator.dart",
      link: () =>const Animation1(),
      image: 'assets/Package/animation1.gif',
    ),
    // FancyCard(
    //   color: Color(0xFFd53600),
    //   title: "pdfviewer.dart",
    //   link: () => Pdf_viewer(),
    //   image: 'assets/Package/pdfviewer.jpg',
    // ),
    // FancyCard(
    //   color: Color(0xFFffd22b),
    //   title: "Image Sliding",
    //   link: () => Cate1(),
    //   image: 'assets/images/image1.gif',
    // ),
    // FancyCard(
    //   color: Color(0xFFffd22b),
    //   title: "Image Sliding",
    //   link: () => Cate1(),
    //   image: 'assets/images/image1.gif',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC69749),
        title: const Text('Package_view'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
              (route) => false /* No Back option */,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: fancyCards,
      ),
    );
  }
}

class FancyCard extends StatelessWidget {
  const FancyCard({
    super.key,
    required this.color,
    required this.title,
    required this.link,
    required this.image,
  });

  final String title;
  final Widget Function() link;
  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    double H = ScreenSize.Height(context);
    double W = ScreenSize.Height(context);
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => link(),
            ),
            (route) => false /* No Back option */,
          );
        },
        child: Stack(
          children: <Widget>[
            Container(
              color: color,
              height: H / 3,
              width: W,
              alignment: AlignmentDirectional.center,
              child: Image.asset(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
                child: Container(
              color: Colors.black45,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
