import 'package:flutter/material.dart';
import '../Form_view.dart';
import '../Image/data.dart';

class Netflix_design extends StatefulWidget {
  const Netflix_design({super.key});

  @override
  State<Netflix_design> createState() => _Netflix_designState();
}

class _Netflix_designState extends State<Netflix_design> {
  var H;
  var W;

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    H=MediaQuery.of(context).size.height;
    W=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC69749),
        title: const Text(
          'Netflix Gradiant',
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context)=>Form_view()

                ),
                    (route)=>false
            );
          },
          icon: const Icon(
              Icons.arrow_back
          ),
        ),
      ),
        body: Stack(
          children: [
            featuredGameWidget(),
            gradiantBoxWidget()

          ],
        )
    );
  }

  Widget featuredGameWidget(){
    return SizedBox(
        height: H*0.5,
        width: W,
        child:PageView(

          scrollDirection: Axis.horizontal,
          children: featuredGames.map((game){
            return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(game.coverImage.url)
                    )
                ));
          }).toList(),)

    );
  }
  Widget gradiantBoxWidget(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: H*0.80,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Color.fromRGBO(35, 45, 59, 1.0),
                  Colors.transparent

                ],
                stops: [0.65,1.0],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
            )
        ),
      ),
    );
  }
}
