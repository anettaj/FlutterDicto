import 'package:flutter/material.dart';

import '../../main.dart';
import '../Api_view.dart';

class ApiWrite extends StatelessWidget {
  const ApiWrite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC69749),
        title: Text(
          'Api Write',
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context)=>Api_view()

                ),
                    (route)=>false
            );
          },
          icon: Icon(
              Icons.arrow_back
          ),
        ),
      ),
      body:Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  '''
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Widget/Contact_us/Contact_card.dart';

class Contact_us extends StatefulWidget {
  const Contact_us({Key? key}) : super(key: key);

  @override
  State<Contact_us> createState() => _Contact_usState();
}

class _Contact_usState extends State<Contact_us> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var nameController=TextEditingController();
    var messageController=TextEditingController();
    var subjectController=TextEditingController();
    return Scaffold(
          appBar: AppBar(
            title: Text('TNDC-Contact Us'),
            backgroundColor: Color(0xFF252493),
          ),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Contact_card(),

                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Leave Your Message',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            //name-start
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Text('Your Name')),
                            ),
                            //name-end
                            SizedBox(
                              height: 10,
                            ),
                            //email-start
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Text('Your Email Id')),
                            ),
                            //email-end
                            SizedBox(
                              height: 10,
                            ),
                            //subject-start
                            TextFormField(
                              controller: subjectController,

                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Text('Your Subject')),
                            ),
                            //subject-end
                            SizedBox(
                              height: 10,
                            ),
                            //message-start
                            TextFormField(
                              controller: messageController,
                              decoration: InputDecoration(
                                floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                                contentPadding: EdgeInsets.only(
                                    top: 0, left: 10, bottom: 90),
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                label: Text(
                                  'Your Message',
                                  //textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            //message-end
                            SizedBox(
                              height: 20,
                            ),
                            FilledButton(
                              onPressed: () {
                                if (_formKey.currentState != null &&
                                    _formKey.currentState!.validate()) {
                                  // Form is valid, get the form data
                                  String name = nameController.text;
                                  String email = emailController.text;
                                  String subject = subjectController.text;
                                  String message = messageController.text;

                                  // Check if any fields are empty
                                  if (name.isEmpty || email.isEmpty || subject.isEmpty || message.isEmpty) {
                                    // Show an AlertDialog or SnackBar indicating that fields must be filled
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text('Please fill all the fields.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    // All fields are filled, send the data
                                    sendData(name, email, subject, message);
                                  }
                                }
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(fontSize: 18),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.all(15)),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Color(0xFF252493)),
                                minimumSize:
                                MaterialStateProperty.all<Size>(Size(10, 10)),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void sendData(String name, String email, String subject, String message) async {
    final response = await http.post(
          Uri.parse('http://atstesting.in/app/contact.php'),
          body: {
            'name': name,
            'email': email,
            'subject': subject,
            'message': message,
          },
    );
    if (response.statusCode == 200) {
          // Successful response, handle accordingly
          print('Data sent successfully');
          print('Response: ');

          // Show a SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Message was sent successfully'),
              duration: Duration(seconds: 2), // Optional: Set the duration for the SnackBar
            ),
          );
    } else {
          // Error handling
          print('Failed to send data. Status code: ');
          print('Response: ');
    }
  }}
                  '''
                // print('Response: ${response.body}');
                //   print('Failed to send data. Status code: ${response.statusCode}');
              ),
            ),
          ),
        ),
      ),
    );
  }
}
