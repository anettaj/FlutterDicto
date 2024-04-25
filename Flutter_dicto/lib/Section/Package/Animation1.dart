import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../Package_view.dart';

class Animation1 extends StatefulWidget {
  const Animation1({super.key});

  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget and Text animation Package'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Package_view()),
                    (route) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 195,
                key: const ValueKey('d'),
                color: Color(0xff4a7ba6),
                child: WidgetAnimator(
                  incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
                      duration: Duration(seconds: 1),
                      delay: Duration(milliseconds: 2750),
                      curve: Curves.bounceOut
                  ),
                  atRestEffect: WidgetRestingEffects.rotate(
                      effectStrength: 1,
                      curve: Curves.linear),
                  child: const Icon(
                      Icons.sports_baseball,
                      color: Color(0xfffff9d4),
                      size: 48
                  )
                ),
              ),
              WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingSlideInFromRight(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeIn
                ),
                atRestEffect: WidgetRestingEffects.rotate(
                  duration: Duration(seconds: 1),
                  numberOfPlays: 1
                ),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  color: Color(0xffc9ffc7),
                ),
              ),

              RowCube(color1: Color(0xffb4b6de), color2: Color(0xffffdbdb),),
              RowCube(color1: Color(0xfffff9d4), color2: Color(0xffffcea5),)
            ],
          ),
          Positioned(
            left: 150,
            top: 490,
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
                duration: Duration(seconds: 2),
                curve: Curves.easeInOutBack
              ),
              atRestEffect: WidgetRestingEffects.rotate(
                  effectStrength: 1,
                  curve: Curves.bounceIn
              ),
              child: Container(
              width: 80,
              height: 80,

                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0, 2),
                      blurRadius: 20,
                      spreadRadius: 0.8,

                    ),
                    
                  ]
                ),
            ),
            ),
          ),
          Positioned(
            left: 120,
            top: 200,
            child: TextAnimator(
            'Sample',
            atRestEffect: WidgetRestingEffects.wave(effectStrength: 5),
            style: TextStyle(
              fontSize: 50
            ),
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
                blur: const Offset(2, 20), scale: 2),
            textAlign: TextAlign.center,
          ),
        ),
        ],
      ),
    );
  }
}

class RowCube extends StatelessWidget {
  const RowCube({
    super.key, required this.color1, required this.color2,
  });
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
           color: color1,
            width: double.infinity,
            height: 180,
          ),
        ),
        Expanded(
          child: Container(
            color: color2,
            width: double.infinity,
            height: 180,
          ),
        ),
      ],
    );
  }
}
