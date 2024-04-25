import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Image_view.dart';
import 'package:flutter_dicto/Widgets/Size.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Image2 extends StatelessWidget {
  const Image2({super.key});

  @override
  Widget build(BuildContext context) {
    double H = ScreenSize.Height(context);
    double W = ScreenSize.Width(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Slider'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Image_view()),
                (route) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: W,
              height: H / 2,
              child: ImageSlideshow(
                indicatorColor: Colors.blue,
                onPageChanged: (value) {
                  debugPrint('Page changed: $value');
                },
                autoPlayInterval: 60000,
                isLoop: true,
                children: [
                  Image.network(
                    'https://res.cloudinary.com/dljwalapq/image/upload/v1700756486/bh7i5dipormjhpgfwey5.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://res.cloudinary.com/dljwalapq/image/upload/v1700756486/jrz06ew2x9lxjxg7gabo.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: const Text('''
            Container(
              width: W,
              height: H/2,
        
              child: ImageSlideshow(
        
                indicatorColor: Colors.blue,
                onPageChanged: (value) {
                  debugPrint('Page changed:  value');
                },
                autoPlayInterval: 60000,
                isLoop: true,
                children: [
                  Image.network(
                    'https://res.cloudinary.com/dljwalapq/image/upload/v1700756486/bh7i5dipormjhpgfwey5.jpg',
                    fit: BoxFit.cover,
                  ),
        
                  Image.network(
                    'https://res.cloudinary.com/dljwalapq/image/upload/v1700756486/jrz06ew2x9lxjxg7gabo.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            '''),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: H * 0.23,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ImageSlideshow(
                    indicatorColor: Colors.blue,
                    onPageChanged: (value) {
                      debugPrint('Page changed: $value');
                    },
                    autoPlayInterval: 60000,
                    isLoop: true,
                    children: [
                      Image.network(
                          'https://res.cloudinary.com/dljwalapq/image/upload/v1700756486/bh7i5dipormjhpgfwey5.jpg',
                          fit: BoxFit.fill),
                      Image.network(
                          'https://res.cloudinary.com/dljwalapq/image/upload/v1700756486/jrz06ew2x9lxjxg7gabo.jpg',
                          fit: BoxFit.fill)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: const Text('''
            Container(
                height: H * 0.23,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ImageSlideshow(
                    indicatorColor: Colors.blue,
                    onPageChanged: (value) {
                      debugPrint('Page changed: value');
                    },
                    autoPlayInterval: 60000,
                    isLoop: true,
                    children: [
                      Image.network(
                          'https://res.cloudinary.com/dljwalapq/image/upload/v1700756486/bh7i5dipormjhpgfwey5.jpg',
                          fit: BoxFit.fill),
                      Image.network(
                          'https://res.cloudinary.com/dljwalapq/image/upload/v1700756486/jrz06ew2x9lxjxg7gabo.jpg',
                          fit: BoxFit.fill)
                    ],
                  ),
                ),
              ),
            '''),
              ),
            )
          ],
        ),
      ),
    );
  }
}
