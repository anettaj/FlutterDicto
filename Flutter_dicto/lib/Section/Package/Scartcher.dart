import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Package_view.dart';
import 'package:scratcher/scratcher.dart';

class ScratcherCard extends StatefulWidget {
  const ScratcherCard({super.key});

  @override
  State<ScratcherCard> createState() => _ScratcherCardState();
}

class _ScratcherCardState extends State<ScratcherCard> {
  String? value;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final scratchKey = GlobalKey<ScratcherState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scratcher Package'),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Scratcher(
              key: scratchKey,
              brushSize: 30,
              threshold: 50,
              color: Colors.grey,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Santa.gif'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$value',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (newValue) {
                      // Update the entered text when typing
                      // No need to store enteredText separately
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Update the value variable only when the "Load" button is pressed
                    value = textController.text;
                    scratchKey.currentState?.reset(
                      duration: const Duration(milliseconds: 200),
                    );

                    // Clear the text in the TextField
                    textController.clear();
                  });
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(20),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                child: const Text(
                  'Load',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
