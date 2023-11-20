import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Image_view.dart';
import 'package:flutter_dicto/Widgets/Size.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
class Image2 extends StatelessWidget {
  const Image2({super.key});

  @override
  Widget build(BuildContext context) {
    double H= ScreenSize.Height(context);
    double W= ScreenSize.Width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Slider'),
        leading: IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context)=>Image_view()

                ),
                    (route)=>false
            );
          },
          icon: Icon(
              Icons.arrow_back
          ),
        ),
      ),
      body: Container(
        width: W,
        height: H/2,

        child: ImageSlideshow(

          indicatorColor: Colors.blue,
          onPageChanged: (value) {
            debugPrint('Page changed: $value');
          },
          autoPlayInterval: 60000,
          isLoop: true,
          children: [
            Image.network(
              'http://atstesting.in/software/images/slider/slide1.jpeg',
              fit: BoxFit.cover,
            ),

            Image.network(
              'http://atstesting.in/software/images/slider/slide2.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
