import 'package:flutter/material.dart';
import 'ApiKey/ApiKey.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Views/Screens/Menu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: ApiKey.apiKey,
      appId: ApiKey.appId,
      messagingSenderId: ApiKey.messagingSenderId,
      projectId: ApiKey.projectId,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dictionary',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        iconTheme: IconThemeData(
           color: Colors.white
        ),
        scaffoldBackgroundColor: const Color(0xFF2C3333),
      ),

      home: Menu(),
    );
  }
}






// class MyHomePage extends StatelessWidget {
//   MyHomePage({super.key});
//
//   final List<Widget> fancyCards = <Widget>[
//     FancyCard(
//       title: "Package view",
//       link: Package_view(),
//     ),
//     FancyCard(
//       title: "Image View",
//       link: Image_view(),
//     ),
//     FancyCard(
//       title: "Menu view",
//       link: Menu_view(),
//     ),
//     FancyCard(
//       title: "Widget view",
//       link: Widget_card(),
//     ),
//     FancyCard(
//       title: "API view",
//       link: Api_view(),
//     ),
//     FancyCard(
//       title: "Readymade view",
//       link: Form_view(),
//     ),
//     FancyCard(
//       title: "Popup view",
//       link: Popup_view(),
//     ),
//
//     // FancyCard(
//     //   title: "Web view",
//     //   link: WebViewExample(),
//     // ),
//     // FancyCard(
//     //   title: "PDF Viewer",
//     //   link: Pdf_viewer(),
//     // ),
//
//     // FancyCard(
//     //   title: "ExpansionTile",
//     //   link: Expansion_card(),
//     // ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     double H = ScreenSize.Height(context);
//     double W = ScreenSize.Height(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFC69749),
//         title: const Text('Flutter Dicto'),
//       ),
//       body: StackedCardCarousel(
//         items: fancyCards,
//       ),
//     );
//   }
// }
//
// class FancyCard extends StatelessWidget {
//   const FancyCard({
//     super.key,
//     required this.title,
//     required this.link,
//   });
//
//   final String title;
//   final Widget link;
//
//   @override
//   Widget build(BuildContext context) {
//     double H = MediaQuery.of(context).size.height;
//     double W = MediaQuery.of(context).size.width;
//     return Container(
//       margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
//       child: InkWell(
//         onTap: () {
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => link,
//           ));
//         },
//         child: Stack(
//           children: <Widget>[
//             Image.asset(
//               'assets/images/Folder.png',
//               fit: BoxFit.fill,
//               height: H * 0.45,
//             ),
//             Positioned(
//               top: H / 8,
//               left: H / 8,
//               right: H / 9,
//               child: Center(
//                 child: Text(
//                   title,
//                   style: Theme.of(context).textTheme.headlineSmall,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
