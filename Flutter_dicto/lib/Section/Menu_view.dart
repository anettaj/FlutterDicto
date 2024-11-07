// import 'package:flutter/material.dart';
// import 'package:flutter_dicto/Section/Menu/Cate1.dart';
// import 'package:flutter_dicto/Widgets/Size.dart';
// import 'package:flutter_dicto/main.dart';
//
// import '../Views/Screens/Menu.dart';
// import 'API/ApiRead.dart';
//
//
// class Menu_view extends StatelessWidget {
//   Menu_view({super.key});
//
//   final List<Widget> fancyCards = <Widget>[
//     FancyCard(
//       color: const Color(0xFFffd22b),
//       title: "scaled_list.dart",
//       link: () => ApiRead(),
//           // /Cate1(),
//       image: 'assets/images/Cate1.png',
//     ),
//     // FancyCard(
//     //   color: Color(0xFFffd22b),
//     //   title: "Image Sliding",
//     //   link: () => Cate1(),
//     //   image: 'assets/images/image1.gif',
//     // ),
//     // FancyCard(
//     //   color: Color(0xFFffd22b),
//     //   title: "Image Sliding",
//     //   link: () => Cate1(),
//     //   image: 'assets/images/image1.gif',
//     // ),
//     // FancyCard(
//     //   color: Color(0xFFffd22b),
//     //   title: "Image Sliding",
//     //   link: () => Cate1(),
//     //   image: 'assets/images/image1.gif',
//     // ),
//     // FancyCard(
//     //   color: Color(0xFFffd22b),
//     //   title: "Image Sliding",
//     //   link: () => Cate1(),
//     //   image: 'assets/images/image1.gif',
//     // ),
//     // FancyCard(
//     //   color: Color(0xFFffd22b),
//     //   title: "Image Sliding",
//     //   link: () => Cate1(),
//     //   image: 'assets/images/image1.gif',
//     // ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFC69749),
//         title: const Text('Menu_view'),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(
//                 builder: (context) => Menu(),
//               ),
//                   (route) => false /* No Back option */,
//             );
//           },
//          icon: const Icon(
//            Icons.arrow_back
//          ),
//         ),
//
//       ),
//       body: ListView(
//         children: fancyCards,
//       ),
//     );
//   }
// }
//
// class FancyCard extends StatelessWidget {
//   const FancyCard({
//     super.key,
//     required this.color,
//     required this.title,
//     required this.link,
//     required this.image,
//   });
//
//   final String title;
//   final Widget Function() link;
//   final Color color;
//   final String image;
//
//   @override
//   Widget build(BuildContext context) {
//     double H= ScreenSize.Height(context);
//     double W= ScreenSize.Height(context);    return Container(
//       margin: const EdgeInsets.all(20.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(
//               builder: (context) => link(),
//             ),
//                 (route) => false /* No Back option */,
//           );
//         },
//         child: Stack(
//           children: <Widget>[
//             Container(
//
//               color: color,
//               height: H/3,
//               width:W,
//               alignment: AlignmentDirectional.center,
//               child: Image.asset(image,
//                 fit: BoxFit.fitHeight,
//               ),
//
//             ),
//             Positioned(
//                 child:Container(
//                   color: Colors.black45,
//
//                   child: Center(
//                     child: Text(title,
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold
//                       ),),
//                   ),
//                 )
//             ),
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
