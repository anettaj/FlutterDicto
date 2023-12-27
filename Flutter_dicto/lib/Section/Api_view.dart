import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/API/ApiRead.dart';
import 'package:flutter_dicto/Section/API/ApiReadApiCall.dart';
import 'package:flutter_dicto/Section/API/ApiWrite.dart';
import 'package:flutter_dicto/Widgets/Size.dart';
import 'package:flutter_dicto/main.dart';



class Api_view extends StatelessWidget {
  Api_view({Key? key}) : super(key: key);


  final List<Widget> ApiCard = <Widget>[
    ApiCards(
      color: Color(0xFFffd22b),
      title: "Api Read",
      link: ApiRead(),
      image: 'assets/images/image1.gif',
    ),
    ApiCards(
      color: Color(0xFFfeb204),
      title: "API read call",
      link:ApiReadCall(),
      image: 'assets/images/image2.png',
    ),
    ApiCards(
      color: Color(0xFFff8503),
      title: "Api Write",
      link:ApiWrite(),
      image: 'assets/images/image1.gif',
    ),
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
          'API',
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
        children: ApiCard,
      ),
    );
  }
}

class ApiCards extends StatelessWidget {
  const ApiCards({
    Key? key,
    required this.color,
    required this.title,
    required this.link,
    required this.image,
  }) : super(key: key);

  final String title;
  final Widget link;
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
              builder: (context) => link,
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
              // child:  Image.asset(
              //   '$image',
              //   fit: BoxFit.fitHeight,
              //
              // ),

            ),
            Positioned(
                child:Container(
                  color: Colors.black45,

                  child: Center(
                    child: Text('$title',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}
