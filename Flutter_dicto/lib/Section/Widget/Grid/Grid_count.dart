import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Widget_view.dart';

class Grid_count extends StatelessWidget {
  const Grid_count({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC69749),
        title: const Text(
          'Grid',
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Widget_card()),
                (route) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                childAspectRatio: (16 /
                    11.8), //Adjust thesize of the containers inside the grid here
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(8, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: const Text('''
            Container(
              margin: EdgeInsets.all(15),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                childAspectRatio: (16 /
                    11.8), //Adjust thesize of the containers inside the grid here
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(8, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  );
                }),
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
