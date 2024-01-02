import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Menu/Cate1.dart';
import 'package:flutter_dicto/Section/Package/Gap_package.dart';
import 'package:flutter_dicto/Section/Package/Pdf_viewer.dart';
import 'package:flutter_dicto/Section/Package/Scartcher.dart';
import 'package:flutter_dicto/Section/Package/WebView.dart';
import 'package:flutter_dicto/Widgets/Size.dart';
import 'package:flutter_dicto/main.dart';

class Package_view extends StatelessWidget {
  Package_view({super.key});

  final List<Widget> fancyCards = <Widget>[
    FancyCard(
      color: Color(0xFFffd22b),
      title: "Gap.dart",
      link: () => Gap_package(),
      image: 'assets/Package/gap.png',
    ),
    FancyCard(
      color: Color(0xFFfeb204),
      title: "scratcher.dart",
      link: () => ScratcherCard(),
      image: 'assets/Package/Scratcher.gif',
    ),
    FancyCard(
      color: Color(0xFFff8503),
      title: "webview_flutter.dart",
      link: () => WebViewExample(),
      image: 'assets/Package/webview_flutter.jpg',
    ),
    FancyCard(
      color: Color(0xFFd53600),
      title: "pdfviewer.dart",
      link: () => Pdf_viewer(),
      image: 'assets/Package/pdfviewer.jpg',
    ),
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
        backgroundColor: Color(0xFFC69749),
        title: Text('Package_view'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
              (route) => false /* No Back option */,
            );
          },
          icon: Icon(Icons.arrow_back),
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
    Key? key,
    required this.color,
    required this.title,
    required this.link,
    required this.image,
  }) : super(key: key);

  final String title;
  final Widget Function() link;
  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    double H = ScreenSize.Height(context);
    double W = ScreenSize.Height(context);
    return Container(
      margin: EdgeInsets.all(20.0),
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
                '$image',
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
                child: Container(
              color: Colors.black45,
              child: Center(
                child: Text(
                  '$title',
                  style: TextStyle(
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
