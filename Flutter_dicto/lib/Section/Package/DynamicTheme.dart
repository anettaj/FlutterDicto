import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import '../Form_view.dart';

class DynamicTheme extends StatefulWidget {
  const DynamicTheme({super.key});

  @override
  State<DynamicTheme> createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  bool val=false;
  Color sunColor=Colors.amber;
  Color dayColor=Color(0xff85cbe8);
  Color moonColor=Colors.grey;
  Color nightColor=Color(0xff003265);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        title: const Text(
          'Day Night',
          style: TextStyle(
            color: Colors.white
          ),
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
              Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
              image: val? AssetImage('assets/Templates/DayNight/night.png')
                  :AssetImage('assets/Templates/DayNight/day.png'),
            fit: BoxFit.fill
          )
        ),
        child: Center(
          child: DayNightSwitch(
            value: val,
            moonImage: AssetImage('assets/Templates/DayNight/moon.png'),
            sunImage: AssetImage('assets/Templates/DayNight/cloud.png'),
            sunColor: sunColor,
            moonColor: moonColor,
            dayColor: dayColor,
            nightColor: nightColor,
            onChanged: (value) {
              setState(() {
                val = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
