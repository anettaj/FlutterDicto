// import 'package:gap/gap.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dicto/Section/Package_view.dart';
//
// class Gap_package extends StatelessWidget {
//   const Gap_package({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gap Package'),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => Package_view()),
//                 (route) => false);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(children: [
//             Container(
//               color: Colors.amber,
//               height: 100,
//             ),
//             const Gap(10),
//             Container(
//               color: Colors.deepOrange,
//               height: 100,
//             ),
//             const Gap(10),
//             Container(
//               color: Colors.red,
//               height: 100,
//             ),
//             const Gap(10),
//
//             //code
//             Container(
//               color: Colors.white,
//               padding: const EdgeInsets.all(10),
//               child: const Text('''
//       Column(children: [
//           Container(
//             color: Colors.amber,
//             height: 100,
//           ),
//           Gap(10),
//           Container(
//             color: Colors.deepOrange,
//             height: 100,
//           ),
//           Gap(10),
//           Container(
//             color: Colors.red,
//             height: 100,
//           ),
//           ])
//
//
//        '''),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
