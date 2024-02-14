import 'package:flutter/material.dart';
import '../Image_view.dart';
import 'data.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  var H;
  var W;

  @override
  Widget build(BuildContext context) {
    H=MediaQuery.of(context).size.height;
    W=MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text('Image Slider'),
          leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Image_view()),
                      (route) => false);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
      body:Column(
        children: [
          SizedBox(
          height: H*0.5,
          width: W,
          child:PageView(

            scrollDirection: Axis.horizontal,
            children: featuredGames.map((_game){
              return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(_game.coverImage.url)
                      )
                  ));
            }).toList(),)



      )
        ],
      )
    );
  }
}
