import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WebTemplate extends StatefulWidget {
  const WebTemplate({super.key});

  @override
  State<WebTemplate> createState() => _WebTemplateState();
}

class _WebTemplateState extends State<WebTemplate> {
  // Function to copy code to clipboard
  void copyToClipboard(String code) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Code copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('FlutterLibrary')
            .where('category', isEqualTo: 'Web')
            .snapshots(),
        builder: (context, snapshot) {
          // Check for the connection state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle errors from Firestore
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          }

          // Check if there's data, otherwise display a message
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No web templates found'));
          }

          // Data loaded successfully
          var webTemplates = snapshot.data!.docs;

          return LayoutBuilder(
            builder: (context, constraints) {
              // Calculate the number of columns based on screen width
              int columns = constraints.maxWidth < 600 ? 1 : 2; // Adjust based on screen size
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.5,
                ),
                itemCount: webTemplates.length,
                itemBuilder: (context, index) {
                  var templateData = webTemplates[index].data() as Map<String, dynamic>;
                  String imageLink = templateData['imageLink'] ?? '';
                  String code = templateData['code'] ?? '';

                  return MouseRegion(
                    onEnter: (_) {},
                    onExit: (_) {},
                    child: GestureDetector(
                      onTap: () => copyToClipboard(code),
                      child: GridTile(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(imageLink),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  foregroundColor: Colors.grey,
                                  child: IconButton(
                                    icon: const Icon(Icons.copy),
                                    color: Colors.black,
                                    onPressed: () => copyToClipboard(code),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
