// import 'package:day_night_switch/day_night_switch.dart';
// import 'package:flutter/material.dart';
// import '../Form_view.dart';
//
// class DayAndNight extends StatefulWidget {
//   const DayAndNight({super.key});
//
//   @override
//   State<DayAndNight> createState() => _DayAndNightState();
// }
//
// class _DayAndNightState extends State<DayAndNight> {
//   bool val=false;
//   Color sunColor=Colors.amber;
//   Color dayColor=const Color(0xff85cbe8);
//   Color moonColor=Colors.grey;
//   Color nightColor=const Color(0xff003265);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor:Colors.transparent,
//         title: const Text(
//           'Day Night',
//           style: TextStyle(
//             color: Colors.white
//           ),
//         ),
//         leading: IconButton(
//           onPressed: (){
//             Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context)=>Form_view()
//
//                 ),
//                     (route)=>false
//             );
//           },
//           icon: const Icon(
//               Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image:DecorationImage(
//               image: val? const AssetImage('assets/Package/DayNight/night.png')
//                   :const AssetImage('assets/Package/DayNight/day.png'),
//             fit: BoxFit.fill
//           )
//         ),
//         child: Center(
//           child: DayNightSwitch(
//             value: val,
//             moonImage: const AssetImage('assets/Package/DayNight/moon.png'),
//             sunImage: const AssetImage('assets/Package/DayNight/cloud.png'),
//             sunColor: sunColor,
//             moonColor: moonColor,
//             dayColor: dayColor,
//             nightColor: nightColor,
//             onChanged: (value) {
//               setState(() {
//                 val = value;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
