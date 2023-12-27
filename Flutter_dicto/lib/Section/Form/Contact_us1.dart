import 'package:flutter/material.dart';
import 'package:flutter_dicto/Section/Form_view.dart';
class Contact1 extends StatelessWidget {
  const Contact1({super.key});

  @override



    @override
    Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
      var emailController=TextEditingController();
      var nameController=TextEditingController();
      var messageController=TextEditingController();
      var subjectController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC69749),
        title: Text(
          'Contact us1',
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
          icon: Icon(
              Icons.arrow_back
          ),
        ),
      ),
      body: Scaffold(
      backgroundColor: Colors.white,

        body: Container(

          margin: EdgeInsets.all(20),
          child: Column(
            children: [


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
                                //sendData(name, email, subject, message);
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

}

