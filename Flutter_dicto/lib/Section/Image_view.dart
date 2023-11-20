import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Image/Image1.dart';
import 'package:flutter_dicto/Section/Image/Image2.dart';
import 'package:flutter_dicto/Widgets/Size.dart';
import 'package:flutter_dicto/main.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';


class Image_view extends StatelessWidget {
  Image_view({Key? key}) : super(key: key);


  final List<Widget> ImageCard = <Widget>[
    ImageCards(
      color: Color(0xFFffd22b),
      title: "Image Sliding",
      link: () => Image1(),
      image: 'assets/images/image1.gif',
    ),
    ImageCards(
      color: Color(0xFFfeb204),
      title: "Categories",
      link: () => Image2(),
      image: 'assets/images/image2.png',
    ),
    // ImageCards(
    //   color: Color(0xFFff8503),
    //   title: "Go for a walk!",
    //   link: () => Image2(),
    //   image: 'assets/images/image1.gif',
    // ),
    // ImageCards(
    //   color: Color(0xFFd53600),
    //   title: "Try teleportation!",
    //   link: () => Image2(),
    //   image: 'assets/images/image1.gif',
    // ),
    // ImageCards(
    //   color: Color(0xFF700e01),
    //   title: "Enjoy your coffee!",
    //   link: () => Image2(),
    //   image: 'assets/images/image1.gif',
    // ),
    // ImageCards(
    //   color: Color(0xFF7e261a),
    //   title: "Play with your cat!",
    //   link: () => Image2(),
    //   image: 'assets/images/image1.gif',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    double H= ScreenSize.Height(context);
    double W= ScreenSize.Height(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC69749),
        title: Text(
          'Image viwer',
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
      body: ListView(
        children: ImageCard,
      ),
    );
  }
}

class ImageCards extends StatelessWidget {
  const ImageCards({
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
    double H= ScreenSize.Height(context);
    double W= ScreenSize.Height(context);    return Container(
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
              alignment: AlignmentDirectional.centerStart,

              color: color,
              height: H/3,
              width:W,
              child:  Image.asset(
                '$image',
                fit: BoxFit.fitHeight,

              ),

            ),
            Positioned(
                right: 50,
                child: Text('$image')
            ),

          ],
        ),
      ),
    );
  }
}
